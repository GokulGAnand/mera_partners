import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingScreenViewModel extends GetxController{
  PageController indicator = PageController();
  RxInt page = 0.obs;
}