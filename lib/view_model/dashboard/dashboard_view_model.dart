import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:evaluator_app/model/response/dashboard/evaluation_status_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../service/exception_error_util.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_toast.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../widgets/progressbar.dart';
import '../report/report_screen_view_model.dart';

class DashBoardViewModel extends GetxController {
  var evaluationStatusResponse = EvaluationStatusResponse().obs;

  var documentsComplete = false.obs;
  var exteriorComplete = false.obs;
  var engineComplete = false.obs;
  var interiorComplete = false.obs;
  var testComplete = false.obs;
  var featuresComplete = false.obs;
  var airComplete = false.obs;
  var commentsComplete = false.obs;
  var isEvaluated = false.obs;
  List<DashBoardClass> dashboard = [];
  var ratingList = <Item>[].obs;
  var id = Get.arguments;

  @override
  void onInit() {
    globals.carId = id;
    dashboard = [
      DashBoardClass(icon: MyImages.difference, label: MyStrings.documents,isComplete: documentsComplete),
      DashBoardClass(icon: MyImages.exterior, label: MyStrings.exterior,isComplete: exteriorComplete),
      DashBoardClass(icon: MyImages.engine, label: MyStrings.engine,isComplete:engineComplete),
      DashBoardClass(icon: MyImages.electric, label: MyStrings.interior,isComplete:interiorComplete),
      DashBoardClass(icon: MyImages.search, label: MyStrings.test,isComplete:testComplete),
      DashBoardClass(icon: MyImages.settings, label: MyStrings.features,isComplete:featuresComplete),
      DashBoardClass(icon: MyImages.heat, label: MyStrings.air,isComplete:airComplete),
      DashBoardClass(icon: MyImages.maps, label: MyStrings.comments,isComplete:commentsComplete),
    ];
    ratingList.value = [
      Item(title: MyStrings.engine, rating: 0),
      Item(title: MyStrings.exterior, rating: 0),
      // Item(title: MyStrings.electrical, rating: 0),
      Item(title: MyStrings.test, rating: 0),
      Item(title: MyStrings.interiorAndElectrical, rating: 0),

    ];
    getEvaluationStatus();
    super.onInit();
  }

  void getEvaluationStatus() async {
    // ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.evaluation+'/'+EndPoints.status+globals.carId.toString()),headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        evaluationStatusResponse.value = EvaluationStatusResponse.fromJson(jsonDecode(response.body));
        documentsComplete.value = evaluationStatusResponse.value.data?.evaluationStatusForDocument == 'COMPLETED'?true:false;
            exteriorComplete.value=evaluationStatusResponse.value.data?.evaluationStatusForExterior == 'COMPLETED'?true:false;
            engineComplete.value =evaluationStatusResponse.value.data?.evaluationStatusForEngine == 'COMPLETED'?true:false;
            interiorComplete.value =evaluationStatusResponse.value.data?.evaluationStatusForInterior == 'COMPLETED'?true:false;
            testComplete.value =evaluationStatusResponse.value.data?.evaluationStatusForTestDrive == 'COMPLETED'?true:false;
            featuresComplete.value =evaluationStatusResponse.value.data?.evaluationStatusForFeature == 'COMPLETED'?true:false;
            airComplete.value =evaluationStatusResponse.value.data?.evaluationStatusForAc == 'COMPLETED'?true:false;
            commentsComplete.value = true;
            update();
            refresh();
            notifyChildrens();  
        if (documentsComplete.value && exteriorComplete.value && engineComplete.value && interiorComplete.value && testComplete.value && featuresComplete.value && airComplete.value && commentsComplete.value) {
          isEvaluated.value = true;
        }
        log(response.body.toString());
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void addRating() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      print(Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+globals.carId.toString()));
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.interiorInfo+'/'+id),headers: globals.headers,
        body: {
          "engineStar":ratingList[0].rating.toString(),
          "exteriorStar":ratingList[1].rating.toString(),
          "testDriveStar":ratingList[2].rating.toString(),
          "interiorAndElectricalStar":ratingList[3].rating.toString(),
          // "electricalStar":ratingList[4].rating.toString(),
        }
      );
      if( response.statusCode == 200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.body.toString());
        updateEvaluationStatus();
          }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void updateEvaluationStatus() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      print(Uri.parse(EndPoints.baseUrl+EndPoints.carBasic+globals.carId.toString()));
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.carBasic+id),headers: globals.headers,
          body: {
        "status":"EVALUATED"
      });
      if(response.statusCode == 200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.body.toString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.toNamed(AppRoutes.homeScreen);
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
  
}

class DashBoardClass {
  DashBoardClass({this.tileColor, this.icon, this.label, this.onPressed, this.isComplete});

  Color? tileColor;
  String? icon;
  String? label;
  RxBool? isComplete;
  VoidCallback? onPressed;
}
