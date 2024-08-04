import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:get/get.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class OrderScreenViewModel extends GetxController {
  var carListResponse = CarListResponse().obs;
  RxBool isNegotiation = true.obs;
  List<Map<String, dynamic>> negotiationOrdersCategory = [
    {"title": MyStrings.negotiation, "isClick": true.obs},
    {"title": MyStrings.lostDeals, "isClick": false.obs}
  ];

  @override
  void onInit() {
    getNegotiationCarsData();
    super.onInit();
  }

  void getNegotiationCarsData() async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.status}?status=NEGOTIATION');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);

        carListResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
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

  void acceptOrRejectOffer(String status, String carId) async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var response = await ApiManager.patch(endpoint: EndPoints.status + carId, body: {"status": status});

      if (response.statusCode == 200) {
        CustomToast.instance.showMsg(MyStrings.success);
        ProgressBar.instance.stopProgressBar(Get.context!);
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
