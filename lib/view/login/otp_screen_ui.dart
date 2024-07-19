import 'package:flutter/widgets.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/view_model/login/login_view_model.dart';
import 'package:mera_partners/widgets/custom_appbar.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  LoginScreenViewModel loginScreenViewModel =
      Get.isRegistered<LoginScreenViewModel>()
          ? Get.find<LoginScreenViewModel>()
          : Get.put(LoginScreenViewModel());

  // late final SmsRetrieverImpl smsRetrieverImpl;
  @override
  void initState() {
    loginScreenViewModel.otpValue.value = "";
    loginScreenViewModel.startTimer(60);
    loginScreenViewModel.listenOtp();
    loginScreenViewModel.otpFocusNode.addListener(() {
      setState(() {
        
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (loginScreenViewModel.timer != null) {
      loginScreenViewModel.timer!.cancel();
    }
    loginScreenViewModel.otpValue.value = "";
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: MyStrings.otpVerification),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0,top: 28),
              child: Text(
                MyStrings.otpDesc,
                style: MyStyles.subTitleGreayStyle,
              ),
            ),
            SizedBox(
              height: Dimens.standard_24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PinFieldAutoFill(
                focusNode: loginScreenViewModel.otpFocusNode,
                currentCode: loginScreenViewModel.otpValue.value,
                keyboardType: TextInputType.text,
                enableInteractiveSelection: false,
                decoration: BoxLooseDecoration(
                  textStyle: const TextStyle(fontSize: 20, color: MyColors.black, fontWeight: FontWeight.w600),
                  strokeColorBuilder: PinListenColorBuilder(MyColors.kPrimaryColor, MyColors.grey),
                  bgColorBuilder: const FixedColorBuilder(Colors.transparent),
                  radius: const Radius.circular(12.0)
                ),
                codeLength: 4,
                  onCodeChanged: (value) {
                    loginScreenViewModel.otpValue.value = value!;
                    if(value.length == 4){
                        loginScreenViewModel.otpFocusNode.unfocus();
                        loginScreenViewModel.buttonDisable.value = false;
                    } else {
                        loginScreenViewModel.buttonDisable.value = true;
                    }
                  },
                  onCodeSubmitted: (val){
                    loginScreenViewModel.otpFocusNode.unfocus();
                  },
                ),
            ),
            // Directionality(
            //       textDirection: TextDirection.ltr, // set this property
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            //         child: Center(
            //           child: PinCodeTextField(
            //             length: 4,
            //             obscureText: false,
            //             animationType: AnimationType.fade,
            //             backgroundColor: Colors.white,
            //             keyboardType: TextInputType.number,
            //             pinTheme: PinTheme(
            //               shape: PinCodeFieldShape.box,
            //               borderRadius: BorderRadius.circular(10),
            //               borderWidth: 1,
            //               selectedFillColor: Colors.white,
            //               selectedColor: MyColors.kPrimaryColor,
            //               inactiveColor: MyColors.kPrimaryColor,
            //               inactiveFillColor: Colors.white,
            //               fieldHeight: 60,
            //               fieldWidth: 60,
            //               activeFillColor: Colors.white,
            //             ),
            //             animationDuration: const Duration(milliseconds: 300),
            //             enableActiveFill: true,
            //             errorAnimationController: null,
            //             controller: loginScreenViewModel.otpController,
            //             focusNode: loginScreenViewModel.otpFocusNode,
            //             onCompleted: (v) {
            //               loginScreenViewModel.otpFocusNode.unfocus();
            //             },
            //             onChanged: (value) {
            //               // pinController.text = value;
            //               loginScreenViewModel.otpValue.value = value!;
            //               if(value.length == 4){
            //                   loginScreenViewModel.otpFocusNode.unfocus();
            //                   loginScreenViewModel.buttonDisable.value = false;
            //               } else {
            //                   loginScreenViewModel.buttonDisable.value = true;
            //               }
            //             },
            //             beforeTextPaste: (text) {
            //               //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //               //but you can show anything you want here, like your pop up saying wrong paste format or etc
            //               return true;
            //             },
            //             appContext: context,
            //           ),
            //         ),
            //       ),
            //     ),
            SizedBox(
              height: Dimens.standard_24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Obx(() {
                if (loginScreenViewModel.resend.value == true) {
                  return Row(
                    children: [
                      const Text(
                      MyStrings.receiveOTP,
                      style: MyStyles.subTitleGreayStyle,
                    ),
                      GestureDetector(
                        onTap: () async {
                          loginScreenViewModel.mobileLogin();
                          loginScreenViewModel.startTimer(60);
                          loginScreenViewModel.resend.value = false;
                        },
                        child: const Text(
                          MyStrings.resendOTP,
                          style: MyStyles.primary14500,
                        ),
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    const Text(
                      MyStrings.requestOTP,
                      style: MyStyles.subTitleGreayStyle,
                    ),
                    Text(
                      loginScreenViewModel.time.value,
                      style: MyStyles.red14400,
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          height: 100,
          padding: const EdgeInsets.only(left: 16, right: 16),
          alignment: Alignment.center,
          child: CustomElevatedButton(
              textColor: MyColors.white,
              elevation: 0,
              buttonColor: MyColors.kPrimaryColor.withOpacity(
                  (loginScreenViewModel.buttonDisable.value) ? 0.3 : 1),
              buttonText: MyStrings.verify,
              onPressed: () {
                if (loginScreenViewModel.buttonDisable.value == false) {
                  loginScreenViewModel.verifyOTP(context);
                } else {
                  CustomToast.instance.showMsg(MyStrings.validOTP);
                }
              }),
        );
      }),
    );
  }
}