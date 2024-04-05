
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';
import 'package:http/http.dart'as http;
import 'package:evaluator_app/utils/globals.dart' as globals;


class RcTransferViewModel extends GetxController{
  var liveCarsResponse = CarListResponse().obs;

  @override
  void onInit() {
    getRcTransfer();
    super.onInit();
  }
  getRcTransfer() async {
    try {
      String url = '${EndPoints.baseUrl}${EndPoints.status}?status=RCTRANSFER';
      if (globals.uniqueUserId != null) {
        url += '&winner=${globals.uniqueUserId}';
      }
      log(Uri.parse(url).toString());
      var response = await http.get(Uri.parse(url), headers: globals.headers);
      if (response.statusCode == 200) {
        log("Response ss : ${response.body}");
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        liveCarsResponse.value =CarListResponse.fromJson(jsonDecode(response.body));
      }else{
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