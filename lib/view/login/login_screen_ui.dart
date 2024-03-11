import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/validate_input.dart';
import 'package:evaluator_app/view_model/login/login_view_model.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginScreenViewModel loginScreenViewModel = Get.isRegistered<LoginScreenViewModel>() ? Get.find<LoginScreenViewModel>() : Get.put(LoginScreenViewModel());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: loginScreenViewModel.loginForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.5,
                alignment: Alignment.bottomCenter,
                child: Image.asset(MyImages.loginImage)), 
              Padding(
                padding: Dimens.padding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                "Login",
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: 28,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(height: Dimens.standard_20,),
              Text(
                "Please enter the phone number we will send the OTP in this phone number.",
                style: MyStyles.subTitleGreayStyle,
              ),
              SizedBox(height: Dimens.standard_20,),
                    CustomTextFormField(
                        labelText: "Mobile Number",
                        keyboardType: TextInputType.number,
                        controller: loginScreenViewModel.mobileController,
                        validator: (value)=>ValidateInput.validateMobile(value)),
                        SizedBox(height: Dimens.standard_20,),
                    RichText(
                text: TextSpan(
                  style: MyStyles.subTitleGreayStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'By logging in you agree to  our ',),
                     TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        print("Terms & Condition");
                      },
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500
                        )),
                  ],
                ),
              ),
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    ),
    bottomNavigationBar: Container(
      height: 100,
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      child: CustomElevatedButton(
            textColor: MyColors.white, 
            buttonText: "Submit",
            onPressed: () async{
              if(loginScreenViewModel.loginForm.currentState!.validate()){
                await loginScreenViewModel.mobileLogin();
                Get.toNamed(AppRoutes.otpScreen);
              }
            }),
    ),
    );
  }
}
