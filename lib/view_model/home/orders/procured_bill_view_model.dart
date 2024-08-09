import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class ProcuredScreenViewModel extends GetxController {
  void clearSearch() {
    searchController.clear();
    isShowFullListProcured.value = true;
    update();
  }

  RxBool isShowFullListProcured = true.obs;
  TextEditingController searchController = TextEditingController();
  RxList<Data> searchList = <Data>[].obs;

  var liveCarsResponse = CarListResponse().obs;

  ScrollController scrollController = ScrollController();
  int limit = 10;
  int pageKey = 1;
  RxBool loadingMore = true.obs;

  @override
  void onInit() {
    getProcuredBill(1);
    scrollController.addListener(() {scrollListener(); });
    super.onInit();
  }

  void scrollListener() async{
    if(scrollController.offset == scrollController.position.maxScrollExtent){
      if(loadingMore.value == true){
        final isLastPage = (liveCarsResponse.value.count!-liveCarsResponse.value.data!.length) < limit;
        if(isLastPage){
          pageKey = pageKey + 1;
          await getProcuredBill(pageKey);
          loadingMore.value = false;
        } else {
          pageKey = pageKey + 1;
          await getProcuredBill(pageKey);
        }
      }
    }
  }

  launchCaller() async {
    Uri url = Uri(scheme: "tel", path: "+91 81130 27722");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getProcuredBill(int page) async {
    try {
      var response = await ApiManager.get(endpoint: '${EndPoints.status}?status=PROCUREMENT&page=$page&limit=$limit');
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        if(page == 1){
          liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
          searchList.value = CarListResponse.fromJson(jsonDecode(response.body)).data!;
          if(liveCarsResponse.value.count! <= limit){
            loadingMore.value = false;
          }
        } else {
          var data = jsonDecode(response.body);
          for(int i=0; i<data["data"].length; i++){
            liveCarsResponse.value.data!.add(Data.fromJson(data["data"][i]));
            searchList.add(Data.fromJson(data["data"][i]));
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
}
