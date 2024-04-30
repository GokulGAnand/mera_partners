import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/service/socket_service.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../model/response/user_data/user_car_details_response.dart';
import '../../../service/endpoints.dart';
import '../../../service/exception_error_util.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class LiveCarsListViewModel extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxList<String> searchList = <String>[].obs;

  var liveCarsResponse = CarListResponse().obs;
  SocketService? socketService;
  List<int> bid = [5000, 10000, 15000];
  RxInt bidValue = 172000.obs;
  final PagingController<int, Data> infinitePagingController = PagingController(firstPageKey: 1);
  int limit = 10;
  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;
  var likeResponse = UserResponse().obs;


  @override
  void onInit() async {
    getCarData();
    getLikedCarData();
    // infinitePagingController.addPageRequestListener((pageKey) {
    //   getCarData(pageKey);
    // });
    socketService = await SocketService().connectToSocket();
    bidController.value.addListener(() {
      if (bidController.value.text.length > 3) {
        bidController.value.selection = TextSelection.fromPosition(
          TextPosition(offset: bidController.value.text.length - 3),
        );
      }
    });
    autoBidController.value.addListener(() {
      if (autoBidController.value.text.length > 3) {
        autoBidController.value.selection = TextSelection.fromPosition(
          TextPosition(offset: autoBidController.value.text.length - 3),
        );
      }
    });

    super.onInit();
  }

  void getLikedCarData() async {
    try {
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        likeResponse.value = UserResponse.fromJson(jsonDecode(response.body));
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