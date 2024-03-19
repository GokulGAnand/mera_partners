import 'dart:developer';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../view_model/onboarding/onboarding_view_model.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

class OnBoardingWidgets extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final int values;

  const OnBoardingWidgets({super.key, this.image, this.title, this.subtitle, required this.values});

  @override
  Widget build(BuildContext context) {
    OnboardingScreenViewModel controller = Get.find<OnboardingScreenViewModel>();
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: MyColors.white,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Container(
              height: screenSize.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.values[values]),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, screenSize.height * 0.25, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style:  TextStyle(fontSize: 24, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, color: MyColors.black),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Text(
                    '$subtitle',
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black1,
                    ),
      
                  ),
                ],
              ),
            ),
            Obx(
                  () => Padding(
                padding: EdgeInsets.fromLTRB(screenSize.width * 0.05, screenSize.height * 0.10, screenSize.width * 0.05, 0),
                child: CustomElevatedButton(
                  onPressed: () {
                    log('Current Page: ${controller.page.value}');
                    if (controller.page.value == 2) {
                      if (globals.isDocumentsVerified != null && globals.isDocumentsVerified == true) {
                        Get.toNamed(AppRoutes.homeScreen);
                      }else if(globals.isDocumentsVerified == false || (globals.addressProofFront == null && globals.addressProofFront == false)){
                        Get.toNamed(AppRoutes.documentScreen);
                      }else{
                        Get.toNamed(AppRoutes.homeScreen);
                      }
                    } else {
                      controller.indicator.animateToPage(
                        controller.page.value.toInt() + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                    controller.update();
                  },
                  textColor: MyColors.white,
                  buttonText: controller.page.value == 2 ? MyStrings.getStarted : MyStrings.next,
                  child: controller.page.value != 2? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(MyStrings.next,style: TextStyle(
                        color: MyColors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),),
                      SizedBox(width: screenSize.width * 0.03),
                      Icon(Icons.arrow_forward_ios_sharp,color: MyColors.white,size: 15)
                    ],
                  ):null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
