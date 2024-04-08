import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class BidCarsListViewModel extends GetxController{

  var bidCarsResponse = CarListResponse().obs;
  var carListResponse = CarListResponse().obs;

  List<int> bid = [
    2000,
    5000,
    10000
  ];
  RxInt bidValue = 172000.obs;

  //declare pagination controller
  // final PagingController<int,Data> infinitePagingController=PagingController(firstPageKey: 1);
  // int limit = 10;

  @override
  void onInit() {
    // infinitePagingController.addPageRequestListener((pageKey) {
      getCarData();
      getLikedCarData();
    // });
    super.onInit();
  }


  /// Like Feature API integration
  void updateLikedCar(String carId) async {
    //todo - change status data
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId').toString());
      log(jsonEncode({"status":"LikedCar"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId'),headers: globals.headers, body: jsonEncode({"status":"LikedCar"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        CustomToast.instance.showMsg(MyStrings.success);
      } else {
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
  }

  void getCarData()async {
    //todo change query parameter
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE'),headers: globals.headers);
      // var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&page=$pageKey&limit=$limit'),headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        bidCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        log(response.body);
        // final isLastPage = bidCarsResponse.value.data!.length < limit;
        // if (isLastPage) {
        //   infinitePagingController.appendLastPage(bidCarsResponse.value.data!);
        // } else {
        //   final nextPageKey = pageKey + 1;
        //   infinitePagingController.appendPage(bidCarsResponse.value.data!, nextPageKey);
        // }
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

  void getLikedCarData()async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE'),headers: globals.headers);
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