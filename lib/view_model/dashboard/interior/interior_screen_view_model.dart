import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:evaluator_app/model/response/interior/interior_info_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/view/dashboard/interior/interior_screen_ui.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';

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

  Rx<TextEditingController> clusterPanelOtherController = TextEditingController().obs;
  Rx<TextEditingController> dashboardOtherController = TextEditingController().obs;
  Rx<TextEditingController> frontSeatOtherController = TextEditingController().obs;
  Rx<TextEditingController> rearSeatOtherController = TextEditingController().obs;
  Rx<TextEditingController> dashboardSwitchOtherController = TextEditingController().obs;
  Rx<TextEditingController> handBrakeOtherController = TextEditingController().obs;
  Rx<TextEditingController> carElectricalOtherController = TextEditingController().obs;
  Rx<TextEditingController> platformOtherController = TextEditingController().obs;

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

  RxList<String> selectClusterPanel = <String>[].obs;
  var selectWarningLight = ''.obs;
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
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+globals.carId.toString()));

      for(int i=0; i<selectPowerWindowAndWindowLock.length; i++){
       request.fields['powerWindowCentalLock[$i]'] = selectPowerWindowAndWindowLock[i];
      }
      for(int i=0; i<selectHandBrake.length; i++){
       request.fields['handBreak[$i]'] = selectHandBrake[i];
      }
      for(int i=0; i<selectCarElectrical.length; i++){
       request.fields['carElectrical[$i]'] = selectCarElectrical[i];
      }
      for(int i=0; i<selectClusterPanel.length; i++){
       request.fields['clusterPanel[$i]'] = selectClusterPanel[i];
      }
      for(int i=0; i<selectInsideRearViewMirror.length; i++){
       request.fields['rearViewMirror[$i]'] = selectInsideRearViewMirror[i];
      }
      for(int i=0; i<selectPlatform.length; i++){
       request.fields['platformImage_condition[$i]'] = selectPlatform[i];
      }
      for(int i=0; i<selectDashboardImage.length; i++){
       request.fields['dashboardImage_condition[$i]'] = selectDashboardImage[i];
      }
      for(int i=0; i<selectFrontSeatImage.length; i++){
       request.fields['frontSeatImage_condition[$i]'] = selectFrontSeatImage[i];
      }
      for(int i=0; i<selectRearSeatImage.length; i++){
       request.fields['rearSeatImage_condition[$i]'] = selectRearSeatImage[i];
      }
      request.fields.addAll({
        // 'odometerImage_remarks' : '',
        'dashboardImage_remarks' : dashboardRemarksController.value.text,
        'frontSeatImage_remarks' : frontSeatRemarksController.value.text,
        'rearSeatImage_remarks' : rearSeatRemarksController.value.text,
        'handbreakImage_remarks' : handBrakeRemarksController.value.text,
        'powerWindowDriverImage_remarks' : powerWindowDriverRemarksController.value.text,
        'pushWindowDriverImage_remarks' : pushWindowDriverRemarksController.value.text,
        'pushButton' : selectPushButtonOnOff.value,  
        'combitionSwitch' : '',
        'dashboardCondition' : '',     
        'cngKitImage_remarks' : cngLpgKitImageRemarksController.value.text,
        'key' : '',      
        'warningDetails' : warningDetailsController.value.text,      
        // 'interiorView' : '',
        'dashboardSwitch' : selectDashboardSwitches.value,
        'secondKey' : selectSecondKey.value,
        'platformImage_remarks' : platformRemarksController.value.text,
        'interiorView_remarks' : interiorViewFromBootDashboardRemarksController.value.text,
        'interiorStar' : '',
        'evaluationStatusForInterior': 'COMPLETED'
      });
      if (dashboardImage.value != null && (dashboardImage.value!.path.startsWith('http') == false || dashboardImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('dashboardImage', dashboardImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (frontSeatImage.value != null && (frontSeatImage.value!.path.startsWith('http') == false || frontSeatImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('frontSeatImage', frontSeatImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearSeatImage.value != null && (rearSeatImage.value!.path.startsWith('http') == false || rearSeatImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('rearSeatImage', rearSeatImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (handBreakImage.value != null && (handBreakImage.value!.path.startsWith('http') == false || handBreakImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('handbreakImage', handBreakImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (powerWindowDriverImage.value != null && (powerWindowDriverImage.value!.path.startsWith('http') == false || powerWindowDriverImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('powerWindowDriverImage', powerWindowDriverImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (pushWindowDriverImage.value != null && (pushWindowDriverImage.value!.path.startsWith('http') == false || pushWindowDriverImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('pushWindowDriverImage', pushWindowDriverImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (cngLpgKitImage.value != null && (cngLpgKitImage.value!.path.startsWith('http') == false || cngLpgKitImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('cngKitImage', cngLpgKitImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (platformImage.value != null && (platformImage.value!.path.startsWith('http') == false || platformImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('platformImage', platformImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (interiorViewFromBootDashboardImage.value != null && (interiorViewFromBootDashboardImage.value!.path.startsWith('http') == false || interiorViewFromBootDashboardImage.value!.path.startsWith('https') == false)) {
        request.files.add(await http.MultipartFile.fromPath('interiorView', interiorViewFromBootDashboardImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      request.headers.addAll(globals.headers);

      log(request.toString());

      var response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
            log(await response.stream.bytesToString());
            Get.back();
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
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+globals.carId.toString()),
      headers: globals.headers);
      if(response.statusCode == 200){
        log(response.body.toString());
        var data = await jsonDecode(response.body);
        interiorInfoResponse.value = InteriorInfoResponse.fromJson(data);
        loadData();
      }else{
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void loadData(){
    if(interiorInfoResponse.value.data != null){
      clusterPanelController.value.text = interiorInfoResponse.value.data![0].clusterPanel!.join(",");
      selectClusterPanel.value = clusterPanelController.value.text.split(",");
      warningDetailsController.value.text = interiorInfoResponse.value.data![0].warningDetails!;
      if(warningDetailsController.value.text.isNotEmpty){
        selectWarningLight.value = 'yes';
      }
      dashboardImageController.value.text = interiorInfoResponse.value.data![0].dashboardImage!.condition!.join(",");
      selectDashboardImage.value = dashboardImageController.value.text.split(",");
      dashboardImage.value = interiorInfoResponse.value.data?[0].dashboardImage != null ? File(interiorInfoResponse.value.data![0].dashboardImage!.url ?? '') : null;
      dashboardRemarksController.value.text = interiorInfoResponse.value.data![0].dashboardImage!.remarks ?? '';

      frontSeatImageController.value.text = interiorInfoResponse.value.data![0].frontSeatImage!.condition!.join(",");
      selectFrontSeatImage.value = frontSeatImageController.value.text.split(",");
      frontSeatImage.value = interiorInfoResponse.value.data?[0].frontSeatImage != null ? File(interiorInfoResponse.value.data![0].frontSeatImage!.url ?? '') : null;
      frontSeatRemarksController.value.text = interiorInfoResponse.value.data![0].frontSeatImage!.remarks ?? '';
      rearSeatImageController.value.text = interiorInfoResponse.value.data![0].rearSeatImage!.condition!.join(",");
      selectRearSeatImage.value = rearSeatImageController.value.text.split(",");
      rearSeatImage.value = interiorInfoResponse.value.data?[0].rearSeatImage != null ? File(interiorInfoResponse.value.data![0].rearSeatImage!.url ?? '') : null;
      rearSeatRemarksController.value.text = interiorInfoResponse.value.data![0].rearSeatImage!.remarks ?? '';
      insideRearViewMirrorController.value.text = interiorInfoResponse.value.data![0].rearViewMirror!.join(",");
      selectInsideRearViewMirror.value = insideRearViewMirrorController.value.text.split(",");
      interiorViewFromBootDashboardRemarksController.value.text = interiorInfoResponse.value.data![0].interiorView!.remarks ?? '';
      interiorViewFromBootDashboardImage.value = interiorInfoResponse.value.data?[0].interiorView != null ? File(interiorInfoResponse.value.data![0].interiorView!.url ?? '') : null;

      powerWindowDriverImage.value = interiorInfoResponse.value.data?[0].powerWindowDriverImage != null ? File(interiorInfoResponse.value.data![0].powerWindowDriverImage!.url ?? '') : null;
      powerWindowDriverRemarksController.value.text = interiorInfoResponse.value.data![0].powerWindowDriverImage!.remarks ?? '';
      pushWindowDriverImage.value = interiorInfoResponse.value.data?[0].pushWindowDriverImage != null ? File(interiorInfoResponse.value.data![0].pushWindowDriverImage!.url ?? '') : null;
      pushWindowDriverRemarksController.value.text = interiorInfoResponse.value.data![0].pushWindowDriverImage!.remarks ?? '';
      
      selectPushButtonOnOff.value = interiorInfoResponse.value.data![0].pushButton ?? '';
      selectDashboardSwitches.value = interiorInfoResponse.value.data![0].dashboardSwitch!;

      powerWindowAndWindowLockController.value.text = interiorInfoResponse.value.data![0].powerWindowCentalLock!.join(",");
      selectPowerWindowAndWindowLock.value = powerWindowAndWindowLockController.value.text.split(",");
      handBrakeController.value.text = interiorInfoResponse.value.data![0].handBreak!.join(",");
      selectHandBrake.value = handBrakeController.value.text.split(",");
      handBreakImage.value = interiorInfoResponse.value.data?[0].handbreakImage != null ? File(interiorInfoResponse.value.data![0].handbreakImage!.url ?? '') : null;
      handBrakeRemarksController.value.text = interiorInfoResponse.value.data![0].handbreakImage!.remarks ?? '';
      
      carElectricalController.value.text = interiorInfoResponse.value.data![0].carElectrical!.join(",");
      selectCarElectrical.value = carElectricalController.value.text.split(",");
      cngLpgKitImage.value = interiorInfoResponse.value.data?[0].cngKitImage != null ? File(interiorInfoResponse.value.data![0].cngKitImage!.url ?? '') : null;
      cngLpgKitImageRemarksController.value.text = interiorInfoResponse.value.data![0].cngKitImage!.remarks ?? '';
      selectSecondKey.value = interiorInfoResponse.value.data![0].secondKey ?? '';
      
      platformController.value.text = interiorInfoResponse.value.data![0].platform!.join(",");
      selectPlatform.value = platformController.value.text.split(",");
    }
  }
}