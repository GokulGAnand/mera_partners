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
  var carBasic = PendingEvaluationList().obs;

  void applyFilter(String? value){
    var tempList = <Data>[];
    for(int i=0; i<carBasic.value.data!.length; i++){
      if(carBasic.value.data![i].createdAt!.toString().contains(value!)){
        tempList.add(carBasic.value.data![i]);
      }
    }

    carBasic.value.data = tempList;
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