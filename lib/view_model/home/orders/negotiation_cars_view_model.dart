import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mera_partners/model/response/user_data/user_car_details_response.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class NegotiationViewModel extends GetxController {

  TextEditingController searchNegotiationController = TextEditingController();
  RxList<Data> searchNegotiationList = <Data>[].obs;

  TextEditingController searchLostController = TextEditingController();
  RxList<LostDeal> searchLostList = <LostDeal>[].obs;
  
  var carListResponse = CarListResponse().obs;
  var lostDealsData = UserResponse().obs;
  RxBool isNegotiation = true.obs;
  List<Master> negotiationCategory = [Master(MyStrings.negotiation, true.obs),Master(MyStrings.lostDeals, false.obs),];
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

  void getNegotiationCarsData() async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/?status=NEGOTIATION').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/?status=NEGOTIATION'), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log("Negotiation Response\n${response.body}");
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
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        lostDealsData.value = UserResponse.fromJson(jsonDecode(response.body));
        searchLostList.value = UserResponse.fromJson(jsonDecode(response.body)).data![0].lostDeal ?? [];
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
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId'), headers: globals.jsonHeaders, body: jsonEncode({"status": status}));

      if (response.statusCode == 200) {
        CustomToast.instance.showMsg(MyStrings.success);
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
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

class Master{
  String title;
  RxBool isClick = false.obs;

  Master(this.title,this.isClick);
}
