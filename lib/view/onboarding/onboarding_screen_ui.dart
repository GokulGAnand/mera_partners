import 'dart:developer';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../view_model/onboarding/onboarding_view_model.dart';
import '../../widgets/onboarding_widget.dart';
import '../../widgets/show_logout_dialog.dart';

/// ignore: must_be_immutable
class OnboardingScreen extends GetView<OnboardingScreenViewModel> {
  OnboardingScreen({super.key});
  OnboardingScreenViewModel viewModel =
      Get.isRegistered<OnboardingScreenViewModel>()
          ? Get.find<OnboardingScreenViewModel>()
          : Get.put(OnboardingScreenViewModel());
  List<Widget>? pages;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          //showLogoutDialog(context);
          showExitDialog(context);
        },
        child: PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            log(controller.page.value.toString());
          }),
          children: const [
            // start page onboarding
            OnBoardingWidgets(
                image: MyImages.onboarding1,
                title: MyStrings.bidFromAnyWhere,
                subtitle: MyStrings.subtitle1,
                values: 1),
            OnBoardingWidgets(
              image: MyImages.onboarding2,
              title: MyStrings.detailedInspection,
              subtitle: MyStrings.subtitle1,
              values: 3,
            ),
            OnBoardingWidgets(
              image: MyImages.onboarding3,
              title: MyStrings.easyDocumentTransfer,
              subtitle: MyStrings.subtitle1,
              values: 3,
            ),
          ],
        ),
      ),
      Obx(
        () => Align(
          alignment: const Alignment(0, 0.10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.all(1),
                width: 24,
                height: 10,
                decoration: controller.page.value == index
                    ? BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(
                            controller.page.value == index ? 10 : 0),
                        color: MyColors.blue1)
                    : const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.grey,
                      ),
              ),
            ),
          ),
        ),
      ),
      //here
    ]);
  }
}
