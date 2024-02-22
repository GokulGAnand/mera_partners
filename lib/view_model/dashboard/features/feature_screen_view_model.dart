
import 'dart:io';

import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureViewModel extends GetxController{
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  var activePage = 0.obs;

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();


 /// page1
  var keyLessEntryList = Constants.keyLessEntryList;
  var stereoImageList = Constants.stereoImageOptions;
  var rearParkingSensorList = Constants.rearParkingSensorList;
  var fogLampList = Constants.fogLampList;
  var sunRoofList = Constants.sunRoofList;
  var gpsNavigationList =Constants.gpsNavigationList;
  var rearDefoggerList = Constants.rearDefoggerList;

  // Rx<TextEditingController> sterioImageRemarks = TextEditingController().obs;
  // Rx<File?> sterioCompartmentImage = Rx<File?>(null);

  Rx<TextEditingController> keylessEntryController = TextEditingController().obs;
  Rx<TextEditingController> stereoImageController = TextEditingController().obs;
  Rx<TextEditingController> sterioBrandController = TextEditingController().obs;
  Rx<TextEditingController> sunroofController = TextEditingController().obs;

  Rx<TextEditingController> keylessEntryRemarksController = TextEditingController().obs;
  Rx<TextEditingController> stereoImageRemarksController = TextEditingController().obs;
  Rx<TextEditingController> sunroofRemarksController = TextEditingController().obs;

  RxList<String> selectedKeylessEntry = <String>[].obs;
  RxList<String> selectedStereoImage = <String>[].obs;
  var selectedRearParkingSensor = ''.obs;
  var selectedFogLamp = ''.obs;
  RxList<String> selectedSunRoof = <String>[].obs;
  var selectedGpsNavigation =''.obs;
  var selectedRearDefogger = ''.obs;

  Rx<File?> keyLessEntryImage = Rx<File?>(null);
  Rx<File?> stereoImage = Rx<File?>(null);
  Rx<File?> sunroofImage = Rx<File?>(null);


  /// page2

  var alloyWheelsList = Constants.alloyWheelsList;
  var fogLampsList = Constants.fogLampsList;
  var airBagList = Constants.airBagList;
  var seatBeltList = Constants.seatBeltList;
  var absEbdList = Constants.absEbdList;
  var gloveBoxList = Constants.gloveBoxList;

  Rx<TextEditingController> alloyWheelsController = TextEditingController().obs;
  Rx<TextEditingController> airBagsController = TextEditingController().obs;
  Rx<TextEditingController> absEbdController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxController = TextEditingController().obs;
  Rx<TextEditingController> anyInteriorModificationController = TextEditingController().obs;

  Rx<TextEditingController> alloyWheelsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> airBagsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> absEbdRemarksController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxRemarksController = TextEditingController().obs;
  // var abs = ''.obs;

  RxList<String> selectedAlloyWheel = <String>[].obs;
  var selectedFogLamps = ''.obs;
  RxList<String> selectedAirBag = <String>[].obs;
  var selectedSeatBelt = ''.obs;
  RxList<String> selectAbsEbd = <String>[].obs;
  RxList<String> selectedGloveBox = <String>[].obs;

  Rx<File?> alloyWheelImage = Rx<File?>(null);
  Rx<File?> airBagImage = Rx<File?>(null);
  Rx<File?> absEbdImage = Rx<File?>(null);
  Rx<File?> gloveBoxImage = Rx<File?>(null);

}