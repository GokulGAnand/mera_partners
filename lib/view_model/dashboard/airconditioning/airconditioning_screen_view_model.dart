
import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../../model/response/airconditioning/airconditioning_response.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';


class AirConditioningViewModel extends GetxController{

  Rx<TextEditingController> coolingController = TextEditingController().obs;
  Rx<TextEditingController> acCondenserCompressorController = TextEditingController().obs;

  var selectedAcWorking = "".obs;
  // var selectedCooling = "".obs;
  RxList<String> selectedCooling = <String>[].obs;
  var selectedHeater = "".obs;
  var selectedClimateControl = "".obs;
  // var selectedAcCondenserCompressor= "".obs;
  RxList<String> selectedAcCondenserCompressor = <String>[].obs;
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

  var airConditionResponse = airconditininglist().obs;


  @override
  void onInit() {
    print(id);
    getAcinfo();
    super.onInit();
  }



  void addCondition()async{
    ProgressBar.instance.showProgressbar(Get.context!);
    try{
      print(Uri.parse(EndPoints.baseUrl+EndPoints.acInfo+'/'+globals.carId.toString()));
      print(json.encode({
        "airCooling":selectedCooling,
        "heater":selectedHeater.value,
        "climateControl":selectedClimateControl.value,
        "acCondensor":selectedAcCondenserCompressor,
        "acWorking": selectedAcWorking.value,
        "acFilterDamaged": selectedAcCFilterDamaged.value,
        "acBlowerGrill": selectedAcBlowerGrill.value,
        "rearDefogger": selectedRearDefogger.value,
        "evaluationStatusForAc":"COMPLETED"
      }),);
      var response =  await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.acInfo+'/'+globals.carId.toString()),
          body: json.encode({
            "airCooling":selectedCooling,
            "heater":selectedHeater.value,
            "climateControl":selectedClimateControl.value,
            "acCondensor":selectedAcCondenserCompressor,
            "acWorking": selectedAcWorking.value,
            "acFilterDamaged": selectedAcCFilterDamaged.value,
            "acBlowerGrill": selectedAcBlowerGrill.value,
            "rearDefogger": selectedRearDefogger.value,
            "evaluationStatusForAc":"COMPLETED"
          }),
          headers: globals.jsonHeaders
      );
      print(response.body.toString());
      if (response.statusCode ==200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
        Get.offNamed(AppRoutes.dashBoardScreen);
      } else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    }catch(e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
  }
  }


  void getAcinfo()async{
    var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.acInfo+'/'+globals.carId.toString()),headers: globals.headers);
    if(response.statusCode == 200){
      airConditionResponse.value = airconditininglist.fromJson(json.decode(response.body));
      log(response.body);
      loadData();
    }
  }

  void loadData(){
    if(airConditionResponse.value.data!=null){
      selectedCooling.value = airConditionResponse.value.data?[0].airCooling as List<String>;
      coolingController.value.text = selectedCooling.join(",");
      selectedAcWorking.value = airConditionResponse.value.data?[0].acWorking?? '';
      selectedHeater.value = airConditionResponse.value.data?[0].heater?? '';
      selectedClimateControl.value = airConditionResponse.value.data?[0].climateControl?? '';
      selectedAcCondenserCompressor.value = airConditionResponse.value.data?[0].acCondensor as List<String>;
      acCondenserCompressorController.value.text = selectedAcCondenserCompressor.join(",");
      selectedAcCFilterDamaged.value = airConditionResponse.value.data?[0].acFilterDamaged?? '';
      selectedAcBlowerGrill.value = airConditionResponse.value.data?[0].acBlowerGrill?? '';
      selectedRearDefogger.value = airConditionResponse.value.data?[0].rearDefogger?? '';

    }
  }



}