
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AirConditioningViewModel extends GetxController{

  var selectedAcWorking = "".obs;
  var selectedCooling = "".obs;
  var selectedHeater = "".obs;
  var selectedClimateControl = "".obs;
  var selectedAcCondenserCompressor= "".obs;
  var selectedAcCFilterDamaged= "".obs;
  var selectedAcBlowerGrill= "".obs;
  var selectedRearDefogger= "".obs;


  List<String>acWorkingList = Constants.acWorkingList;
  List<String>coolingList = Constants.coolingList;
  List<String>heaterList = Constants.heaterList;
  List<String>climateControlList = Constants.climateControlList;
  List<String>acCondenserCompressorList = Constants.acCondenserCompressorList;
  List<String>acFilterDamagedList = Constants.acFilterDamagedList;
  List<String>acBlowerGrillList = Constants.acBlowerGrillList;
  List<String>rearDefoggerList = Constants.rearDefoggerList;



  final Rx<PageController> pageController = PageController(initialPage: 1).obs;
  // the index of the current page
  var activePage = 0.obs;

}