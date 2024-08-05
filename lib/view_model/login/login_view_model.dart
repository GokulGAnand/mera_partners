import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:mera_partners/model/response/user_data/user_info_response.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:mera_partners/widgets/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:sms_autofill/sms_autofill.dart';
import '../../routes/app_routes.dart';
import '../../service/notification_service.dart';

class LoginScreenViewModel extends GetxController {
  //login
  final loginForm = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  //otp
  RxBool buttonDisable = true.obs;
  var userInfoResponse = UserInfoResponse().obs;

  FocusNode otpFocusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  RxString otpValue = "".obs;

  Timer? timer;
  final time = '00.00'.obs;
  int remainingSeconds = 1;
  RxBool resend = false.obs;

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        resend.value = true;
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  String? parseCookies(String? cookieString, String cookieName) {
    if (cookieString == null) return null;
    List<String> cookies = cookieString.split(';');
    for (var cookie in cookies) {
      if (cookie.trim().startsWith('$cookieName=')) {
        return cookie.trim().split('=')[1];
      }
    }
    return null;
  }

  //API Integration
  Future<void> mobileLogin() async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var appSignatureID = await SmsAutoFill().getAppSignature;
      // var appSignatureID = "";
      log("Signature ID: $appSignatureID");
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login), body: {"contactNo": mobileController.value.text, "number": appSignatureID.toString()});
      String? message = json.decode(response.body)['message'];
      log(response.body);
      if (response.statusCode == 200) {
        if (globals.fcmToken == null || globals.fcmToken == '') {
          await NotificationService.getDeviceToken();
        }
        ProgressBar.instance.stopProgressBar(Get.context!);
        Get.toNamed(AppRoutes.otpScreen);
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(message ?? MyStrings.invalidMobileNumber);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg('Your account has been deleted. Please contact admin');
    }
  }

  clearData() {
    SharedPrefManager.instance.removeStringAsync(Constants.userName);
    SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
    SharedPrefManager.instance.removeStringAsync(Constants.email);
    SharedPrefManager.instance.removeStringAsync(Constants.contactNo);
    SharedPrefManager.instance.removeStringAsync(Constants.token);
    SharedPrefManager.instance.removeStringAsync(Constants.refreshToken);
    SharedPrefManager.instance.removeStringAsync(Constants.fcmToken);
    SharedPrefManager.instance.removeStringAsync(Constants.userId);
    SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
    SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    // listenForCode();
    await SmsAutoFill().listenForCode();
    log("OTP listen Called");
  }

  Future<void> verifyOTP(BuildContext context) async {
    try {
      ProgressBar.instance.showProgressbar(context);
      String otp = otpValue.value;
      var response = await ApiManager.post(endpoint: EndPoints.verifyOtp, body: {"contactNo": int.parse(mobileController.value.text), "otp": int.parse(otp)});
      if (response.statusCode == 200) {
        var refreshToken = parseCookies(response.headers['set-cookie'], 'refreshToken');
        if (refreshToken != null) {
          log(refreshToken);
        }
        clearData();
        globals.clearData();
        globals.uniqueUserId = null;
        globals.jsonHeaders = {};
        ProgressBar.instance.stopProgressBar(context);
        userInfoResponse.value = UserInfoResponse.fromJson(jsonDecode(response.body));
        if (userInfoResponse.value.data != null) {
          if (userInfoResponse.value.data?.first.fullname != null) {
            globals.userName = userInfoResponse.value.data?.first.fullname;
            SharedPrefManager.instance.setStringAsync(Constants.userName, userInfoResponse.value.data!.first.fullname.toString());
          }

          SharedPrefManager.instance.setStringAsync(Constants.phoneNum, mobileController.value.text);
          SharedPrefManager.instance.setStringAsync(Constants.contactNo, userInfoResponse.value.data!.first.contactNo.toString());
          SharedPrefManager.instance.setStringAsync(Constants.email, userInfoResponse.value.data!.first.email.toString());
          SharedPrefManager.instance.setStringAsync(Constants.token, userInfoResponse.value.meta!.access.toString());
          SharedPrefManager.instance.setStringAsync(Constants.refreshToken, refreshToken ?? '');
          SharedPrefManager.instance.setStringAsync(Constants.userId, userInfoResponse.value.data!.first.userId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.uniqueUserId, userInfoResponse.value.data!.first.sId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, userInfoResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, userInfoResponse.value.data!.first.isDeposited ?? false);
          SharedPrefManager.instance.setBoolAsync(Constants.addressProofFront, userInfoResponse.value.data?.first.addressProofFront != null ? true : false);

          globals.contactNo = userInfoResponse.value.data?.first.contactNo;
          globals.phoneNum = userInfoResponse.value.data?.first.contactNo.toString();
          globals.email = userInfoResponse.value.data?.first.email;
          globals.token = userInfoResponse.value.meta?.access;
          globals.refreshToken = refreshToken;
          globals.userId = userInfoResponse.value.data?.first.userId;
          globals.uniqueUserId = userInfoResponse.value.data?.first.sId;
          globals.documentStatus = userInfoResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = userInfoResponse.value.data?.first.isDeposited;
          globals.addressProofFront = userInfoResponse.value.data?.first.addressProofFront != null ? true : false;
          ApiManager.instance.updateAuthToken(userInfoResponse.value.meta!.access.toString(), refreshToken ?? "");
          globals.headers = {'Authorization': 'Bearer ${globals.token}'};
          globals.jsonHeaders = {'Content-Type': 'application/json','Authorization': 'Bearer ${globals.token}',};
          try {
            if (!userInfoResponse.value.data!.first.fcmNotification!.fcmToken!.contains(globals.fcmToken)) {
              await NotificationService.saveToken(token: globals.fcmToken);
            }
          } catch (e) {
            log(e.toString());
            await NotificationService.saveToken(token: globals.fcmToken);
          }

          if ((globals.isOnboarding == null || globals.isOnboarding == false) && (userInfoResponse.value.data?.first.isCreated == true || !DateTime.parse(userInfoResponse.value.data!.first.createdAt!).toLocal().isBefore(DateTime.now()))) {
            SharedPrefManager.instance.setBoolAsync(Constants.isOnboarding, true);
            Get.offAllNamed(AppRoutes.onboardingScreen);
          } else if (userInfoResponse.value.data?.first.isDocumentsVerified != null && (userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.SUBMITTED.name || userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.VERIFIED.name) && userInfoResponse.value.data?.first.isDeposited != null && userInfoResponse.value.data?.first.isDeposited == true) {
            Get.offAllNamed(AppRoutes.homeScreen);
          } else if (userInfoResponse.value.data?.first.isDocumentsVerified != null && (userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.VERIFIED.name || userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.SUBMITTED.name) && userInfoResponse.value.data?.first.isDeposited == false) {
            Get.offAllNamed(AppRoutes.documentScreen, arguments: 3);
          } else if (userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.NOTSUBMITTED.name) {
            Get.offAllNamed(AppRoutes.documentScreen, arguments: 0);
          } else {
            Get.offAllNamed(AppRoutes.documentScreen);
          }
        }
      } else {
        ProgressBar.instance.stopProgressBar(context);
        CustomToast.instance.showMsg(MyStrings.invalidOTP);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(context);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
