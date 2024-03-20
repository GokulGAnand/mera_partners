import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class LiveCarsListViewModel extends GetxController{

  var liveCarsResponse = LiveCarsResponse().obs;
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  // the index of the current page
  var activePage = 0.obs;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (activePage.value == 4) {
        activePage.value = 0;
      }
      pageController.value.animateToPage(
        activePage.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      activePage.value++;
    });
  }

  List<int> bid = [
    2000,
    5000,
    10000
  ];
  RxInt bidValue = 172000.obs;

  @override
  void onInit() {
    pageController.value = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    getCarData();
    super.onInit();
  }

  void getCarData()async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED'),headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        liveCarsResponse.value = LiveCarsResponse.fromJson(jsonDecode(response.body));
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