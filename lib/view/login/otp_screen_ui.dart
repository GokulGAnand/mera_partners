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
    super.initState();
  }

  @override
  void dispose() {
    if (loginScreenViewModel.timer != null) {
      loginScreenViewModel.timer!.cancel();
    }
    loginScreenViewModel.otpTextField1.clear();
    loginScreenViewModel.otpTextField2.clear();
    loginScreenViewModel.otpTextField3.clear();
    loginScreenViewModel.otpTextField4.clear();
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
              height: Dimens.standard_10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: otpField(
                        loginScreenViewModel.otpTextField1, true, false)),
                Expanded(
                    child: otpField(
                        loginScreenViewModel.otpTextField2, false, false)),
                Expanded(
                    child: otpField(
                        loginScreenViewModel.otpTextField3, false, false)),
                Expanded(
                    child: otpField(
                        loginScreenViewModel.otpTextField4, false, true)),
              ],
            ),
            SizedBox(
              height: Dimens.standard_10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Obx(() {
                if (loginScreenViewModel.resend.value == true) {
                  return GestureDetector(
                    onTap: () async {
                      loginScreenViewModel.mobileLogin();
                      loginScreenViewModel.startTimer(60);
                      loginScreenViewModel.resend.value = false;
                    },
                    child: const Text(
                      MyStrings.resendOTP,
                      style: MyStyles.red14400,
                    ),
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

  Widget otpField(
    TextEditingController controller,
    bool first,
    bool last,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomTextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          leftPadding: 0.0,
          onChange: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (loginScreenViewModel.otpTextField1.text.isNotEmpty &&
                loginScreenViewModel.otpTextField2.text.isNotEmpty &&
                loginScreenViewModel.otpTextField3.text.isNotEmpty &&
                loginScreenViewModel.otpTextField4.text.isNotEmpty) {
              loginScreenViewModel.buttonDisable.value = false;
            } else {
              loginScreenViewModel.buttonDisable.value = true;
            }
          },
          validator: null),
    );
  }
}
