import 'package:evaluator_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_dialog.dart';

class Methods {
  static  void showLogOutConfirmDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CustomDialog(
          title: MyStrings.logoutConfirmMsg,
          okFun: () {
            Get.offAllNamed(AppRoutes.loginScreen);
          },
          cancelFun: () {
            Navigator.of(context).pop();
          },
        ));
  }

  static  void showConfirmDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CustomDialog(
          title: MyStrings.confirmDiscardChanges,
          okFun: () {
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            });
          },
          cancelFun: () {
            Navigator.of(context).pop();
          },
        ));
  }
}