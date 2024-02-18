import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../../model/response/pending_evaluation/pending_evaluation_response.dart';
import '../../service/endpoints.dart';
import '../../service/exception_error_util.dart';
import '../../widgets/custom_toast.dart';

class CompletedEvaluationViewModel extends GetxController{

  Rx<TextEditingController> searchController = TextEditingController().obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  var carBasic = PendingEvaluationList().obs;
  var carBasicResponse = PendingEvaluationList().obs;


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
      var headers = {'Authorization': 'Bearer ${globals.token}'};
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=COMPLETED_EVALUATION'),headers: headers);
      if(response.statusCode == 200){
        carBasic.value = PendingEvaluationList.fromJson(json.decode(response.body));
      }
      log(carBasic.toString());
      log(response.body.toString());
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

}