import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';
import '../../../model/response/engine/engine_details_response.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';

class EngineViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;
  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  var id = Get.arguments ?? '';
  var engineResponse = EngineResponse().obs;

  ///page one
  Rx<TextEditingController> engineCompartmentImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> otherEngineConditionController = TextEditingController().obs;
  Rx<TextEditingController> otherRadiatorController = TextEditingController().obs;
  Rx<TextEditingController> otherSmokeController = TextEditingController().obs;
  Rx<TextEditingController> otherCoolantController = TextEditingController().obs;
  Rx<TextEditingController> otherBlowbyController = TextEditingController().obs;
  Rx<TextEditingController> otherBatteryController = TextEditingController().obs;
  Rx<TextEditingController> otherStartingMotorController = TextEditingController().obs;
  Rx<TextEditingController> engineIdleStartVideoRemarksController = TextEditingController().obs;
  Rx<TextEditingController> radiatorRemarksController = TextEditingController().obs;
  Rx<TextEditingController> startingMotorRemarksController = TextEditingController().obs;
  Rx<TextEditingController> blowByRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineRemarksController = TextEditingController().obs;
  Rx<TextEditingController> batteryRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineController = TextEditingController().obs;
  Rx<TextEditingController> batteryController = TextEditingController().obs;
  Rx<TextEditingController> blowByBackCompressionController = TextEditingController().obs;

  Rx<File?> engineCompartmentImage = Rx<File?>(null);
  Rx<File?> engineIdleStartVideo = Rx<File?>(null);
  Rx<File?> blowByBackCompressionImage = Rx<File?>(null);
  Rx<File?> engineImage = Rx<File?>(null);
  Rx<File?> batteryImage = Rx<File?>(null);
  RxList<String> selectedEngine = <String>[].obs;
  RxList<String> selectedBattery = <String>[].obs;
  RxList<String> selectedBlowBy = <String>[].obs;
  var selectedEngineSound = ''.obs;
  var selectedSmoke = ''.obs;
  var selectedRadiator = ''.obs;
  var selectedStartingMotor = ''.obs;
  var selectedCoolant = ''.obs;
  var engineSoundList = Constants.engineSoundList;
  var smokeList = Constants.smokeList;
  var startMotorList = Constants.startMotorList;
  var coolantList = Constants.coolantList;
  var yesNoList = Constants.yesNoList;
  var engineConditionList = Constants.engineConditionList;
  var radiatorList = Constants.radiatorList;
  var clutchOperationList = Constants.clutchOperationList;
  var gearBoxList = Constants.gearBoxList;
  var engineOilList = Constants.engineOilList;
  var turboChargerList = Constants.turboChargerList;
  var engineMountList = Constants.engineMountList;
  var sumpList = Constants.sumpList;
  var batteryList = Constants.batteryList;
  var blowByBackCompress = Constants.blowByBackCompress;
  var silencerConditionList = Constants.silencerConditionList;

  ///page two
  var selectedSilencer = ''.obs;
  var silencerList = Constants.silencerConditionList;
  var selectedGearBoxLeak = ''.obs;
  Rx<File?> clutchOperationsImage = Rx<File?>(null);
  Rx<File?> gearBoxImage = Rx<File?>(null);
  Rx<File?> engineOilImage = Rx<File?>(null);
  Rx<File?> turboChargerImage = Rx<File?>(null);
  Rx<File?> engineMountImage = Rx<File?>(null);
  Rx<File?> sumpImage = Rx<File?>(null);
  RxList<String> selectedClutchOperations = <String>[].obs;
  RxList<String> selectedGearBox = <String>[].obs;
  RxList<String> selectedEngineOil = <String>[].obs;
  RxList<String> selectedTurboCharger = <String>[].obs;
  RxList<String> selectedEngineMount = <String>[].obs;
  RxList<String> selectedSump = <String>[].obs;
  Rx<TextEditingController> clutchOperationsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> gearBoxImageRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineOilRemarksController = TextEditingController().obs;
  Rx<TextEditingController> turboChargerRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineMountRemarksController = TextEditingController().obs;
  Rx<TextEditingController> sumpRemarksController = TextEditingController().obs;
  Rx<TextEditingController> sumpController = TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;
  Rx<TextEditingController> engineMountController = TextEditingController().obs;
  Rx<TextEditingController> gearboxController = TextEditingController().obs;
  Rx<TextEditingController> turboChargerController = TextEditingController().obs;
  Rx<TextEditingController> engineOilController = TextEditingController().obs;
  Rx<TextEditingController> clutchOperationsController = TextEditingController().obs;
  Rx<TextEditingController> otherSilencerController = TextEditingController().obs;
  Rx<TextEditingController> otherClutchOperationController = TextEditingController().obs;
  Rx<TextEditingController> otherGearBoxController = TextEditingController().obs;
  Rx<TextEditingController> otherEngineOilController = TextEditingController().obs;
  Rx<TextEditingController> otherTurboChargerController = TextEditingController().obs;
  Rx<TextEditingController> otherEngineMountController = TextEditingController().obs;
  Rx<TextEditingController> otherSumpController = TextEditingController().obs;

  @override
  void onInit() {
    getEngineData();
    super.onInit();
  }

  void  updateEngine() async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl+EndPoints.engineInfo+globals.carId.toString()));
      for(int i = 0; i < selectedEngine.length; i++){
        request.fields['engine_condition[$i]'] = selectedEngine[i];
      }
      for(int i = 0; i < selectedBattery.length; i++){
        request.fields['battery_condition[$i]'] = selectedBattery[i];
      }
      for(int i = 0; i < selectedBlowBy.length; i++){
        request.fields['blowBy_condition[$i]'] = selectedBlowBy[i];
      }
      for(int i = 0; i < selectedClutchOperations.length; i++){
        request.fields['clutch_condition[$i]'] = selectedClutchOperations[i];
      }
      for(int i = 0; i < selectedGearBox.length; i++){
        request.fields['gearBox_condition[$i]'] = selectedGearBox[i];
      }
      for(int i = 0; i < selectedEngineOil.length; i++){
        request.fields['engineOil_condition[$i]'] = selectedEngineOil[i];
      }
      for(int i = 0; i < selectedTurboCharger.length; i++){
        request.fields['turboCharger_condition[$i]'] = selectedTurboCharger[i];
      }
      for(int i = 0; i < selectedEngineMount.length; i++){
        request.fields['mount_condition[$i]'] = selectedEngineMount[i];
      }
      for(int i = 0; i < selectedSump.length; i++){
        request.fields['sump_condition[$i]'] = selectedSump[i];
      }
      request.fields.addAll({
        'engineSound': selectedEngineSound.value,
        'radiator': selectedRadiator.value,
        'exhaustSmoke': selectedSmoke.value,
        'silencer': selectedSilencer.value,
        'engineComment': remarksController.value.text,
        'startingMotor': selectedStartingMotor.value,
        'coolant': selectedCoolant.value,
        'gearBoxLeakage': selectedGearBoxLeak.value,
        'evaluationStatusForEngine': 'COMPLETED',
        'engineCompartment_remarks': engineCompartmentImageRemarks.value.text,
        'startVideo_remarks': engineIdleStartVideoRemarksController.value.text,
        'front_remarks': engineIdleStartVideoRemarksController.value.text,
        'engine_remarks':engineRemarksController.value.text,
        'battery_remarks':batteryRemarksController.value.text,
        'blowBy_remarks':blowByRemarksController.value.text,
        'clutch_remarks':clutchOperationsRemarksController.value.text,
        'gearBox_remarks':gearBoxImageRemarksController.value.text,
        'engineOil_remarks':engineOilRemarksController.value.text,
        'turboCharger_remarks':turboChargerRemarksController.value.text,
        'mount_remarks':engineMountRemarksController.value.text,
        'sump_remarks':sumpRemarksController.value.text,
      });
      if (engineCompartmentImage.value  != null && !engineCompartmentImage.value!.path.startsWith('http') && !engineCompartmentImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('engineCompartment', engineCompartmentImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (engineIdleStartVideo.value  != null && !engineIdleStartVideo.value!.path.startsWith('http') && !engineIdleStartVideo.value!.path.startsWith('https')) {
        var type = engineIdleStartVideo.value!.path.split('.').last;
        request.files.add(await http.MultipartFile.fromPath('startVideo', engineIdleStartVideo.value!.path,contentType: MediaType('image', type),));
      }
      if (engineImage.value  != null && !engineImage.value!.path.startsWith('http') && !engineImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('engine', engineImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (batteryImage.value  != null && !batteryImage.value!.path.startsWith('http') && !batteryImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('battery', batteryImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (blowByBackCompressionImage.value  != null && !blowByBackCompressionImage.value!.path.startsWith('http') && !blowByBackCompressionImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('blowBy', blowByBackCompressionImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (clutchOperationsImage.value  != null && !clutchOperationsImage.value!.path.startsWith('http') && !clutchOperationsImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('clutch', clutchOperationsImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (clutchOperationsImage.value  != null && !gearBoxImage.value!.path.startsWith('http') && !gearBoxImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('gearBox', gearBoxImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (engineOilImage.value  != null && !engineOilImage.value!.path.startsWith('http') && !engineOilImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('engineOil', engineOilImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (turboChargerImage.value  != null /*&& !turboChargerImage.value!.path.startsWith('http') && !turboChargerImage.value!.path.startsWith('https')*/) {
        if (!turboChargerImage.value!.path.startsWith('http') && !turboChargerImage.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('turboCharger', turboChargerImage.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (engineMountImage.value  != null /*&& !engineMountImage.value!.path.startsWith('http') && !engineMountImage.value!.path.startsWith('https')*/) {
        if (!engineMountImage.value!.path.startsWith('http') && !engineMountImage.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('mount', engineMountImage.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (sumpImage.value  != null && !sumpImage.value!.path.startsWith('http') && !sumpImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('sump', sumpImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      request.headers.addAll(globals.headers);

      var response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.offNamed(AppRoutes.dashBoardScreen);
      }
      else {
        print(response.reasonPhrase);
      }

    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }


  void loadData(){
    if(engineResponse.value.data  != null /*&& !.value!.path.startsWith('http') && !.value!.path.startsWith('https')*/){
      engineCompartmentImageRemarks.value.text = engineResponse.value.data?[0].engineCompartment?.remarks ?? '';
      engineIdleStartVideoRemarksController.value.text = engineResponse.value.data?[0].startVideo?.remarks ?? '';
      // otherEngineConditionController.value = engineResponse.value.data?[0];
      // otherRadiatorController.value.text = engineResponse.value.data?[0];
      // otherSmokeController.value.text = engineResponse.value.data?[0];
      // otherCoolantController.value.text = engineResponse.value.data?[0];
      // otherBlowbyController.value.text = engineResponse.value.data?[0];
      // otherBatteryController.value.text = engineResponse.value.data?[0];
      // otherStartingMotorController.value.text = engineResponse.value.data?[0];
      engineIdleStartVideoRemarksController. value.text = engineResponse.value.data?[0].startVideo?.remarks ?? '';
      radiatorRemarksController.value.text = engineResponse.value.data?[0].radiator ?? '';
      startingMotorRemarksController.value.text = engineResponse.value.data?[0].startingMotor ?? '';
      blowByRemarksController.value.text = engineResponse.value.data?[0].blowBy?.remarks ?? '';
      engineRemarksController.value.text = engineResponse.value.data?[0].engine?.remarks ?? '';
      batteryRemarksController.value.text = engineResponse.value.data?[0].battery?.remarks ?? '';
      engineController.value.text = engineResponse.value.data?[0].engine?.condition?.join(',') ?? '';
      batteryController.value.text = engineResponse.value.data?[0].battery?.condition?.join(',') ?? '';
      blowByBackCompressionController.value.text = engineResponse.value.data?[0].blowBy?.condition?.join(',') ?? '';
      engineCompartmentImage.value = engineResponse.value.data?[0].engineCompartment != null ? File(engineResponse.value.data?[0].engineCompartment?.url ?? '') : null;
      engineIdleStartVideo.value = engineResponse.value.data?[0].startVideo != null ? File(engineResponse.value.data?[0].startVideo?.url ?? '') : null;
      blowByBackCompressionImage.value = engineResponse.value.data?[0].blowBy != null ? File(engineResponse.value.data?[0].blowBy?.url ?? '') : null;
      engineImage.value = engineResponse.value.data?[0].engine != null ? File(engineResponse.value.data?[0].engine?.url ?? '') : null;
      batteryImage.value = engineResponse.value.data?[0].battery != null ? File(engineResponse.value.data?[0].battery?.url ?? '') : null;
      selectedEngine.value = engineResponse.value.data?[0].engine?.condition ?? [];
      selectedBattery.value = engineResponse.value.data?[0].battery?.condition ?? [];
      selectedBlowBy.value = engineResponse.value.data?[0].blowBy?.condition ?? [];
      selectedEngineSound.value = engineResponse.value.data?[0].engineSound ?? '';
      selectedSmoke.value = engineResponse.value.data?[0].exhaustSmoke ?? '';
      selectedRadiator.value = engineResponse.value.data?[0].radiator ?? '';
      selectedStartingMotor.value = engineResponse.value.data?[0].startingMotor ?? '';
      selectedCoolant.value = engineResponse.value.data?[0].coolant ?? '';
      selectedSilencer.value = engineResponse.value.data?[0].silencer ?? '';
      selectedGearBoxLeak.value = engineResponse.value.data?[0].gearBoxLeakage ?? '';
      clutchOperationsImage.value = engineResponse.value.data?[0].clutch != null ? File(engineResponse.value.data?[0].clutch?.url ?? '') : null;
      gearBoxImage.value = engineResponse.value.data?[0].gearBox != null ? File(engineResponse.value.data?[0].gearBox?.url ?? '') : null;
      engineOilImage.value = engineResponse.value.data?[0].engineOil != null ? File(engineResponse.value.data?[0].engineOil?.url ?? '') : null;
      turboChargerImage.value = engineResponse.value.data?[0].turboCharger != null ? File(engineResponse.value.data?[0].turboCharger?.url ?? '') : null;
      engineMountImage.value = engineResponse.value.data?[0].mount != null ? File(engineResponse.value.data?[0].mount?.url ?? '') : null;
      sumpImage.value = engineResponse.value.data?[0].sump != null ? File(engineResponse.value.data?[0].sump?.url ?? '') : null;
      selectedClutchOperations.value = engineResponse.value.data?[0].clutch?.condition ?? [];
      selectedGearBox.value = engineResponse.value.data?[0].gearBox?.condition ?? [];
      selectedEngineOil.value = engineResponse.value.data?[0].engineOil?.condition ?? [];
      selectedTurboCharger.value = engineResponse.value.data?[0].turboCharger?.condition ?? [];
      selectedEngineMount.value = engineResponse.value.data?[0].mount?.condition ?? [];
      selectedSump.value = engineResponse.value.data?[0].sump?.condition ?? [];
      clutchOperationsRemarksController.value.text = engineResponse.value.data?[0].clutch?.remarks ?? '';
      gearBoxImageRemarksController.value.text = engineResponse.value.data?[0].gearBox?.remarks ?? '';
      engineOilRemarksController.value.text = engineResponse.value.data?[0].engineOil?.remarks ?? '';
      turboChargerRemarksController.value.text = engineResponse.value.data?[0].turboCharger?.remarks ?? '';
      engineMountRemarksController.value.text = engineResponse.value.data?[0].mount?.remarks ?? '';
      sumpRemarksController.value.text = engineResponse.value.data?[0].sump?.remarks ?? '';
      sumpController.value.text = engineResponse.value.data?[0].sump?.condition?.join(',') ?? '';
      remarksController.value.text = engineResponse.value.data?[0].engineComment ?? '';
      engineMountController.value.text = engineResponse.value.data?[0].mount?.condition?.join(',') ?? '';
      gearboxController.value.text = engineResponse.value.data?[0].gearBox?.condition?.join(',') ?? '';
      turboChargerController.value.text = engineResponse.value.data?[0].turboCharger?.condition?.join(',') ?? '';
      engineOilController.value.text = engineResponse.value.data?[0].engineOil?.condition?.join(',') ?? '';
      clutchOperationsController.value.text = engineResponse.value.data?[0].clutch?.condition?.join(',') ?? '';
      // otherSilencerController.value.text = engineResponse.value.data?[0];
      // otherClutchOperationController.value.text = engineResponse.value.data?[0];
      // otherGearBoxController.value.text = engineResponse.value.data?[0];
      // otherEngineOilController.value.text = engineResponse.value.data?[0];
      // otherTurboChargerController.value.text = engineResponse.value.data?[0];
      // otherEngineMountController.value.text = engineResponse.value.data?[0];
      // otherSumpController.value.text = engineResponse.value.data?[0];
    }
  }

  void getEngineData()async {
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.engineInfo+globals.carId.toString()),headers: globals.headers);
      if (response.statusCode == 200) {
        engineResponse.value = EngineResponse.fromJson(jsonDecode(response.body));
        print(response.body);
        loadData();
      }else{
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
    }
}
