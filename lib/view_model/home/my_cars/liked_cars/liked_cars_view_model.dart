import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class LikedCarsListViewModel extends GetxController{

  var carListResponse = CarListResponse().obs;
  RxInt bidValue = 172000.obs;

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