import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:mera_partners/model/response/user_data/user_info_response.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/service/firebase_push_notifications.dart';
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
  //API Integration
  Future<void> mobileLogin() async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var appSignatureID = await SmsAutoFill().getAppSignature;
      // var appSignatureID = "";
      print("Signature ID: "+ appSignatureID.toString());
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login), 
      body: {"contactNo": mobileController.value.text,
            "number": appSignatureID.toString()});
      String? message = json.decode(response.body)['message'];
      if (response.statusCode == 200) {
        if (globals.fcmToken == null || globals.fcmToken == '') {
          await PushNotifications.getDeviceToken();
        }
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
        Get.toNamed(AppRoutes.otpScreen);
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(message ?? MyStrings.invalidMobileNumber);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  clearData(){
    SharedPrefManager.instance.removeStringAsync(Constants.userName);
    SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
    SharedPrefManager.instance.removeStringAsync(Constants.email);
    SharedPrefManager.instance.removeStringAsync(Constants.contactNo);
    SharedPrefManager.instance.removeStringAsync(Constants.token);
    SharedPrefManager.instance.removeStringAsync(Constants.fcmToken);
    SharedPrefManager.instance.removeStringAsync(Constants.userId);
    SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
    SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    // listenForCode();
    await SmsAutoFill().listenForCode();
    print("OTP listen Called");
  }

  Future<void> verifyOTP(BuildContext context) async {
    try {
      ProgressBar.instance.showProgressbar(context);
      var headers = {
        'Content-Type': 'application/json'
      };
      String otp = otpValue.value;
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.verifyOtp), body: jsonEncode({"contactNo": int.parse(mobileController.value.text), "otp": int.parse(otp)}),headers: headers);
      if (response.statusCode == 200) {
        clearData(); 
        globals.clearData();
        globals.uniqueUserId = null;
        globals.jsonHeaders = {};
        ProgressBar.instance.stopProgressBar(context);
        log(response.body.toString());
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
          SharedPrefManager.instance.setStringAsync(Constants.userId, userInfoResponse.value.data!.first.userId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.uniqueUserId, userInfoResponse.value.data!.first.sId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, userInfoResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, userInfoResponse.value.data!.first.isDeposited ?? false);
          SharedPrefManager.instance.setBoolAsync(Constants.addressProofFront, userInfoResponse.value.data?.first.addressProofFront != null ? true : false);

          globals.contactNo = userInfoResponse.value.data?.first.contactNo;
          globals.phoneNum = userInfoResponse.value.data?.first.contactNo.toString();
          globals.email = userInfoResponse.value.data?.first.email;
          globals.token = userInfoResponse.value.meta?.access;
          globals.userId = userInfoResponse.value.data?.first.userId;
          globals.uniqueUserId = userInfoResponse.value.data?.first.sId;
          globals.documentStatus = userInfoResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = userInfoResponse.value.data?.first.isDeposited;
          globals.addressProofFront = userInfoResponse.value.data?.first.addressProofFront != null ? true : false;
          globals.headers = {'Authorization': 'Bearer ${globals.token}'};
          globals.jsonHeaders = {'Content-Type': 'application/json','Authorization': 'Bearer ${globals.token}',};
          try {
            if (!userInfoResponse.value.data!.first.fcmNotification!.fcmToken!.contains(globals.fcmToken)) {
                        await PushNotifications.saveToken(token: globals.fcmToken);
                      }
          } catch (e) {
            log(e.toString());
            await PushNotifications.saveToken(token: globals.fcmToken);
          }

          if((globals.isOnboarding == null || globals.isOnboarding == false) && !DateTime.parse(userInfoResponse.value.data!.first.createdAt!).toLocal().isBefore(DateTime.now())){
            SharedPrefManager.instance.setBoolAsync(Constants.isOnboarding, true);
            Get.offAllNamed(AppRoutes.onboardingScreen);
          } else if (userInfoResponse.value.data?.first.isDocumentsVerified != null && (userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.SUBMITTED.name || userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.VERIFIED.name) && userInfoResponse.value.data?.first.isDeposited != null && userInfoResponse.value.data?.first.isDeposited == true) {
            Get.offAllNamed(AppRoutes.homeScreen);
          }  else if(userInfoResponse.value.data?.first.isDocumentsVerified != null && (userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.VERIFIED.name || userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.SUBMITTED.name) && userInfoResponse.value.data?.first.isDeposited == false ){
            Get.offAllNamed(AppRoutes.documentScreen,arguments: 3);
          }else if(userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.NOTSUBMITTED.name){
            Get.offAllNamed(AppRoutes.documentScreen,arguments: 0);
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
