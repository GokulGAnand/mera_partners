
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../../model/response/features/faetures_response.dart';

class FeatureViewModel extends GetxController{
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  var activePage = 0.obs;

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  var id = Get.arguments ?? '';
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();


 /// page1
  var keyLessEntryList = Constants.keyLessEntryList;
  var rearParkingSensorList = Constants.rearParkingSensorList;
  var fogLampList = Constants.fogLampList;
  var sunRoofList = Constants.sunRoofList;
  var gpsNavigationList =Constants.gpsNavigationList;
  var rearDefoggerList = Constants.rearDefoggerList;

  var selectedKeylessEntry = ''.obs;
  var selectedRearParkingSensor = ''.obs;
  var selectedFogLamp = ''.obs;
  var selectedSunRoof = ''.obs;
  var selectedGpsNavigation =''.obs;
  var selectedRearDefogger = ''.obs;
  Rx<TextEditingController> sterioImageRemarks = TextEditingController().obs;
  Rx<File?> sterioCompartmentImage = Rx<File?>(null);
  Rx<TextEditingController> sterioBrandController = TextEditingController().obs;


  /// page2
  var selectedAlloyWheel = ''.obs;
  var selectedFogLamps = ''.obs;
  var selectedAirBag = ''.obs;
  var selectedSeatBelt = ''.obs;
  var selectedAbsEbd = ''.obs;
  var selectedGloveBox = ''.obs;


  var alloyWheelsList = Constants.alloyWheelsList;
  var fogLampsList = Constants.fogLampsList;
  var airBagList = Constants.airBagList;
  var seatBeltList = Constants.seatBeltList;
  var absEbdList = Constants.absEbdList;
  var gloveBoxList = Constants.gloveBoxList;
  Rx<TextEditingController> anyInteriorModificationController = TextEditingController().obs;
  Rx<TextEditingController> absEbdController = TextEditingController().obs;
  Rx<TextEditingController> absEbdRemarksController = TextEditingController().obs;
  // var abs = ''.obs;
  RxList<String> selectAbsEbd = <String>[].obs;
  Rx<File?> clusterImage = Rx<File?>(null);
  var featuresResponse = featuresList().obs;

  void addFeatureInfo()async{
    var request = http.MultipartRequest('PATCH',Uri.parse(EndPoints.baseUrl+EndPoints.featureInfo+'/'+id));
    // for(int i=0; i<selectedKeylessEntry.l)

  }

  void getFeatureInfo()async{
    var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.featureInfo+'/'+id),headers: globals.headers);
    if(response.statusCode==200){
     featuresResponse.value =  featuresList.fromJson(json.decode(response.body));
    }print(response.body);
  }

}