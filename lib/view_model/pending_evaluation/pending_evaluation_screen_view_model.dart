import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

class PendingEvaluationViewModel extends GetxController {
  Rx<TextEditingController> pendingEvaluationController = TextEditingController().obs;
  final RxList<Map<String, dynamic>> carBasicsData = <Map<String, dynamic>>[].obs;

  Future<void> fetchCarBasicsData() async {
    try {
      var headers = {'Authorization': 'Bearer ${globals.token ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWFmNGYzYmZjYmJiOWE4M2I1NzIwZDUiLCJyb2xlIjoiRVZBTFVBVE9SIiwiaWF0IjoxNzA2OTMyNTAwLCJleHAiOjE3MDk1MjQ1MDB9.y83Qn53yyOsWS8W2-9nt7pU6i7MOwCm8_8pIu4l90gg'}'};
      final response = await GetConnect().get(EndPoints.baseUrl + EndPoints.pending, headers: headers, query: {'status': 'PENDING_EVALUATION'});
      if (kDebugMode) {
        print(response.body.toString());
      }
      if (response.status.hasError) {
        if (kDebugMode) {
          print('Error:${response.statusText}');
        }
      } else {
        carBasicsData.assignAll(response.body);
      }
    } catch (error) {
      if (kDebugMode) {
        print('Exception:$error');
      }
    }
  }
}
