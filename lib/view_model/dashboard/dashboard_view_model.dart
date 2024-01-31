import 'dart:ffi';
import 'dart:ui';

import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';

class DashBoardViewModel extends GetxController{

  ValidateUserResponse? validateUserResponse;
  List<DashBoardClass> dashboard =[
    DashBoardClass(tileColor: MyColors.kPrimaryColor,icon: MyImages.menu,label: MyStrings.dashboard),
  ];


  @override
  void onInit(){
    // validateUserResponse = Get.find<DashBoardViewModel>().validateUserResponse;
    super.onInit();
  }
}


class DashBoardClass {
  DashBoardClass({this.tileColor,this.icon,this.label,this.onPressed});

Color? tileColor;
String? icon;
String? label;
VoidCallback? onPressed;
}
