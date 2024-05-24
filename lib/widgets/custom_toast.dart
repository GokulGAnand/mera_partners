import 'package:flutter/material.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/styles.dart';
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
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      backgroundColor: Colors.transparent, // Make the background transparent to show shadow
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 90),
      duration: const Duration(seconds: 1),
      messageText: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.black.withOpacity(0.10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10), // Adjust color and opacity as needed
              offset: const Offset(0, 3),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Add padding for better visual
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: icon ?? Image.asset(MyImages.bid),
            ),
            Text(
              msg,
              style: MyStyles.black14500,
            ),
          ],
        ),
      ),

    );
  }

}
