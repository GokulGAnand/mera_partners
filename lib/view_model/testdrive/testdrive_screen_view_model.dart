import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class TestDriveViewModel extends GetxController {
  var selectedSteeringWheel = "".obs;
  List<String> steeringWheelList = Constants.steeringWheelList;

  final Rx<PageController> pageController = PageController(initialPage: 1).obs;

// the index of the current page
  var activePage = 0.obs;
}
