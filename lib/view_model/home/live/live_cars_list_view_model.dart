import 'dart:async';
import 'dart:convert';
import 'dart:developer';
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
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LiveCarsListViewModel extends GetxController{

  var liveCarsResponse = LiveCarsResponse().obs;
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  // the index of the current page
  var activePage = 0.obs;
  late IO.Socket socket;

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

  //declare pagination controller
  final PagingController<int,Data> infinitePagingController=PagingController(firstPageKey: 1);
  int limit = 10;

  @override
  void onInit() {
    pageController.value = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    infinitePagingController.addPageRequestListener((pageKey) {
      getCarData(pageKey);
    });
    initSocket();
    super.onInit();
  }
  
  void initSocket() async {
    // var response = await http.get(Uri.parse("http://192.168.1.12:8000/api/v1/auction/65da50e0b3e80a24a02fe594"),
    //   headers: globals.headers,
    // );
    // print(response.toString());
    socket = IO.io("http://192.168.1.12:8000", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on('getBidInfo', (data) => (data) {
      print(data.toString());
    });
  }
  
  void placeBid()async {
    // var response = await http.post(Uri.parse( "http://192.168.1.12:8000/api/v1/auction/bid"),headers: globals.headers,
    //   body: jsonEncode({
    //     "amount":100000000,
    //     "carId":"65e80b6c5e64f7a09a29310a"
    //   })
    // );
    socket.emit("bidInfo",{
      "amount":100000000,
      "carId":"65e80b6c5e64f7a09a29310a"
    });
  }

  void getCarData(int pageKey)async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit'),headers: globals.headers);
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