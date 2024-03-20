import 'dart:developer';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/onboarding/onboarding_view_model.dart';

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
              padding: EdgeInsets.fromLTRB(0, screenSize.height * 0.25, screenSize.width * 0.1, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title', style: MyStyles.black24700),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Text('$subtitle', style: MyStyles.black115400),
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
                      // Handle the action for page value 2
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
                  child: controller.page.value != 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [const Text(MyStrings.next, style: MyStyles.white16700), SizedBox(width: screenSize.width * 0.03), const Icon(Icons.arrow_forward_ios_sharp, color: MyColors.white, size: 15)],
                        )
                      : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
