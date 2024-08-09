import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/service/socket_service.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
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
  RxBool isLoading = true.obs;

  var liveCarsResponse = CarListResponse().obs;
  SocketService? socketService;
  // final PagingController<int, Data> infinitePagingController = PagingController(firstPageKey: 1);
  ScrollController scrollController = ScrollController();
  int limit = 10;
  int pageKey = 1;
  RxBool loadingMore = true.obs;
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
    getCarData(1);
    getLikedCarData();
    // infinitePagingController.addPageRequestListener((pageKey) {
    //   getCarData(pageKey);
    // });
    scrollController.addListener(() {scrollListener(); });
    socketService = await SocketService().connectToSocket();
    super.onInit();
  }

  void scrollListener() async{
    if(scrollController.offset == scrollController.position.maxScrollExtent){
      if(loadingMore.value == true){
        final isLastPage = (liveCarsResponse.value.count!-liveCarsResponse.value.data!.length) < limit;
        if(isLastPage){
          pageKey = pageKey + 1;
          await getCarData(pageKey);
          loadingMore.value = false;
        } else {
          pageKey = pageKey + 1;
          await getCarData(pageKey);
        }
      }
    }
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
      var response = await ApiManager.get(endpoint: EndPoints.users + globals.uniqueUserId!);
      if (response.statusCode == 200) {
        likeResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        if (likeResponse.value.data!.isNotEmpty && (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false)) {
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
    liveCarsResponse.value.data!.value = newData;
    update();
    refresh();
    notifyChildrens();
  }

  void placeBid(amount, carId) async {
    try {
      socketService?.sendSocketRequest("bidInfo", {"amount": int.parse(amount), "carId": carId});
      log(amount + ' bid amount');
      log(carId + ' car id');
      var response = await ApiManager.post(endpoint: EndPoints.auction + EndPoints.bid, body: {"amount": int.parse(amount), "carId": carId});

      String message = json.decode(response.body)['message'];
      if (response.statusCode == 200) {
        CustomToast.instance.showMsgWithIcon(MyStrings.bidPlaced, null);
      } else {
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
      var response = await ApiManager.post(endpoint: EndPoints.auction + EndPoints.bid, body: {"autoBidLimit": int.parse(autoBidLimit), "carId": carId});

      String message = json.decode(response.body)['message'];
      if (response.statusCode == 200) {
        CustomToast.instance.showMsgWithIcon(MyStrings.bidPlaced, null);
      } else {
        CustomToast.instance.showMsg(message);
      }
    } catch (e) {
      CustomToast.instance.showMsg(MyStrings.unableToConnect);
      log(e.toString());
    }
  }

  Future<void> getCarData(int page) async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.carBasic}?status=LIVE&status=SCHEDULED&page=$page&limit=$limit');
      isLoading.value = false;
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        if(pageKey == 1){
          liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
          if(liveCarsResponse.value.count! <= limit){
            loadingMore.value = false;
          }
        } else {
          var data = jsonDecode(response.body);
          for(int i=0; i<data["data"].length; i++){
            liveCarsResponse.value.data!.add(Data.fromJson(data["data"][i]));
          }
        }
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
      isLoading.value = false;
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
