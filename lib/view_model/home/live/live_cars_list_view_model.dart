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
  var liveCarsResponse = CarListResponse().obs;
  SocketService? socketService;
  List<int> bid = [5000, 10000, 15000];
  RxInt bidValue = 172000.obs;
  final PagingController<int, Data> infinitePagingController = PagingController(firstPageKey: 1);
  int limit = 10;
  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;


  @override
  void onInit() async {
    getCarData(1);
    infinitePagingController.addPageRequestListener((pageKey) {
      getCarData(pageKey);
    });
    socketService = await SocketService().connectToSocket();
    bidController.value.addListener(() {
      if (bidController.value.text.length > 3) {
        bidController.value.selection = TextSelection.fromPosition(
          TextPosition(offset: bidController.value.text.length - 3),
        );
      }
    });

    super.onInit();
  }

  void updateBid(dynamic newData) {
    liveCarsResponse.value.data = newData;
    update();
    refresh();
    notifyChildrens();
  }

  void placeBid(amount, carId) async {
    try {
      //todo change url and data
      socketService?.sendSocketRequest("bidInfo", {"amount": amount, "carId": carId});
      log(amount+' bid amount');
      log(carId+' car id');
      var response = await http.post(Uri.parse(EndPoints.socketUrl+EndPoints.auction+EndPoints.bid), headers: globals.jsonHeaders, body: jsonEncode({"amount": amount, "carId": carId}));
      log(response.body);
      String message = json.decode(response.body)['message'];
      if(response.statusCode == 200){
        CustomToast.instance.showMsgWithIcon(MyStrings.bidPlaced, null);
      }else{
        CustomToast.instance.showMsg(message);
      }
    } catch (e) {
      CustomToast.instance.showMsg(MyStrings.unableToConnect);
      log(e.toString());
    }
  }
  void placeAutoBid(autoBidLimit, carId) async {
    try {
      socketService?.sendSocketRequest("bidInfo", {"amount": autoBidLimit, "carId": carId});
      log(autoBidLimit+' bid limit');
      log(carId+' car id');
      var response = await http.post(Uri.parse(EndPoints.socketUrl+EndPoints.auction+EndPoints.bid), headers: globals.jsonHeaders, body: jsonEncode({"amount": autoBidLimit, "carId": carId}));
      log(response.body);
      String message = json.decode(response.body)['message'];
      if(response.statusCode == 200){
        CustomToast.instance.showMsgWithIcon(MyStrings.bidPlaced, null);
      }else{
        CustomToast.instance.showMsg(message);
      }
    } catch (e) {
      CustomToast.instance.showMsg(MyStrings.unableToConnect);
      log(e.toString());
    }
  }

  void getCarData(int pageKey) async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$pageKey&limit=$limit'), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
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