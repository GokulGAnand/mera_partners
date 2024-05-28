import 'dart:async';
import 'package:mera_partners/service/firebase_push_notifications.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/view_model/splash/splash_screen_view_model.dart';
import '../../routes/app_routes.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashScreenViewModel splashScreenViewModel = Get.isRegistered<SplashScreenViewModel>() ? Get.find<SplashScreenViewModel>() : Get.put(SplashScreenViewModel());

  @override
  void initState() {
    splashScreenViewModel.loadData().then((value) async{
      splashScreenViewModel.isFirstLaunch = await SharedPrefManager.instance.getBoolAsync(Constants.isFirstLaunch) ?? true;
      splashScreenViewModel.isLoginAlready = value;
      if(splashScreenViewModel.isLoginAlready == true){
        await splashScreenViewModel.getUserData();
        PushNotifications.saveToken(token: (globals.fcmToken ?? ''));
      }
    });
    Timer(const Duration(seconds: 3), () {
      if(splashScreenViewModel.isLoginAlready && !splashScreenViewModel.isFirstLaunch){
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        SharedPrefManager.instance.setBoolAsync(Constants.isFirstLaunch, false);
        Get.offNamed(AppRoutes.loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: MediaQuery.of(context).size.width * 0.25,
          child: Image.asset(MyImages.logo)
        ),
      ),
      floatingActionButton: SizedBox(width:80,height:80,child: Image.asset(MyImages.loader)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
