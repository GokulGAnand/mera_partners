import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:mera_partners/model/response/user_data/bidded_car_response.dart';
import 'package:mera_partners/service/api_manager.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../service/socket_service.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class BidCarsListViewModel extends GetxController{
  final isShowFullList = true.obs;
  TextEditingController bidCarsearchController = TextEditingController();
  RxList<String> bidCarsearchList = <String>[].obs;

  TextEditingController likedCarsearchController = TextEditingController();
  RxList<Data> likedCarsearchList = <Data>[].obs;

  Rx<TextEditingController> autoBidController = TextEditingController().obs;
  Rx<TextEditingController> bidController = TextEditingController().obs;
  var bidCarsResponse = BiddedCarResponse().obs;
  ScrollController biddedCarScrollController = ScrollController();
  int biddedCarLimit = 10;
  int biddedCarPageKey = 1;
  RxBool biddedCarLoadingMore = true.obs;

  SocketService? socketService;

  var likeResponse = CarListResponse().obs;
  ScrollController likedCarScrollController = ScrollController();
  int likedCarLimit = 10;
  int likedCarPageKey = 1;
  RxBool likedCarLoadingMore = true.obs;

  //declare pagination controller
  // final PagingController<int,Data> infinitePagingController=PagingController(firstPageKy: 1);
  // int limit = 10;

  @override
  void onInit() {
    // infinitePagingController.addPageRequestListener((pageKey) {
    getCarData(1);
    getLikedCarData(1);

    biddedCarScrollController.addListener(() {biddedCarScrollListener(); });
    likedCarScrollController.addListener(() {likedCarScrollListener(); });
    // });
    super.onInit();
  }

  void biddedCarScrollListener() async{
    if(biddedCarScrollController.offset == biddedCarScrollController.position.maxScrollExtent){
      if(biddedCarLoadingMore.value == true){
        final isLastPage = (bidCarsResponse.value.count!-bidCarsResponse.value.data!.length) < biddedCarLimit;
        if(isLastPage){
          biddedCarPageKey = biddedCarPageKey + 1;
          await getCarData(biddedCarPageKey);
          biddedCarLoadingMore.value = false;
        } else {
          biddedCarPageKey = biddedCarPageKey + 1;
          await getCarData(biddedCarPageKey);
        }
      }
    }
  }

  void likedCarScrollListener() async{
    if(likedCarScrollController.offset == likedCarScrollController.position.maxScrollExtent){
      if(likedCarLoadingMore.value == true){
        final isLastPage = (likeResponse.value.count!-likeResponse.value.data!.length) < likedCarLimit;
        if(isLastPage){
          likedCarPageKey = likedCarPageKey + 1;
          await getCarData(likedCarPageKey);
          likedCarLoadingMore.value = false;
        } else {
          likedCarPageKey = likedCarPageKey + 1;
          await getCarData(likedCarPageKey);
        }
      }
    }
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
      var response = await ApiManager.get(endpoint: EndPoints.biddedCars+"?page=$page&limit=$biddedCarLimit&status=LIVE");
      // var response = await ApiManager.get(endpoint: EndPoints.users+globals.uniqueUserId!);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        if(biddedCarPageKey == 1){
          bidCarsResponse.value = BiddedCarResponse.fromJson(jsonDecode(response.body));
          if(bidCarsResponse.value.count! <= biddedCarLimit){
            biddedCarLoadingMore.value = false;
          }
        } else {
          var data = jsonDecode(response.body);
          for(int i=0; i<data["data"].length; i++){
            bidCarsResponse.value.data!.add(BidCarsList.fromJson(data["data"][i]));
          }
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

  void getLikedCarData(int page) async {
    try {
      var response = await ApiManager.get(endpoint: EndPoints.likedCars+"?page=$page&limit=$likedCarLimit");
      // var response = await ApiManager.get(endpoint: EndPoints.users+globals.uniqueUserId!);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        // likeResponse.value = UserResponse();
        // likeResponse.value = LikedCarResponse.fromJson(jsonDecode(response.body));
        // likedCarsearchList.value = LikedCarResponse.fromJson(jsonDecode(response.body)).data!;

       if(page == 1){
          likeResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
          likedCarsearchList.value = CarListResponse.fromJson(jsonDecode(response.body)).data!;
          if(likeResponse.value.count! <= likedCarLimit){
            likedCarLoadingMore.value = false;
          }
        } else {
          var data = jsonDecode(response.body);
          for(int i=0; i<data["data"].length; i++){
            likeResponse.value.data!.add(Data.fromJson(data["data"][i]));
            likedCarsearchList.add(Data.fromJson(data["data"][i]));
          }
        }
        update();
        refresh();
        notifyChildrens();
        likeResponse.refresh();
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
