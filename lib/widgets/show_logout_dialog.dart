
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
            SharedPrefManager.instance.removeStringAsync(Constants.userId);
            SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
            SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
            // bool removeVal = await SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
            // if(removeVal){
            Get.offAllNamed(AppRoutes.loginScreen);
            // }
          },
          cancelFun: (){
            Get.back();
          },
        );
      });
}