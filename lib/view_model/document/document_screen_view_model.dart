import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentScreenViewModel extends GetxController{
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> businessNameController = TextEditingController().obs;
  Rx<TextEditingController> businessAddressController = TextEditingController().obs;
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  Rx<TextEditingController> districtController = TextEditingController().obs;

}