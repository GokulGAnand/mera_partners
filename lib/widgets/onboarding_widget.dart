import 'dart:developer';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/enum.dart';
import '../view_model/onboarding/onboarding_view_model.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Container(
              //height: screenSize.height * 0.3,
              height: screenSize.height * 0.36,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.values[values]),
              ),
            ),
            Padding(
              //padding: EdgeInsets.fromLTRB(screenSize.width * 0.02, screenSize.height * 0.2, screenSize.width * 0.1, 0),
              padding: EdgeInsets.fromLTRB(screenSize.width * 0.05, screenSize.height * 0.2, 0, 0),
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
                      if (globals.documentStatus != null && globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name && globals.isDeposited == true) {
                        Get.toNamed(AppRoutes.homeScreen);
                      }else if(globals.documentStatus?.toUpperCase() == DocumentStatus.SUBMITTED.name || (globals.addressProofFront == null && globals.addressProofFront == false) || globals.isDeposited == false){
                        Get.toNamed(AppRoutes.documentScreen);
                      }else{
                        Get.toNamed(AppRoutes.documentScreen);
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
