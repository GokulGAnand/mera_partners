
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:developer';

import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../model/response/testdrive/testdrive_response.dart';
import '../../../utils/constants.dart';
import '../../../widgets/progressbar.dart';

class TestDriveViewModel extends GetxController {

  Rx<TextEditingController> steeringWheelController = TextEditingController().obs;
  Rx<TextEditingController> suspensionSystemController = TextEditingController().obs;
  Rx<TextEditingController> transmissionAutomaticController = TextEditingController().obs;
  Rx<TextEditingController> vehicleHornController = TextEditingController().obs;

  var selectedSteeringSystem = "".obs;
  // var selectedSteeringWheel = "".obs;
  RxList<String> selectedSteeringWheel = <String>[""].obs;
  var selectedSteeringAdjustment = "".obs;
  var selectedSteeringMounted = "".obs;
  var selectedCruiseControl = "".obs;
  var selectedSeatAdjustment = "".obs;
  // var selectedSuspensionSystem = "".obs;
  RxList<String> selectedSuspensionSystem = <String>[].obs;
  var selectedBrakes = "".obs;
  var selectedCluthSystem = "".obs;
  // var selectedTransmissionAutomatic = "".obs;
  RxList<String> selectedTransmissionAutomatic= <String>[].obs;
  // var selectedVehicleHorn = "".obs;
  RxList<String> selectedVehicleHorn = <String>[].obs;

  List<String> steeringWheelList = Constants.steeringWheelList;
  List<String> steeringSystemList = Constants.steeringSystemList;
  List<String> steeringAdjustmentList  = Constants.steeringAdjustmentList;
  List<String> steeringMountedAudioControlList = Constants.steeringMountedAudioControlList;
  List<String> cruiseControlList = Constants.cruiseControlList;
  List<String> seatAdjustmentList = Constants.seatAdjustmentList;
  List<String> suspensionSystemList  = Constants.suspensionSystemList ;
  List<String> brakesList  = Constants.brakesList ;
  List<String> clutchSystemList   = Constants.clutchSystemList  ;
  List<String> transmissionAutomaticList   = Constants.transmissionAutomaticList ;
  List<String>  vehicleHornList  = Constants. vehicleHornList ;



  final Rx<PageController> pageController = PageController(initialPage: 1).obs;

// the index of the current page
  var activePage = 0.obs;

  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var id = Get.arguments ?? '';
  
  
  void addTestDrive()async{
    ProgressBar.instance.showProgressbar(Get.context!);
    try{
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.testDriveInfo+'/'+globals.carId.toString()),
          body: json.encode({
            "steeringWheel": selectedSteeringWheel,
            "suspension": selectedSuspensionSystem,
            "steeringSystem": selectedSteeringSystem.value,
            "steeringAdjustment": selectedSteeringAdjustment.value,
            "steeringMountedAudioControl": selectedSteeringMounted.value,
            "cruiseControl": selectedCruiseControl.value,
            "seatAdjustment": selectedSeatAdjustment.value,
            "brakes": selectedBrakes.value,
            "clutchSystem":selectedCluthSystem.value,
            "vehicleHorn": selectedVehicleHorn,
            "vehicleHorn_other":"",
            "transmissionAutomatic": selectedTransmissionAutomatic,
            "transmissionManual": "good",
            "evaluationStatusForTestDrive":"COMPLETED"
          }), headers: {
            'Content-Type': 'application/json',
            'Authorization': '${globals.headers["Authorization"]}'
          }
      );
      if(response.statusCode ==200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        Get.offNamed(AppRoutes.dashBoardScreen);
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    }catch(e){
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  @override
  void onInit() {
    log(id);
    GetTestDriveInfo();
    super.onInit();
  }

 var testDriveResponse = testdrivelist().obs;

  void GetTestDriveInfo()async{
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.testDriveInfo+'/'+globals.carId.toString()),headers: globals.headers);
      if (response.statusCode ==200){
            testDriveResponse.value = testdrivelist.fromJson(json.decode(response.body));
            log(response.body.toString());
            loaddata();
          }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      print(e);
      ProgressBar.instance.stopProgressBar(Get.context!);
    }
  }

  void loaddata(){
    if(testDriveResponse.value.data!=null){
      selectedSteeringSystem.value = testDriveResponse.value.data?[0].steeringSystem?? '';
      selectedSteeringWheel.value = testDriveResponse.value.data?[0].steeringWheel as List<String>;
      steeringWheelController.value.text = selectedSteeringWheel.join(",");
      selectedSteeringAdjustment.value = testDriveResponse.value.data?[0].steeringAdjustment?? '';
      selectedSteeringMounted.value = testDriveResponse.value.data?[0].steeringMountedAudioControl?? '';
      selectedCruiseControl.value = testDriveResponse.value.data?[0].cruiseControl?? '';
      selectedSeatAdjustment.value = testDriveResponse.value.data?[0].seatAdjustment?? '';
      selectedSuspensionSystem.value = testDriveResponse.value.data?[0].suspension as List<String>;
      suspensionSystemController.value.text = selectedSuspensionSystem.join(",");
      selectedBrakes.value = testDriveResponse.value.data?[0].brakes?? '';
      selectedCluthSystem.value = testDriveResponse.value.data?[0].clutchSystem?? '';
      selectedTransmissionAutomatic.value = testDriveResponse.value.data?[0].transmissionAutomatic as List<String>;
      transmissionAutomaticController.value.text = selectedTransmissionAutomatic.join(",");
      selectedVehicleHorn.value = testDriveResponse.value.data?[0].vehicleHorn as List<String>;
      vehicleHornController.value.text = selectedVehicleHorn.join(",");
    }
  }

}
