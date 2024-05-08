import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

class SplashScreenViewModel extends GetxController{ 
  bool isLoginAlready = false;
  
  Future<bool> loadData() async{
  globals.token = await SharedPrefManager.instance.getStringAsync(Constants.token);
  if(globals.token != null && globals.token.toString().isNotEmpty){
    globals.phoneNum = await SharedPrefManager.instance.getStringAsync(Constants.phoneNum);
    if(globals.phoneNum != null){
      globals.contactNo = int.parse(await SharedPrefManager.instance.getStringAsync(Constants.contactNo) ?? "0");
    }
    globals.userId = await SharedPrefManager.instance.getStringAsync(Constants.userId);
    globals.uniqueUserId = await SharedPrefManager.instance.getStringAsync(Constants.uniqueUserId);
    globals.documentStatus = await SharedPrefManager.instance.getStringAsync(Constants.documentStatus);
    globals.isDeposited = await SharedPrefManager.instance.getBoolAsync(Constants.isDeposited);
    globals.addressProofFront = await SharedPrefManager.instance.getBoolAsync(Constants.addressProofFront);
    globals.userName = await SharedPrefManager.instance.getStringAsync(Constants.userName);
    globals.isOnboarding = await SharedPrefManager.instance.getBoolAsync(Constants.isOnboarding);
    log(globals.token.toString());
    log(globals.uniqueUserId.toString());
    log(globals.userName.toString());
    return true;
  }
  return false;
}
}