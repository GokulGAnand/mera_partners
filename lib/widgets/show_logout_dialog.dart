import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';
import '../utils/shared_pref_manager.dart';
import '../utils/strings.dart';
import 'custom_dialog.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context){
        return CustomDialog(
          title: MyStrings.logOutDesc,
          okFun: () async{
            SharedPrefManager.instance.removeStringAsync(Constants.userName);
            SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
            SharedPrefManager.instance.removeStringAsync(Constants.contactNo);
            SharedPrefManager.instance.removeStringAsync(Constants.token);
            SharedPrefManager.instance.removeStringAsync(Constants.fcmToken);
            SharedPrefManager.instance.removeStringAsync(Constants.userId);
            SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
            SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
            globals.clearData();
            Get.offAllNamed(AppRoutes.loginScreen);
          },
          cancelFun: (){
            Get.back();
          },
        );
      });
}