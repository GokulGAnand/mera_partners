import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../model/response/live/live_cars_list_response.dart';
import '../../../../service/endpoints.dart';
import '../../../../service/exception_error_util.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/progressbar.dart';

class BidCarsListViewModel extends GetxController{

  var bidCarsResponse = LiveCarsResponse().obs;

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
    infinitePagingController.addPageRequestListener((pageKey) {
      getCarData(pageKey);
    });
    super.onInit();
  }

  void getCarData(int pageKey)async {
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}?status=LIVE&page=$pageKey&limit=$limit'),headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        bidCarsResponse.value = LiveCarsResponse.fromJson(jsonDecode(response.body));
        log(response.body);
        final isLastPage = bidCarsResponse.value.data!.length < limit;
        if (isLastPage) {
          infinitePagingController.appendLastPage(bidCarsResponse.value.data!);
        } else {
          final nextPageKey = pageKey + 1;
          infinitePagingController.appendPage(bidCarsResponse.value.data!, nextPageKey);
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