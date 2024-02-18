import 'dart:convert';
import 'dart:developer';
import 'dart:developer';

import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../model/response/pending_evaluation/pending_evaluation_response.dart';
import '../../service/exception_error_util.dart';
import '../../widgets/custom_toast.dart';

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
      var response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.evaluation + '?status=PENDING_EVALUATION'), headers: headers);
      if (response.statusCode == 200) {
        carBasicResponse.value = PendingEvaluationList.fromJson(json.decode(response.body));
        carBasic.value = PendingEvaluationList.fromJson(json.decode(response.body));
      }
      print(carBasicResponse.toString());
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  void applySearch(String? value) {
    var tempList = <Data>[];

    if (value != null) {
      for (int i = 0; i < carBasicResponse.value.data!.length; i++) {
        if (carBasicResponse.value.data![i].make!.toString().contains(value!)) {
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

  static var client = http.Client();

  static Future<String?> fetchCarBasicsData() async {
    try {
      // var headers = {'Authorization': 'Bearer ${globals.token }'''};
      var headers = {'Authorization': 'Bearer ${globals.token ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWFmNGYzYmZjYmJiOWE4M2I1NzIwZDUiLCJyb2xlIjoiRVZBTFVBVE9SIiwiaWF0IjoxNzA2OTMyNTAwLCJleHAiOjE3MDk1MjQ1MDB9.y83Qn53yyOsWS8W2-9nt7pU6i7MOwCm8_8pIu4l90gg'}'};
      var query = "?status=PENDING_EVALUATION";
      // final response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.pending+query), headers: headers);
      var url = EndPoints.baseUrl + EndPoints.pending + query;
      var response = await client.get(Uri.parse(url), headers: headers);
      if (kDebugMode) {
        print(response.body.toString());
      }
      var responseCode = response.statusCode;

      if (responseCode == 200) {
        var jsonString = response.body;
        var jsonObj = jsonDecode(jsonString);

        return jsonObj;
      } else {
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Exception:$error');
      }
    }
  }

  // test

  var clients = http.Client();

  Future<String?> fetchCarBasicsDatas() async {
    try {
      // var headers = {'Authorization': 'Bearer ${globals.token }'''};
      var headers = {'Authorization': 'Bearer ${globals.token ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWFmNGYzYmZjYmJiOWE4M2I1NzIwZDUiLCJyb2xlIjoiRVZBTFVBVE9SIiwiaWF0IjoxNzA2OTMyNTAwLCJleHAiOjE3MDk1MjQ1MDB9.y83Qn53yyOsWS8W2-9nt7pU6i7MOwCm8_8pIu4l90gg'}'};
      var query = "?status=PENDING_EVALUATION";
      // final response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.pending+query), headers: headers);
      var url = EndPoints.baseUrl + EndPoints.pending + query;
      var response = await clients.get(Uri.parse(url), headers: headers);
      if (kDebugMode) {
        print(response.body.toString());
      }
      var responseCode = response.statusCode;

      if (responseCode == 200) {
        var jsonString = response.body;
        var jsonObj = jsonDecode(jsonString);

        return jsonObj;
      } else {
        return null;
      }
    } catch (error) {
      log(error.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(error).errorMessage ?? '');
    }
  }
}
