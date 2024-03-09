import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/onboarding/onboarding_view_model.dart';
import '../../widgets/onboardingWidgets.dart';

class OnboardingScreen extends GetView<OnboardingScreenViewModel> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.indicator,
            onPageChanged: ((value) {
              controller.page.value = value;
              print(controller.page.value);
            }),
            children: const [
              // start page onboarding
              OnBoardingWidgets(
                image: 'assets/images/onboarding1.png',
                title: MyStrings.bidFromAnyWhere,
                subtitle: 'Welcome to Meracars, your gateway to an exciting world of automotive possibilities.',
                values: 2,


              ),
              OnBoardingWidgets(
                image: 'assets/images/onboard2.png',
                title: MyStrings.detailedInspection,
                subtitle: 'Welcome to Meracars, your gateway to an exciting world of automotive possibilities',
                values: 3,


              ),
              OnBoardingWidgets(
                image: 'assets/images/onboarding3.png',
                title: MyStrings.easyDocumentTransfer,
                subtitle: 'Welcome to Meracars, your gateway to an exciting world of automotive possibilities.',
                values: 3,

              ),
            ],
          ),
          // Align(
          //   alignment: Alignment(0, 0.85),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: List.generate(
          //         3,
          //         (index) => Container(
          //           margin: const EdgeInsets.all(8),
          //           width: 16,
          //           height: 8,
          //           decoration: BoxDecoration(
          //             shape: index % 2 == 0 ? BoxShape.circle : BoxShape.rectangle,
          //             borderRadius: index % 2 == 0 ? null : BorderRadius.circular(4.0), // Adjust the radius as needed
          //             color: index == currentPage ? Colors.blue : Colors.grey,
          //           ),
          //         ),
          //       )),
          // )
        ],

      ),
    );
  }
}
