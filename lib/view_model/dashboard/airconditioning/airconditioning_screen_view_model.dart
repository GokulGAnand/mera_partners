
import 'dart:developer';

import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';


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

  var id = Get.arguments ?? '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  void addCondition()async{
    try{
      var response =  await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.acInfo+'/'+id),
          body: {
            "airCooling":selectedCooling.value,
            "heater":selectedHeater.value,
            "climateControl":selectedClimateControl.value,
            "acCondensor":selectedAcCondenserCompressor.value,
            "acWorking": selectedAcWorking.value,
            "acFilterDamaged": selectedAcCFilterDamaged.value,
            "acBlowerGrill": selectedAcBlowerGrill.value,
            "rearDefogger": selectedRearDefogger.value,
          },
          headers: globals.headers
      );
      if (response.statusCode ==200){
        Get.toNamed(AppRoutes.dashBoardScreen);
      }
    }catch(e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
  }
  }




}