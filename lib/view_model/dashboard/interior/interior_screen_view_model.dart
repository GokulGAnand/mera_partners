import 'dart:io';

import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InteriorViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  // index of the current page
  var activePage = 0.obs;

  Rx<TextEditingController> clusterPanelController = TextEditingController().obs;
  Rx<TextEditingController> warningDetailsController = TextEditingController().obs;
  Rx<TextEditingController> dashboardImageController = TextEditingController().obs;
  Rx<TextEditingController> frontSeatImageController = TextEditingController().obs;
  Rx<TextEditingController> rearSeatImageController = TextEditingController().obs;
  Rx<TextEditingController> insideRearViewMirrorController = TextEditingController().obs;
  Rx<TextEditingController> powerWindowAndWindowLockController = TextEditingController().obs;
  Rx<TextEditingController> handBrakeController = TextEditingController().obs;
  Rx<TextEditingController> carElectricalController = TextEditingController().obs;
  Rx<TextEditingController> platformController = TextEditingController().obs;

  Rx<TextEditingController> clusterPanelRemarksController = TextEditingController().obs;
  Rx<TextEditingController> dashboardRemarksController = TextEditingController().obs;
  Rx<TextEditingController> frontSeatRemarksController = TextEditingController().obs;
  Rx<TextEditingController> rearSeatRemarksController = TextEditingController().obs;
  Rx<TextEditingController> insideRearViewMirrorRemarksController = TextEditingController().obs;
  Rx<TextEditingController> interiorViewFromBootDashboardRemarksController = TextEditingController().obs;
  Rx<TextEditingController> powerWindowDriverRemarksController = TextEditingController().obs;
  Rx<TextEditingController> pushWindowDriverRemarksController = TextEditingController().obs;
  Rx<TextEditingController> powerWindowAndWindowLockRemarksController = TextEditingController().obs;
  Rx<TextEditingController> handBrakeRemarksController = TextEditingController().obs;
  Rx<TextEditingController> carElectricalRemarksController = TextEditingController().obs;
  Rx<TextEditingController> cngLpgKitImageRemarksController = TextEditingController().obs;
  Rx<TextEditingController> platformRemarksController = TextEditingController().obs;

  List<String> clusterPanel = Constants.clusterPanel;
  List<String> yesNoList = Constants.yesNoList;
  List<String> dashboardImageList = Constants.dashboardImage;
  List<String> frontSeatImageList = Constants.frontAndRearSeatImage;
  List<String> rearSeatImageList = Constants.frontAndRearSeatImage;
  List<String> insideRearViewMirror= Constants.insideRearViewMirror;
  List<String> pushButtonOnOff= Constants.pushButtonOnOff;
  List<String> dashboardSwitches = Constants.dashboardSwitches;
  List<String> powerWindowAndWindowLock= Constants.powerWindowAndWindowLock;
  List<String> handBrake= Constants.handBrake;
  List<String> carElectrical= Constants.carElectrical;
  List<String> secondKey= Constants.secondKey;
  List<String> platform = Constants.platform;

  Rx<File?> clusterImage = Rx<File?>(null);
  Rx<File?> dashboardImage = Rx<File?>(null);
  Rx<File?> frontSeatImage = Rx<File?>(null);
  Rx<File?> rearSeatImage = Rx<File?>(null);
  Rx<File?> insideRearViewMirrorImage = Rx<File?>(null);
  Rx<File?> interiorViewFromBootDashboardImage = Rx<File?>(null);
  Rx<File?> powerWindowDriverImage = Rx<File?>(null);
  Rx<File?> pushWindowDriverImage = Rx<File?>(null);
  Rx<File?> powerWindowAndWindowLockImage = Rx<File?>(null);
  Rx<File?> handBrakeImage = Rx<File?>(null);
  Rx<File?> carElectricalImage = Rx<File?>(null);
  Rx<File?> cngLpgKitImage = Rx<File?>(null);
  Rx<File?> platformImage = Rx<File?>(null);

  // var selectClusterPanel = ''.obs;
  RxList<String> selectClusterPanel = <String>[].obs;
  var selectWarningLight = ''.obs;
  var warningDetails = ''.obs;
  RxList<String> selectDashboardImage = <String>[].obs;
  RxList<String> selectFrontSeatImage = <String>[].obs;
  RxList<String> selectRearSeatImage = <String>[].obs;
  RxList<String> selectInsideRearViewMirror = <String>[].obs;
  var selectPushButtonOnOff = ''.obs;
  var selectDashboardSwitches = ''.obs;
  RxList<String> selectPowerWindowAndWindowLock = <String>[].obs;
  RxList<String> selectHandBrake = <String>[].obs;
  RxList<String> selectCarElectrical = <String>[].obs;
  var selectSecondKey = ''.obs;
  RxList<String> selectPlatform = <String>[].obs;

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
}