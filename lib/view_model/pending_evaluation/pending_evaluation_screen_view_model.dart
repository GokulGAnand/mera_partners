import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:evaluator_app/widgets/progressbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../model/response/pending_evaluation/pending_evaluation_response.dart';

class PendingEvaluationViewModel extends GetxController {
  Rx<TextEditingController> pendingEvaluationController = TextEditingController().obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  var carBasic = PendingEvaluationList().obs;
  var carBasicResponse = PendingEvaluationList().obs;

  // PendingEvaluationList? carBasic;

  void fetchData() async {
    try {
      var headers = {'Authorization': 'Bearer ${globals.token}'};
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}?status=PENDING_EVALUATION'),headers: headers);
      if(response.statusCode == 200){
        carBasicResponse.value = PendingEvaluationList.fromJson(json.decode(response.body));
        carBasic.value = PendingEvaluationList.fromJson(json.decode(response.body));
          }
      log(carBasicResponse.toString());
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  void deleteEvaluation(String carId) async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      log(Uri.parse(EndPoints.baseUrl+EndPoints.carBasic+carId).toString());
      var response = await http.delete(Uri.parse(EndPoints.baseUrl+EndPoints.carBasic+carId),headers: globals.headers);

      if(response.statusCode == 200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(MyStrings.success);
        update();
        refresh();
        notifyChildrens();
        fetchData();
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
      ProgressBar.instance.stopProgressBar(Get.context!);
    }
  }

  void applySearch(String? value) {
    var tempList = <Data>[];

    if (value != null) {
      for (int i = 0; i < carBasicResponse.value.data!.length; i++) {
        if(carBasicResponse.value.data![i].make != null){
          if (carBasicResponse.value.data![i].make!.toString().toLowerCase().contains(value.toLowerCase())) {
            tempList.add(carBasicResponse.value.data![i]);
          }
        } else {
          tempList.add(carBasicResponse.value.data![i]);
        }
      }
      carBasic.value = PendingEvaluationList();
      carBasic.value.data = tempList;
      update();
      refresh();
      notifyChildrens();
    } else {
      carBasic.value = carBasicResponse.value;
    }
  }

}
