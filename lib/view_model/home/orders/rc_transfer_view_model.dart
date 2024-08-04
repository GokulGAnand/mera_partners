import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/service/api_manager.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class RcTransferViewModel extends GetxController {
  void clearSearch() {
    searchRcTransferController.clear();
    isShowFullListRcTransfer.value = true;
    update();
  }

  RxBool isShowFullListRcTransfer = true.obs;

  TextEditingController searchRcTransferController = TextEditingController();
  RxList<Data> searchRcTransferList = <Data>[].obs;

  var liveCarsResponse = CarListResponse().obs;

  @override
  void onInit() {
    getRcTransfer();
    super.onInit();
  }

  getRcTransfer() async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.status}?status=RCTRANSFER');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);

        liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        searchRcTransferList.value = CarListResponse.fromJson(jsonDecode(response.body)).data!;
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
