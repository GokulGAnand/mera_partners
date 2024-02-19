
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
}
