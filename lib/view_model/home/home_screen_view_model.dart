import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/view_model/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenViewModel extends GetxController{

  ValidateUserResponse? validateUserResponse;

  List<MasterClass> homeList = [
    MasterClass(tileColor: MyColors.kPrimaryColor,icon: MyImages.plus,label: MyStrings.newEvaluation),
    MasterClass(tileColor: MyColors.kPrimaryColor,icon: MyImages.sandGlass,label: MyStrings.pendingEvaluation),
    MasterClass(tileColor: MyColors.kPrimaryColor,icon: MyImages.completed,label: MyStrings.completedEvaluation),
  ];

  @override
  void onInit() {
    Get.put(LoginScreenViewModel());
    validateUserResponse = Get.find<LoginScreenViewModel>().validateUserResponse;
    super.onInit();
  }

}

class MasterClass{
  MasterClass({this.tileColor,this.icon,this.label,this.onPressed});

  Color? tileColor;
  String? icon;
  String? label;
  VoidCallback? onPressed;
}


