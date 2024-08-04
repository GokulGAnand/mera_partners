import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/model/response/user_data/user_car_details_response.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:mera_partners/view_model/home/orders/procured_bill_view_model.dart';
import 'package:mera_partners/view_model/home/orders/rc_transfer_view_model.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/constants.dart';
import '../../../utils/enum.dart';
import '../../../utils/shared_pref_manager.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class NegotiationViewModel extends GetxController {
  void clearNegotiationSearch() {
    searchNegotiationController.clear();
    isShowFullListNegotiation.value = true;
    update();
  }

  void clearLostSearch() {
    searchLostController.clear();
    isShowFullListLost.value = true;
    update();
  }

  RxBool isShowFullListLost = true.obs;
  RxBool isShowFullListNegotiation = true.obs;
  TextEditingController searchNegotiationController = TextEditingController();
  RxList<Data> searchNegotiationList = <Data>[].obs;

  TextEditingController searchLostController = TextEditingController();
  RxList<LostDeal> searchLostList = <LostDeal>[].obs;

  var carListResponse = CarListResponse().obs;
  var lostDealsData = UserResponse().obs;
  RxBool isNegotiation = true.obs;
  List<Master> negotiationCategory = [
    Master(MyStrings.negotiation, true.obs),
    Master(MyStrings.lostDeals, false.obs),
  ];
  List<Map<String, dynamic>> negotiationOrdersCategory = [
    {"title": MyStrings.negotiation, "isClick": true.obs},
    {"title": MyStrings.lostDeals, "isClick": false.obs}
  ];

  @override
  void onInit() {
    getNegotiationCarsData();
    getLostDeal();
    super.onInit();
  }

  void onEnd() {
    if (Get.isRegistered<NegotiationViewModel>()) {
      Get.find<NegotiationViewModel>().getNegotiationCarsData();
      Get.find<NegotiationViewModel>().getLostDeal();
    }
    if (Get.isRegistered<ProcuredScreenViewModel>()) {
      Get.find<ProcuredScreenViewModel>().getProcuredBill();
    }
    if (Get.isRegistered<RcTransferViewModel>()) {
      Get.find<RcTransferViewModel>().getRcTransfer();
    }
  }

  void getNegotiationCarsData() async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.status}?status=NEGOTIATION');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        carListResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        searchNegotiationList.value = CarListResponse.fromJson(jsonDecode(response.body)).data!;
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

  void getLostDeal() async {
    try {
      var response = await ApiManager.get(endpoint: EndPoints.users + globals.uniqueUserId!);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        lostDealsData.value = UserResponse.fromJson(jsonDecode(response.body));
        searchLostList.value = lostDealsData.value.data?.first.lostDeal ?? [];
        if (lostDealsData.value.data!.isNotEmpty && (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false)) {
          globals.documentStatus = lostDealsData.value.data?.first.isDocumentsVerified;
          globals.isDeposited = lostDealsData.value.data?.first.isDeposited;
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, lostDealsData.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, lostDealsData.value.data!.first.isDeposited ?? false);
        }
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void acceptOrRejectOffer(String status, String carId) async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var response = await ApiManager.patch(endpoint: EndPoints.status + carId, body: {"status": status});
      if (response.statusCode == 200) {
        CustomToast.instance.showMsg(MyStrings.success);
        ProgressBar.instance.stopProgressBar(Get.context!);
        getNegotiationCarsData();
        getLostDeal();
        if (Get.isRegistered<ProcuredScreenViewModel>()) {
          Get.find<ProcuredScreenViewModel>().getProcuredBill();
        }
        if (Get.isRegistered<RcTransferViewModel>()) {
          Get.find<RcTransferViewModel>().getRcTransfer();
        }
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
  }
}

class Master {
  String title;
  RxBool isClick = false.obs;

  Master(this.title, this.isClick);
}
