import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../../model/response/user_data/user_car_details_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../service/socket_service.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/shared_pref_manager.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class BidCarsListViewModel extends GetxController{

  TextEditingController bidCarsearchController = TextEditingController();
  RxList<String> bidCarsearchList = <String>[].obs;

  TextEditingController likedCarsearchController = TextEditingController();
  RxList<LikedCars> likedCarsearchList = <LikedCars>[].obs;

  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;
  var bidCarsResponse = UserResponse().obs;
  SocketService? socketService;
  var likeResponse = UserResponse().obs;

  //declare pagination controller
  // final PagingController<int,Data> infinitePagingController=PagingController(firstPageKy: 1);
  // int limit = 10;

  @override
  void onInit() {
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
    // infinitePagingController.addPageRequestListener((pageKey) {
    getCarData();
    getLikedCarData();
    // });
    super.onInit();
  }


  void placeBid(amount, carId) async {
    try {
      socketService?.sendSocketRequest("bidInfo", {"amount": int.parse(amount), "carId": carId});
      log(amount + ' bid amount');
      log(carId + ' car id');
      var response = await http.post(Uri.parse(EndPoints.socketUrl + EndPoints.auction + EndPoints.bid), headers: globals.jsonHeaders, body: jsonEncode({"amount": int.parse(amount), "carId": carId}));
      log(response.body);
      String message = json.decode(response.body)['message'];
      if (response.statusCode == 200) {
        getCarData();
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
      log(Uri.parse(EndPoints.socketUrl + EndPoints.auction + EndPoints.bid).toString());
      var response = await http.post(Uri.parse(EndPoints.socketUrl + EndPoints.auction + EndPoints.bid), headers: globals.jsonHeaders, body: jsonEncode({"autoBidLimit": int.parse(autoBidLimit), "carId": carId}));
      log(response.body);
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

  void getCarData() async {
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.jsonHeaders);
      log(response.body);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        bidCarsResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        bidCarsResponse.value.data![0].biddedCars!.clear();
        Rx<UserResponse> tempBidCarResponse = UserResponse.fromJson(jsonDecode(response.body)).obs;
        for(int i=0; i<tempBidCarResponse.value.data![0].biddedCars!.length; i++){
          if(tempBidCarResponse.value.data?[0].biddedCars?[i].status?.toLowerCase() == CarStatus.live.name){
            bidCarsResponse.value.data?[0].biddedCars?.add(tempBidCarResponse.value.data![0].biddedCars![i]);
          }
        }
        if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
          globals.documentStatus = bidCarsResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = bidCarsResponse.value.data?.first.isDeposited;
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, bidCarsResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, bidCarsResponse.value.data!.first.isDeposited ?? false);
        }
        // final isLastPage = bidCarsResponse.value.data!.length < limit;
        // if (isLastPage) {
        //   infinitePagingController.appendLastPage(bidCarsResponse.value.data!);
        // } else {
        //   final nextPageKey = pageKey + 1;
        //   infinitePagingController.appendPage(bidCarsResponse.value.data!, nextPageKey);
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

  void getLikedCarData() async {
    try {
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        likeResponse.value = UserResponse();
        likeResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        likedCarsearchList.value = UserResponse.fromJson(jsonDecode(response.body)).data![0].likedCars!;
        if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
          globals.documentStatus = likeResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = likeResponse.value.data?.first.isDeposited;
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, likeResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, likeResponse.value.data!.first.isDeposited ?? false);
        }
        update();
        refresh();
        notifyChildrens();
        // getLikedCarData();
        likeResponse.refresh();
        log('API Response otb: ${response.body}');
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
