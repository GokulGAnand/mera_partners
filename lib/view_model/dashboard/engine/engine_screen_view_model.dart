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

  void updateEngine() async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl+EndPoints.engineInfo+id));
      for(int i = 0; i < selectedEngine.length; i++){
        request.fields['engineCondition[$i]'] = selectedEngine[i];
      }
      for(int i = 0; i < selectedBattery.length; i++){
        request.fields['battery[$i]'] = selectedBattery[i];
      }
      for(int i = 0; i < selectedBlowBy.length; i++){
        request.fields['blowBy[$i]'] = selectedBlowBy[i];
      }
      for(int i = 0; i < selectedClutchOperations.length; i++){
        request.fields['clutch[$i]'] = selectedClutchOperations[i];
      }
      for(int i = 0; i < selectedGearBox.length; i++){
        request.fields['gearBox[$i]'] = selectedGearBox[i];
      }
      for(int i = 0; i < selectedEngineOil.length; i++){
        request.fields['engineOil[$i]'] = selectedEngineOil[i];
      }
      for(int i = 0; i < selectedTurboCharger.length; i++){
        request.fields['turboCharger[$i]'] = selectedTurboCharger[i];
      }
      for(int i = 0; i < selectedEngineMount.length; i++){
        request.fields['mount[$i]'] = selectedEngineMount[i];
      }
      for(int i = 0; i < selectedSump.length; i++){
        request.fields['sump[$i]'] = selectedSump[i];
      }
      request.fields.addAll({
        'engineSound': selectedEngineSound.value,
        'radiator': selectedRadiator.value,
        'exhaustSmoke': selectedSmoke.value,
        'silencer': selectedSilencer.value,
        'engineComment': remarksController.value.text,
        'startingMotor': selectedStartingMotor.value,
        'coolant': selectedCoolant.value,
        'compression': 'good',
        'gearBoxLeakage': selectedGearBoxLeak.value,
        'summary': 'best engine condition ',
        'evaluationStatusForEngine': 'COMPLETED',
        'engineCompartment_remarks': engineCompartmentImageRemarks.value.text,
        'startVideo_remarks': engineIdleStartVideoRemarksController.value.text,
        // 'engineCompartment_condition[0]': 'good',
        // 'engineCompartment_condition[1]': 'bad',
        // 'startVideo_condition[0]': 'good',
        // 'startVideo_condition[1]': 'noisy'
      });
      request.files.add(http.MultipartFile.fromBytes('engineCompartment', engineCompartmentImage.value!.readAsBytesSync()));
      request.files.add(http.MultipartFile.fromBytes('startVideo', engineIdleStartVideo.value!.readAsBytesSync()));
      request.headers.addAll(globals.headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.toNamed(AppRoutes.dashBoardScreen);
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
    if(engineResponse.value.data != null){
      engineCompartmentImageRemarks.value.text = engineResponse.value.data?[0].engineCompartment?.remarks ?? '';
      engineIdleStartVideoRemarksController.value.text = engineResponse.value.data?[0].startVideo?.remarks ?? '';
      // batteryRemarksController.value.text = engineResponse.value.data?[0].battery?.remarks ?? '';
      // engineRemarksController.value.text = engineResponse.value.data?[0].en?.remarks ?? '';
      // blowByRemarksController.value.text = engineResponse.value.data?[0].startVideo?.remarks ?? '';
      // startingMotorRemarksController.value.text = engineResponse.value.data?[0].startingMotor?.remarks ?? '';
      // radiatorRemarksController.value.text = engineResponse.value.data?[0].radiator?.remarks ?? '';
    }
  }

  void getEngineData()async {
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.engineInfo+id),headers: globals.headers);
      engineResponse.value = EngineResponse.fromJson(jsonDecode(response.body));
      loadData();
    } catch (e) {
      print(e);
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
    }
}
