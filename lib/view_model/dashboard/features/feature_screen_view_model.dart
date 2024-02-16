import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureViewModel extends GetxController{
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();


}