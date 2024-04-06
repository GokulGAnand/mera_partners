import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/utils/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
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
    {"title": MyStrings.lostDeals, "isClick" : false.obs}
  ];

  @override
  void onInit() {
    getNegotiationCarsData();
    super.onInit();
  }

  void getNegotiationCarsData() async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=NEGOTIATION').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=NEGOTIATION'), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
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
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.status + carId), body: jsonEncode({ "status": status }));

      if (response.statusCode == 200) {
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