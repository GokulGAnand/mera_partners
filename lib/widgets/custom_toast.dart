import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/styles.dart';
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

  showMsgWithIcon(String msg, Widget? icon) {
    Get.showSnackbar(
      GetSnackBar(
        title: null,
        // message: msg,
        messageText: Text(
          msg,
          style: MyStyles.black14500,
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        borderRadius: 8,
        icon: icon ?? Image.asset(MyImages.bid),
        backgroundColor: MyColors.white,
        borderColor: MyColors.black.withOpacity(0.04),
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 90),
      ),
    );
  }
}
