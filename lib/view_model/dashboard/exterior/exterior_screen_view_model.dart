import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExteriorViewModel extends GetxController{

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  var isPage3Fill = false.obs;
  var isPage4Fill = false.obs;
  var isPage5Fill = false.obs;

  var isPage6Fill = false.obs;

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  var activePage = 0.obs;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page5Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page6Key = GlobalKey<FormState>();

  ///page 3
  var selectedBonnetPatti = "".obs;
  var selectedUpperCrossMember = "".obs;
  var selectedLowerCrossMember = "".obs;
  var selected = "".obs;
  ///page 6
  Rx<TextEditingController> missingPartsController = TextEditingController().obs;

  ///page1
  Rx<File?> exteriorCompartmentImage = Rx<File?>(null);
  Rx<TextEditingController> frontImage = TextEditingController().obs;

}