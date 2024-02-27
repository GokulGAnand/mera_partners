
import 'dart:convert';
import 'dart:math';

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

class TestDriveViewModel extends GetxController {
  var selectedSteeringSystem = "".obs;
  var selectedSteeringWheel = "".obs;
  var selectedSteeringAdjustment = "".obs;
  var selectedSteeringMounted = "".obs;
  var selectedCruiseControl = "".obs;
  var selectedSeatAdjustment = "".obs;
  var selectedSuspensionSystem = "".obs;
  var selectedBrakes = "".obs;
  var selectedCluthSystem = "".obs;
  var selectedTransmissionAutomatic = "".obs;
  var selectedVehicleHorn = "".obs;


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
    try{
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.testDriveInfo+'/'+globals.carId.toString()),
          body: {
            "steeringWheel": selectedSteeringWheel.value,
            "suspension": selectedSuspensionSystem.value,
            "steeringSystem": selectedSteeringSystem.value,
            "steeringAdjustment": selectedSteeringAdjustment.value,
            "steeringMountedAudioControl": selectedSteeringMounted.value,
            "cruiseControl": selectedCruiseControl.value,
            "seatAdjustment": selectedSeatAdjustment.value,
            "brakes": selectedBrakes.value,
            "clutchSystem":selectedCluthSystem.value,
            "vehicleHorn": selectedVehicleHorn.value,
            "transmissionAutomatic": selectedTransmissionAutomatic.value
          }, headers: globals.headers
      );
      if(response.statusCode ==200){
        Get.toNamed(AppRoutes.dashBoardScreen);
      }
    }catch(e){
      log.toString();
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }

  }

  @override
  void onInit() {
    print(id);
    GetTestDriveInfo();
    super.onInit();
  }

 var testDriveResponse = testdrivelist().obs;

  void GetTestDriveInfo()async{
    var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.testDriveInfo+'/'+globals.carId.toString()),headers: globals.headers);
    if (response.statusCode ==200){
      testDriveResponse.value = testdrivelist.fromJson(json.decode(response.body));
    }
      print(response.body);
  }

  void loaddata(){
    if(testDriveResponse.value.data!=null){
      selectedSteeringSystem.value = testDriveResponse.value.data?[0].steeringSystem?? '';
      selectedSteeringWheel.value = testDriveResponse.value.data?[0].steeringWheel?? '';
      selectedSteeringAdjustment.value = testDriveResponse.value.data?[0].steeringAdjustment?? '';
      selectedSteeringMounted.value = testDriveResponse.value.data?[0].steeringMountedAudioControl?? '';
      selectedCruiseControl.value = testDriveResponse.value.data?[0].cruiseControl?? '';
      selectedSeatAdjustment.value = testDriveResponse.value.data?[0].seatAdjustment?? '';
      selectedSuspensionSystem.value = testDriveResponse.value.data?[0].suspension?? '';
      selectedBrakes.value = testDriveResponse.value.data?[0].brakes?? '';
      selectedCluthSystem.value = testDriveResponse.value.data?[0].clutchSystem?? '';
      selectedTransmissionAutomatic.value = testDriveResponse.value.data?[0].transmissionAutomatic?? '';
      selectedVehicleHorn.value = testDriveResponse.value.data?[0].vehicleHorn?? '';
    }
  }

}
