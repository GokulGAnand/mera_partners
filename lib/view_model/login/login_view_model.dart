import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/model/response/user_data/user_info_response.dart';
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
import '../../routes/app_routes.dart';

class LoginScreenViewModel extends GetxController {
  //login
  final loginForm = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  //otp
  RxBool buttonDisable = true.obs;
  var userInfoResponse = UserInfoResponse().obs;

  final TextEditingController otpTextField1 = TextEditingController();
  final TextEditingController otpTextField2 = TextEditingController();
  final TextEditingController otpTextField3 = TextEditingController();
  final TextEditingController otpTextField4 = TextEditingController();

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
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login), body: {"contactNo": mobileController.value.text});

      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
        Get.toNamed(AppRoutes.otpScreen);
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(MyStrings.invalidMobileNumber);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  Future<void> verifyOTP(BuildContext context) async {
    try {
      ProgressBar.instance.showProgressbar(context);
      String otp = otpTextField1.value.text.toString() + otpTextField2.value.text.toString() + otpTextField3.value.text.toString() + otpTextField4.value.text.toString();
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.verifyOtp), body: {"contactNo": mobileController.value.text, "otp": otp});

      if (response.statusCode == 200) {
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
          SharedPrefManager.instance.setStringAsync(Constants.token, userInfoResponse.value.meta!.access.toString());
          SharedPrefManager.instance.setStringAsync(Constants.userId, userInfoResponse.value.data!.first.userId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.uniqueUserId, userInfoResponse.value.data!.first.sId.toString());
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, userInfoResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, userInfoResponse.value.data!.first.isDeposited ?? false);
          SharedPrefManager.instance.setBoolAsync(Constants.addressProofFront, userInfoResponse.value.data?.first.addressProofFront != null ? true : false);

          globals.contactNo = userInfoResponse.value.data?.first.contactNo;
          globals.phoneNum = userInfoResponse.value.data?.first.contactNo.toString();
          globals.token = userInfoResponse.value.meta?.access;
          globals.userId = userInfoResponse.value.data?.first.userId;
          globals.uniqueUserId = userInfoResponse.value.data?.first.sId;
          globals.documentStatus = userInfoResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = userInfoResponse.value.data?.first.isDeposited;
          globals.addressProofFront = userInfoResponse.value.data?.first.addressProofFront != null ? true : false;
          
          if (userInfoResponse.value.data?.first.isDocumentsVerified != null && userInfoResponse.value.data?.first.isDocumentsVerified == DocumentStatus.SUBMITTED.name && userInfoResponse.value.data?.first.isDeposited != null && userInfoResponse.value.data?.first.isDeposited == true) {
            Get.toNamed(AppRoutes.homeScreen);
          }  else if (userInfoResponse.value.data?.first.isDocumentsVerified?.toLowerCase() == DocumentStatus.NOTSUBMITTED.name.toLowerCase() || userInfoResponse.value.data?.first.addressProofFront == null) {
            Get.toNamed(AppRoutes.documentScreen);
          } else if (userInfoResponse.value.data?.first.fullname == null) {
            Get.toNamed(AppRoutes.onboardingScreen);
          }else {
            Get.toNamed(AppRoutes.documentScreen);
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
