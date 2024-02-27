import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../../model/response/pending_evaluation/pending_evaluation_response.dart';
import '../../service/endpoints.dart';

class CompletedEvaluationViewModel extends GetxController{

  Rx<TextEditingController> searchController = TextEditingController().obs;

  @override
  void onInit() {
    fetchEvaluatedList();
    super.onInit();
  }

  var carBasic = PendingEvaluationList().obs;
  var carBasicResponse = PendingEvaluationList().obs;


  void applyFilter(String? value) {
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


  void fetchEvaluatedList() async {
    try {
      print(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}?status=EVALUATED'));
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}?status=EVALUATED'),headers: globals.headers);
      if(response.statusCode == 200){
        carBasicResponse.value = PendingEvaluationList.fromJson(json.decode(response.body));
        carBasic.value = carBasicResponse.value;
        // CustomToast.instance.showMsg(MyStrings.success);
      }
      log(carBasicResponse.toString());
      log(response.body);
    } catch (e) {
      log(e.toString());
      // CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

}