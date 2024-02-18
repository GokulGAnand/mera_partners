import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';

class EngineViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;
  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;

  ///page one
  Rx<TextEditingController> engineCompartmentImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> otherEngineConditionController = TextEditingController().obs;
  Rx<TextEditingController> otherRadiatorController = TextEditingController().obs;
  Rx<TextEditingController> otherSmokeController = TextEditingController().obs;
  Rx<TextEditingController> otherCoolantController = TextEditingController().obs;
  Rx<TextEditingController> otherBlowbyController = TextEditingController().obs;
  Rx<TextEditingController> otherStartingMotorController = TextEditingController().obs;
  Rx<TextEditingController> engineIdleStartVideoRemarksController = TextEditingController().obs;
  Rx<TextEditingController> radiatorRemarksController = TextEditingController().obs;
  Rx<TextEditingController> startingMotorRemarksController = TextEditingController().obs;
  Rx<TextEditingController> blowByRemarksController = TextEditingController().obs;

  Rx<File?> engineCompartmentImage = Rx<File?>(null);
  Rx<File?> blowByBackCompressionImage = Rx<File?>(null);
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
  Rx<TextEditingController> clutchOperationsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> gearBoxImageRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineOilRemarksController = TextEditingController().obs;
  Rx<TextEditingController> turboChargerRemarksController = TextEditingController().obs;
  Rx<TextEditingController> engineMountRemarksController = TextEditingController().obs;
  Rx<TextEditingController> sumpRemarksController = TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;
  Rx<TextEditingController> otherSilencerController = TextEditingController().obs;
  Rx<TextEditingController> otherClutchOperationController = TextEditingController().obs;
  Rx<TextEditingController> otherGearBoxController = TextEditingController().obs;
  Rx<TextEditingController> otherEngineOilController = TextEditingController().obs;
  Rx<TextEditingController> otherTurboChargerController = TextEditingController().obs;
  Rx<TextEditingController> otherEngineMountController = TextEditingController().obs;
  Rx<TextEditingController> otherSumpController = TextEditingController().obs;

  void updateEngine() async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse('http://43.205.61.101:8080/api/v1/engineinfo/65ca3fe9036620cc1bd347a7'));
      request.fields.addAll({'engineCylinder': '4', 'engineCompartment': '', 'engineCondition': 'good', 'engineSound': 'good', 'engineTappetVideo': '', 'battery': 'good', 'radiator': 'good', 'blowBy': 'good', 'exhaustSmoke': 'good', 'silencer': 'good', 'clutch': 'good', 'gearBox': 'good', 'engineOil': 'good', 'engineComment': 'good', 'startingMotor': 'working', 'coolant': 'working', 'compression': 'good', 'turboCharger': 'good', 'gearBoxLeakage': 'no', 'mount': 'ok', 'sump': 'ok', 'summary': 'best engine condition ', 'startVideo': '', 'updateEngineStar': '', 'evaluationStatusForEngine': ''});
      request.files.add(await http.MultipartFile.fromPath('engineCompartment', '/Users/lalatendupany/Downloads/IMG_5882.jpg'));
      request.files.add(await http.MultipartFile.fromPath('engineTappetVideo', '/Users/lalatendupany/Downloads/vecteezy_derramando-oleo-sintetico-novo-e-limpo-no-motor-do-carro_8084902 (1).mp4'));
      request.headers.addAll(globals.headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
      } else {
        CustomToast.instance.showMsg(response.reasonPhrase.toString());
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
