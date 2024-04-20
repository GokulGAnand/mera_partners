import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../../model/response/like/like_response.dart';
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../model/response/user_data/user_info_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../service/socket_service.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class BidCarsListViewModel extends GetxController{

  TextEditingController searchController = TextEditingController();
  RxList<String> searchList = <String>[].obs;

  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;
  var bidCarsResponse = CarListResponse().obs;
  var carListResponse = CarListResponse().obs;
  SocketService? socketService;
  var likeResponse = LikedCarResponse().obs;


  //declare pagination controller
  // final PagingController<int,Data> infinitePagingController=PagingController(firstPageKy: 1);
  // int limit = 10;

  @override
  void onInit() {
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
    // infinitePagingController.addPageRequestListener((pageKey) {
      getCarData();
      getLikedCarData();
    // });
    super.onInit();
  }


  /// Like Feature API integration
  void updateLikedCar(String carId,bool like) async {
    //todo - change status data
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId').toString());
      log(jsonEncode({"status": like==true ?"LikedCar": "Unlike"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId'),headers: globals.headers, body: jsonEncode({"status": like==true ?"LikedCar": "Unlike"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        Get.find<BidCarsListViewModel>().getLikedCarData();
        Get.find<BidCarsListViewModel>().likeResponse.refresh();
        CustomToast.instance.showMsg(MyStrings.success);
      } else {
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
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
  
  void getLikedCarData() async {
    try {
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        likeResponse.value = LikedCarResponse.fromJson(jsonDecode(response.body));
        print('API Response svvs: ${response.body}');
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        print('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      print('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }


}