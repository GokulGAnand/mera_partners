import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/service/socket_service.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class LiveCarsListViewModel extends GetxController {
  var liveCarsResponse = LiveCarsResponse().obs;
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;
  SocketService? socketService;
  Timer? carouselTimer;
  List<int> bid = [2000, 5000, 10000];
  RxInt bidValue = 172000.obs;
  final PagingController<int, Data> infinitePagingController = PagingController(firstPageKey: 1);
  int limit = 10;
  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;

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

  @override
  void onInit() async {
    pageController.value = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    infinitePagingController.addPageRequestListener((pageKey) {
      getCarData(pageKey);
    });
    socketService = await SocketService().connectToSocket();
    super.onInit();
  }

  void placeBid(amount, carId) async {
    try {
      //todo change url and data
      socketService?.sendSocketRequest("bidInfo", {"amount": 100000, "carId": "65dd5e7fb28cddf13dc9a68c"});
      var response = await http.post(Uri.parse("http://192.168.1.10:8000/api/v1/auction/bid"), headers: globals.jsonHeaders, body: jsonEncode({"amount": 100000, "carId": "65dd5e7fb28cddf13dc9a68c"}));
      log(response.body);
      if(response.statusCode == 200){
        CustomToast.instance.showMsgWithIcon(MyStrings.bidPlaced, null);
      }else{
        CustomToast.instance.showMsg(MyStrings.somethingWentWrong);
      }
    } catch (e) {
      CustomToast.instance.showMsg(MyStrings.unableToConnect);
      log(e.toString());
    }
  }

  void listenSocket(){
    socketService?.getSocketResponse('getBidInfo',);
  }

  void getCarData(int pageKey) async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit'), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        liveCarsResponse.value = LiveCarsResponse.fromJson(jsonDecode(response.body));
        final isLastPage = liveCarsResponse.value.data!.length < limit;
        if (isLastPage) {
          infinitePagingController.appendLastPage(liveCarsResponse.value.data!);
        } else {
          final nextPageKey = pageKey + 1;
          infinitePagingController.appendPage(liveCarsResponse.value.data!, nextPageKey);
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
}