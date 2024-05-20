import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mera_partners/view_model/home/live/live_cars_list_view_model.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../model/response/user_data/user_car_details_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class OTBCarsListViewModel extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxList<String> searchList = <String>[].obs;

  var carsListResponse = CarListResponse().obs;
  var likeResponse = UserResponse().obs;


  //declare pagination controller
  final PagingController<int,Data> infinitePagingController=PagingController(firstPageKey: 1);
  int limit = 10;

  @override
  void onInit() {
    likeResponse.value = Get.find<LiveCarsListViewModel>().likeResponse.value;
    infinitePagingController.addPageRequestListener((pageKey) {
      getCarData(pageKey);
    });
    super.onInit();
  }

  void updateCars(dynamic newData) {
    carsListResponse.value.data = newData;
    infinitePagingController.refresh();
    update();
    refresh();
    notifyChildrens();
  }

  void getCarData(int pageKey) async {
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=OTB&page=$pageKey&limit=$limit'), headers: globals.headers);
      log(response.body);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        carsListResponse.value = CarListResponse();
        carsListResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        final isLastPage = carsListResponse.value.data!.length < limit;
        if (isLastPage) {
          infinitePagingController.appendLastPage(carsListResponse.value.data!);
        } else {
          final nextPageKey = pageKey + 1;
          infinitePagingController.appendPage(carsListResponse.value.data!, nextPageKey);
        }
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

  void buyOTBCar(String carId, num otbAmount) async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var response = await http.post(Uri.parse('${EndPoints.baseUrl}${EndPoints.otb}'), headers: globals.jsonHeaders,
          body: jsonEncode({
            "carId": carId,
            "otb_amount": otbAmount,
          }));

      if (response.statusCode == 200) {
        CustomToast.instance.showMsgWithIcon(MyStrings.success,Image.asset(MyImages.car));
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
