import 'dart:ui';

import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';

class DashBoardViewModel extends GetxController{

  ValidateUserResponse? validateUserResponse;
  List<DashBoardClass> dashboard =[
    DashBoardClass(icon: MyImages.difference,label: MyStrings.documents),
    DashBoardClass(icon: MyImages.exterior,label: MyStrings.exterior),
    DashBoardClass(icon: MyImages.engine,label: MyStrings.engine),
    DashBoardClass(icon: MyImages.electric,label: MyStrings.interior),
    DashBoardClass(icon: MyImages.search,label: MyStrings.test),
    DashBoardClass(icon: MyImages.settings,label: MyStrings.features),
    DashBoardClass(icon: MyImages.heat,label: MyStrings.air),
    DashBoardClass(icon: MyImages.maps,label: MyStrings.comments)

  ];


  @override
  void onInit(){
    //validateUserResponse = Get.find<DashBoardViewModel>().validateUserResponse;
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
