import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:get/get.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;

class MyCarsScreenViewModel extends GetxController {

  var carListResponse = CarListResponse().obs;

  @override
  void onInit() {
    getCarData();
    super.onInit();
  }

  void getCarData()async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LikedCar').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LikedCar'),headers: globals.headers);
      log(response.body);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        carListResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        log(response.body);
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