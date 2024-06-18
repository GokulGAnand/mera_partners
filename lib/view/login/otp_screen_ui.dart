import 'package:flutter/services.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/view_model/login/login_view_model.dart';
import 'package:mera_partners/widgets/custom_appbar.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

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

  @override
  void initState() {
    loginScreenViewModel.startTimer(60);
    loginScreenViewModel.otpFocusNode.addListener((){
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    if (loginScreenViewModel.timer != null) {
      loginScreenViewModel.timer!.cancel();
    }
    loginScreenViewModel.otpTextField.clear();
    // loginScreenViewModel.
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                alignment: Alignment.center,
                child: Pinput(
                          defaultPinTheme:  PinTheme(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 62,
                            textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: MyColors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(12.0),),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 62,
                            textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: MyColors.kPrimaryColor, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(12.0),),
                            ),
                          ),
                          length: 4,
                          onChanged: (value) {
                            if(value.length == 4){
                              loginScreenViewModel.buttonDisable.value = false;
                            } else {
                              loginScreenViewModel.buttonDisable.value = true;
                            }
                          },
                          pinAnimationType: PinAnimationType.none,
                          isCursorAnimationEnabled: false,
                          controller: loginScreenViewModel.otpTextField,
                          focusNode: loginScreenViewModel.otpFocusNode,
                          showCursor: true,
                          
                        ),
              ),
            ),
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
