import 'dart:developer';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
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
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          height: 300,
          // width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.values[values]),
          ),
        ),
        Container(
          height: Get.height * 0.35,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(fontSize: 24, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, color: MyColors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text(
                    '$subtitle',
                    style: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
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
              child: controller.page.value != 2?const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.next,style: TextStyle(
                    color: MyColors.white,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),),
                  SizedBox(width: 13,),
                  Icon(Icons.arrow_forward_ios_sharp,color: MyColors.white,size: 15,)
                ],
              ):null,
            ),
          ),
        )
      ],
    );
  }
}
