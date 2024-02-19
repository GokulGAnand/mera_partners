import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:evaluator_app/model/response/interior/interior_info_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

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
  Rx<File?> handBreakImage = Rx<File?>(null);
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

  var interiorInfoResponse = InteriorInfoResponse().obs;
  var id = Get.arguments ?? '';

  @override
  void onInit() {
    // TODO: implement onInit
    getInteriorInfo();
    super.onInit();
  }

  void addInteriorInfo() async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+id));
      request.fields.addAll({
        'odometerImage_remarks' : '',
        'dashboardImage_remarks' : dashboardRemarksController.value.text,
        'frontSeatImage_remarks' : frontSeatRemarksController.value.text,
        'rearSeatImage_remarks' : rearSeatRemarksController.value.text,
        'handbreakImage_remarks' : handBrakeRemarksController.value.text,
        'powerWindowDriverImage_remarks' : powerWindowDriverRemarksController.value.text,
        'pushWindowDriverImage_remarks' : pushWindowDriverRemarksController.value.text,
        'pushButton' : selectPushButtonOnOff.value,
        'powerWindowCentalLock' : powerWindowAndWindowLockController.value.text,
        'combitionSwitch' : '',
        'dashboardCondition' : '',
        'handBreak' : handBrakeController.value.text,
        'carElectrical' : carElectricalController.value.text,
        'cngKitImage_remarks' : cngLpgKitImageRemarksController.value.text,
        'key' : '',
        'clusterPanel' : clusterPanelController.value.text,
        'warningDetails' : warningDetailsController.value.text,
        'rearViewMirror' : insideRearViewMirrorController.value.text,
        'interiorView' : '',
        'dashboardSwitch' : selectDashboardSwitches.value,
        'secondKey' : selectSecondKey.value,
        'platform' : platformController.value.text,
        'interiorStar' : '',
        'evaluationStatusForInterior': 'COMPLETED'
      });
      if (dashboardImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('dashboardImage', dashboardImage.value!.readAsBytesSync()));
      }
      if (frontSeatImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('frontSeatImage', frontSeatImage.value!.readAsBytesSync()));
      }
      if (rearSeatImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearSeatImage', rearSeatImage.value!.readAsBytesSync()));
      }
      if (handBreakImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('handbreakImage', handBreakImage.value!.readAsBytesSync()));
      }
      if (powerWindowDriverImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('powerWindowDriverImage', powerWindowDriverImage.value!.readAsBytesSync()));
      }
      if (pushWindowDriverImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('pushWindowDriverImage', pushWindowDriverImage.value!.readAsBytesSync()));
      }
      if (cngLpgKitImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('cngKitImage', cngLpgKitImage.value!.readAsBytesSync()));
      }
      request.headers.addAll(globals.headers);

      log(request.toString());

      var response = await request.send();

      if (response.statusCode == 200) {
            log(await response.stream.bytesToString());
            Get.toNamed(AppRoutes.dashBoardScreen);
          } else {
            log(response.reasonPhrase.toString());
          }
    } catch (e){
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void getInteriorInfo() async {
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+id),
      headers: globals.headers);
      if(response.statusCode == 200){
        log(response.body.toString());
        interiorInfoResponse.value = InteriorInfoResponse.fromJson(jsonDecode(response.body));
        // loadData();
      }else{
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}