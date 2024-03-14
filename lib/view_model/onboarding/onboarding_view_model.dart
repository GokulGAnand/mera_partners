import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/onboarding/onboarding_screen_ui.dart';
import '../../view/tutorial/tutorial_screen_ui.dart';

class OnboardingScreenViewModel extends GetxController {
  PageController indicator = PageController();
  RxInt page = 0.obs;
  RxInt controller = 0.obs;
  BuildContext? context;


  @override
  void onInit() {
    super.onInit();
    showAlertDialog();
  }
  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return TutorialScreen();
      },
    );

  }



}
