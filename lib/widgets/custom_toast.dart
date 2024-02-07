import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomToast {
  static final CustomToast _singleton = CustomToast._internal();

  CustomToast._internal();

  static CustomToast get instance => _singleton;

  showMsg(String msg) {
    Get.showSnackbar(
      GetSnackBar(
        title: null,
        message: msg,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        borderRadius: 8,
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      ),
    );
  }
}
