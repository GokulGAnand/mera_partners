import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:evaluator_app/model/response/dashboard/evaluation_status_response.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:get/get.dart';
import '../../service/exception_error_util.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_toast.dart';

class DashBoardViewModel extends GetxController {
  var evaluationStatusResponse = EvaluationStatusResponse().obs;
  List<DashBoardClass> dashboard = [DashBoardClass(icon: MyImages.difference, label: MyStrings.documents), DashBoardClass(icon: MyImages.exterior, label: MyStrings.exterior), DashBoardClass(icon: MyImages.engine, label: MyStrings.engine), DashBoardClass(icon: MyImages.electric, label: MyStrings.interiorAndElectrical), DashBoardClass(icon: MyImages.search, label: MyStrings.test), DashBoardClass(icon: MyImages.settings, label: MyStrings.features), DashBoardClass(icon: MyImages.heat, label: MyStrings.air), DashBoardClass(icon: MyImages.maps, label: MyStrings.comments)];

  @override
  void onInit() {
    getEvaluationStatus();
    super.onInit();
  }

  void getEvaluationStatus() async {
    //todo
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}${EndPoints.status}/65caf921297e36d09d5a473e'));
      if (response.statusCode == 200) {
        evaluationStatusResponse.value = EvaluationStatusResponse.fromJson(jsonDecode(response.body));
      } else {
        CustomToast.instance.showMsg(MyStrings.checkNetwork);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}

class DashBoardClass {
  DashBoardClass({this.tileColor, this.icon, this.label, this.onPressed});

  Color? tileColor;
  String? icon;
  String? label;
  VoidCallback? onPressed;
}
