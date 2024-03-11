import 'dart:async';
import 'dart:developer';

import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/utils/shared_pref_manager.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

class LoginScreenViewModel extends GetxController {
  //login
  final loginForm = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  //otp
  RxBool buttonDisable = true.obs;
  
  final TextEditingController otpTextField1 = TextEditingController();
  final TextEditingController otpTextField2 = TextEditingController();
  final TextEditingController otpTextField3 = TextEditingController();
  final TextEditingController otpTextField4 = TextEditingController();

  Timer? timer;
  final time = '00.00'.obs;
  int remainingSeconds = 1;
  RxBool resend = false.obs;

  startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
        resend.value = true;
      }else{
        int minutes = remainingSeconds~/60;
        int seconds = (remainingSeconds%60);
        time.value = minutes.toString().padLeft(2, "0")+
        ":"+seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }


  //API Integration
  Future<void> mobileLogin() async {
    try {
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login),
          body: {"contactNo": mobileController.value.text});

      if (response.statusCode == 200) {
        log(response.body.toString());
      }else{
        CustomToast.instance.showMsg(MyStrings.invalidMobileNumber);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  Future<void> verifyOTP() async {
    try {
      String otp = otpTextField1.value.text.toString() + otpTextField2.value.text.toString() + otpTextField3.value.text.toString() + otpTextField4.value.text.toString();
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.verifyOtp),
          body: {
            "contactNo": mobileController.value.text,
            "otp": otp
          });

      if (response.statusCode == 200) {
        log(response.body.toString());
        SharedPrefManager.instance.setStringAsync(Constants.phoneNum, mobileController.value.text);
        globals.contactNo =int.parse(mobileController.value.text.toString());
      }else{
        CustomToast.instance.showMsg(MyStrings.invalidOTP);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

}