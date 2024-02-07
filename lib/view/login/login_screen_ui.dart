import 'package:evaluator_app/view_model/login/login_view_model.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/internet_check.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../utils/validate_input.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginScreenViewModel loginScreenViewModel = Get.put(LoginScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>  Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Form(
                key: loginScreenViewModel.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Dimens.dp_100,Dimens.dp_30,Dimens.dp_100,Dimens.dp_30),
                      child: Image.asset(MyImages.appLogo),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(Dimens.standard_34,0,Dimens.standard_34,0),
                      child: Image.asset(MyImages.loginImage),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Dimens.standard_39,bottom: Dimens.standard_7),
                      child: Text(MyStrings.welcome,style: MyStyles.bold,textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Dimens.standard_57),
                      child: Text(MyStrings.loginDesc,style: MyStyles.regular,textAlign: TextAlign.center,),
                    ),
                    CustomTextFormField(
                      controller: loginScreenViewModel.userNameController,
                      labelText: "${MyStrings.username}*",
                      helperText: "${MyStrings.username}*",
                      validator: ValidateInput.validateName,
                    ),
                    SizedBox(height: Dimens.standard_23,),
                    CustomTextFormField(
                      controller: loginScreenViewModel.passwordController,
                      labelText: "${MyStrings.password}*",
                      helperText: "${MyStrings.password}*",
                      validator: ValidateInput.validateLoginPassword,
                      isPwdType: !loginScreenViewModel.passwordVisibility.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          loginScreenViewModel.passwordVisibility.value = !loginScreenViewModel.passwordVisibility.value;
                        },
                        child: Icon(
                          loginScreenViewModel.passwordVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: MyColors.kPrimaryColor,
                          size: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.standard_23,),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(MyStrings.forgotPassword,style: MyStyles.regular,textAlign: TextAlign.left,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Center(
                child: CustomElevatedButton(
                  onPressed: () {
                    if(loginScreenViewModel.formKey.currentState!.validate()){
                      loginScreenViewModel.formKey.currentState!.save();
                      Internet.checkInternet().then((value) {
                        if (value) {
                          loginScreenViewModel.validateUser();
                        } else {
                          CustomToast.instance.showMsg(MyStrings.checkNetwork);
                        }
                      });
                    }
                  },
                  buttonText: MyStrings.login,
                ),
              ),
            ),
          )
      ),
    );
  }
}



