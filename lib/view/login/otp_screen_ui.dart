import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/login/login_view_model.dart';
import 'package:evaluator_app/widgets/custom_appbar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>{
  LoginScreenViewModel loginScreenViewModel = Get.isRegistered<LoginScreenViewModel>() ? Get.find<LoginScreenViewModel>() : Get.put(LoginScreenViewModel());

  @override
  void initState() {
   loginScreenViewModel.startTimer(60);
    super.initState();
  }

  @override
  void dispose() {
     if(loginScreenViewModel.timer!=null){
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
      appBar: CustomAppBar(title: "OTP Verification"),
    body: SingleChildScrollView(
      child: Padding(
        padding: Dimens.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please enter the phone number we will send the OTP in this phone number.",
              style: MyStyles.subTitleStyle,
            ),
            SizedBox(height: Dimens.standard_10,),
            Row(
              children: [
                Expanded(
                  child: otpField(loginScreenViewModel.otpTextField1, true, false)
                ),
                 Expanded(
                  child: otpField(loginScreenViewModel.otpTextField2, false, false)
                ),
                 Expanded(
                  child: otpField(loginScreenViewModel.otpTextField3, false, false)
                ),
                 Expanded(
                  child: otpField(loginScreenViewModel.otpTextField4, false, true)
                ),
              ],
            ),
            SizedBox(height: Dimens.standard_10,),
            
            Obx(
              () {
                if(loginScreenViewModel.resend.value == true){
             return GestureDetector(
              onTap: () async{
                loginScreenViewModel.mobileLogin();
                loginScreenViewModel.startTimer(60);
                loginScreenViewModel.resend.value = false;
              },
               child: Text('Resend OTP', 
                style: TextStyle(
                    color: MyColors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.standard_14,
                  ),),
             );}
                return Row(
                  children: [
                    Text("Request OTP in ",
                    style:MyStyles.subTitleStyle,),
                    Text('${loginScreenViewModel.time.value}', 
                  style: TextStyle(
                      color: MyColors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.standard_14,
                    ),)
                  ],
                );
              }
            ),
             
          ],
        ),
      ),
    ),
     bottomNavigationBar: Obx(
       () {
         return Container(
          height: 100,
          padding: EdgeInsets.only(left: 16, right: 16),
          alignment: Alignment.center,
          child: CustomElevatedButton(
                textColor: MyColors.white, 
                buttonColor: MyColors.kPrimaryColor.withOpacity((loginScreenViewModel.buttonDisable.value)?0.25:1),
                buttonText: "Verify",
                onPressed: () {
                  if(loginScreenViewModel.buttonDisable.value == false){
                    loginScreenViewModel.verifyOTP();
                  } else {
                    CustomToast.instance.showMsg("Please enter valid OTP");
                  }
                }),
             );
       }
     ),
    );
  }


  Widget otpField(TextEditingController controllerr, bool first, bool last,){
    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: CustomTextFormField(
                        controller: controllerr, 
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        leftPadding: 0.0,
                        textFieldStyle: MyStyles.titleStyle,
                        onChange: (value) {
                          if (value.length == 1 && last == false) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.length == 0 && first == false) {
                            FocusScope.of(context).previousFocus();
                          }
                          if(loginScreenViewModel.otpTextField1.text.isNotEmpty &&
                          loginScreenViewModel.otpTextField2.text.isNotEmpty &&
                          loginScreenViewModel.otpTextField3.text.isNotEmpty &&
                          loginScreenViewModel.otpTextField4.text.isNotEmpty){
                            loginScreenViewModel.buttonDisable.value = false;
                          } else {
                            loginScreenViewModel.buttonDisable.value = true;
                          }
                        },
                        validator: null),
                    );
  }
}