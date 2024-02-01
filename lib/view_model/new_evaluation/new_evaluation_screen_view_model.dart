import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEvaluationViewModel extends GetxController{

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  // the index of the current page
  var activePage = 0.obs;

  String dropdownValue = 'Dog';

  Rx<TextEditingController> customerMobileNumController = TextEditingController().obs;
  Rx<TextEditingController> manufacturingYearController = TextEditingController().obs;
  Rx<TextEditingController> carMake = TextEditingController().obs;
  Rx<TextEditingController> carModel = TextEditingController().obs;
  Rx<TextEditingController> variant = TextEditingController().obs;
  Rx<TextEditingController> vehicleRegistration = TextEditingController().obs;
  Rx<TextEditingController> registrationNumber = TextEditingController().obs;
  Rx<TextEditingController> registrationDate = TextEditingController().obs;
  Rx<TextEditingController> rcOwnerName = TextEditingController().obs;
  Rx<TextEditingController> ownershipNumber = TextEditingController().obs;
  Rx<TextEditingController> transmission = TextEditingController().obs;

}