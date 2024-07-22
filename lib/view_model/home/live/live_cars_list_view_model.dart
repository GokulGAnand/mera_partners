import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/service/socket_service.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../model/response/user_data/user_car_details_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/constants.dart';
import '../../../utils/enum.dart';
import '../../../utils/shared_pref_manager.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class LiveCarsListViewModel extends GetxController {
  final isShowFullList = true.obs;
  TextEditingController searchController = TextEditingController();
  RxList<String> searchList = <String>[].obs;

  var liveCarsResponse = CarListResponse().obs;
  SocketService? socketService;
  final PagingController<int, Data> infinitePagingController = PagingController(firstPageKey: 1);
  int limit = 10;
  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;
  var likeResponse = UserResponse().obs;
  Rx<CountdownTimerController>? timerController;
  Rx<int>? endTime;

  void onEnd() {
    if (timerController!.value.isRunning) {
      timerController?.value.disposeTimer();
    }
  }

  @override
  void dispose() {
    timerController?.value.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    // var duration = DateTime.now().difference(DateTime.parse(negotiationData.value?[0].negotiationEndTime ?? "2024-05-08T02:35:38.00Z"));
    // endTime = DateTime.now().millisecondsSinceEpoch + Duration(seconds: duration.inSeconds).inMilliseconds;
    // timerController = CountdownTimerController(endTime: endTime??0, onEnd: onEnd);
    getCarData();
    getLikedCarData();
    // infinitePagingController.addPageRequestListener((pageKey) {
    //   getCarData(pageKey);
    // });
    socketService = await SocketService().connectToSocket();
    // bidController.value.addListener(() {
    //   if (bidController.value.text.length > 3) {
    //     bidController.value.selection = TextSelection.fromPosition(
    //       TextPosition(offset: bidController.value.text.length - 3),
    //     );
    //   }
    // });
    // autoBidController.value.addListener(() {
    //   if (autoBidController.value.text.length > 3) {
    //     autoBidController.value.selection = TextSelection.fromPosition(
    //       TextPosition(offset: autoBidController.value.text.length - 3),
    //     );
    //   }
    // });

    super.onInit();
  }

  void showAlertDialog() {
    if (Get.isDialogOpen == false) {
      Get.dialog(
        AlertDialog(
          title: const Text("Auto Bid Limit Reached"),
          content: const Text("The auto bid limit has been reached or exceeded"),
          actions: [
            TextButton(
              child: Text(MyStrings.ok.toUpperCase()),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  void getLikedCarData() async {
    try {
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        likeResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
          globals.documentStatus = likeResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = likeResponse.value.data?.first.isDeposited;
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, likeResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, likeResponse.value.data!.first.isDeposited ?? false);
        }
      } else {
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void updateBid(dynamic newData) {
    liveCarsResponse.value.data = newData;
    update();
    refresh();
    notifyChildrens();
  }

  void placeBid(amount, carId) async {
    try {
      socketService?.sendSocketRequest("bidInfo", {"amount": int.parse(amount), "carId": carId});
      log(amount+' bid amount');
      log(carId+' car id');
      var response = await http.post(Uri.parse(EndPoints.socketUrl+EndPoints.auction+EndPoints.bid), headers: globals.jsonHeaders, body: jsonEncode({"amount": int.parse(amount), "carId": carId}));
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
      socketService?.sendSocketRequest("bidInfo", {"autoBidLimit": int.parse(autoBidLimit), "carId": carId});
      log(jsonEncode({"autoBidLimit": autoBidLimit, "carId": carId}));
      log(Uri.parse(EndPoints.socketUrl+EndPoints.auction+EndPoints.bid).toString());
      var response = await http.post(Uri.parse(EndPoints.socketUrl+EndPoints.auction+EndPoints.bid),
          headers: globals.jsonHeaders,
          body: jsonEncode({"autoBidLimit": int.parse(autoBidLimit), "carId": carId}));
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

  void getCarData() async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&status=SCHEDULED'), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        // final isLastPage = liveCarsResponse.value.data!.length < limit;
        // if (isLastPage) {
        //   infinitePagingController.appendLastPage(liveCarsResponse.value.data!);
        // } else {
        //   final nextPageKey = pageKey + 1;
        //   infinitePagingController.appendPage(liveCarsResponse.value.data!, nextPageKey);
        // }
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