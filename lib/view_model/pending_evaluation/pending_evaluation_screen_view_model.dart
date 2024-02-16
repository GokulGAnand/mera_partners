import 'dart:developer';

import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../service/exception_error_util.dart';
import '../../widgets/custom_toast.dart';

class PendingEvaluationViewModel extends GetxController {
  Rx<TextEditingController> pendingEvaluationController = TextEditingController().obs;
  final RxList<Map<String, dynamic>> carBasicsData = <Map<String, dynamic>>[].obs;

  Future<void> fetchCarBasicsData() async {
    try {
      final response = await GetConnect().get(EndPoints.baseUrl + EndPoints.pending, headers: globals.headers, query: {'status': 'PENDING_EVALUATION'});
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
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
