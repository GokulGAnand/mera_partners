import 'dart:async';

import 'package:mera_partners/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController{

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () {
      Get.toNamed(AppRoutes.documentScreen);
    });
    super.onInit();
  }
}