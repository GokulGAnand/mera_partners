import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class ProcuredScreenViewModel extends GetxController {
  void clearSearch() {
    searchController.clear();
    isShowFullListProcured.value = true;
    update();
  }

  RxBool isShowFullListProcured = true.obs;
  TextEditingController searchController = TextEditingController();
  RxList<Data> searchList = <Data>[].obs;

  var liveCarsResponse = CarListResponse().obs;

  @override
  void onInit() {
    getProcuredBill();
    super.onInit();
  }

  launchCaller() async {
    Uri url = Uri(scheme: "tel", path: "+91 81130 27722");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getProcuredBill() async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.status}?status=PROCUREMENT');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        searchList.value = CarListResponse.fromJson(jsonDecode(response.body)).data!;
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
