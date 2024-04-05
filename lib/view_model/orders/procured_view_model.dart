
import 'package:get/get.dart';
import '../../model/response/live/live_cars_list_response.dart';
import '../../service/endpoints.dart';
import '../../service/exception_error_util.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/progressbar.dart';
import 'dart:convert';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http/http.dart'as http;


class ProcuredScreenViewModel extends GetxController{
  var liveCarsResponse = LiveCarsResponse().obs;
  @override
  void onInit() {
    getProcuredBill();
    super.onInit();
  }
  void getProcuredBill()async {
    try {
      print(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}?status=PROCUREMENT').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}?status=PROCUREMENT'), headers: globals.headers);
      if (response.statusCode == 200) {
        print("Response sv : ${response.body}" );
        ProgressBar.instance.stopProgressBar(Get.context!);
        liveCarsResponse.value = LiveCarsResponse.fromJson(jsonDecode(response.body));
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.reasonPhrase.toString());
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      print(e.toString() );
      CustomToast.instance.showMsg(ExceptionErrorUtil .handleErrors(e).errorMessage ?? '');

      
    }
  }
}