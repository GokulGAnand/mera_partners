import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/service/endpoints.dart';
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
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=PENDING_EVALUATION'),headers: headers);
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

  void applySearch(String? value) {
    var tempList = <Data>[];

    if (value != null) {
      for (int i = 0; i < carBasicResponse.value.data!.length; i++) {
        if (carBasicResponse.value.data![i].make!.toString().contains(value)) {
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
