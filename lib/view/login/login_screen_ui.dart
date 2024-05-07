import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/utils/validate_input.dart';
import 'package:mera_partners/view_model/login/login_view_model.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/widgets/help_bottom_sheet.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context, 
                builder: (context){
                  return HelpBottomSheet();
                });
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: MyColors.subTitleColor,width: 1)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(MySvg.help),
                  const SizedBox(width: 8,),
                  Text(MyStrings.help, 
                  style:MyStyles.black14700,),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: loginScreenViewModel.loginForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: size.height * 0.5, alignment: Alignment.bottomCenter, child: Image.asset(MyImages.loginImage)),
                Padding(
                  padding: Dimens.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        MyStrings.login,
                        style: MyStyles.blackBold28,
                      ),
                      SizedBox(
                        height: Dimens.standard_20,
                      ),
                      const Text(
                        MyStrings.loginDesc,
                        style: MyStyles.subTitleGreayStyle,
                      ),
                      SizedBox(
                        height: Dimens.standard_20,
                      ),
                      CustomTextFormField(labelText: MyStrings.mobileNo, keyboardType: TextInputType.number,
                          controller: loginScreenViewModel.mobileController,
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(10)
                          ],
                          validator: (value) => ValidateInput.validateMobile(value)),
                      SizedBox(
                        height: Dimens.standard_20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: MyStyles.subTitleGreayStyle,
                          children: <TextSpan>[
                            const TextSpan(
                              text: MyStrings.aggreeTerms,
                            ),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    log(MyStrings.termsCondition);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Scaffold(
                                          appBar: AppBar(),
                                          body: SafeArea(
                                            child: SingleChildScrollView(
                                              child: Column(children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(18.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        RichText(
                                                          text: const TextSpan(
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: MyColors.black,
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(text: 'Introduction\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                                                              TextSpan(text: 'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Webiste Name accessible at Website.com.\n\n'),
                                                              TextSpan(text: 'These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.\n\n'),
                                                              TextSpan(text: 'Minors or people below 18 years old are not allowed to use this Website.\n\n'),
                                                              TextSpan(text: 'Intellectual Property Rights\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                                                              TextSpan(text: 'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Webiste Name accessible at Website.com.\n\n'),
                                                              TextSpan(text: 'These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.\n\n'),
                                                              TextSpan(text: 'Minors or people below 18 years old are not allowed to use this Website.\n\n'),
                                                              TextSpan(text: 'Intellectual Property Rights\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                                                              TextSpan(text: 'Other than the content you own, under these Terms, Company Name and/or its licensors own all the intellectual property rights and materials contained in this Website.\n\n'),
                                                              TextSpan(text: 'You are granted limited license only for purposes of viewing the material contained on this Website.\n\n'),
                                                              TextSpan(text: 'Your Content\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                                                              TextSpan(text: 'In these Website Standard Terms and Conditions, “Your Content” shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant Company Name a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.\n\n'),
                                                              TextSpan(text: ''),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                text: MyStrings.termsCondition,
                                style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w500)),
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
        padding: const EdgeInsets.only(left: 16, right: 16),
        alignment: Alignment.center,
        child: CustomElevatedButton(
            textColor: MyColors.white,
            buttonText: MyStrings.submit,
            onPressed: () async {
              if (loginScreenViewModel.loginForm.currentState!.validate()) {
                await loginScreenViewModel.mobileLogin();
              }
            }),
      ),
    );
  }
}
