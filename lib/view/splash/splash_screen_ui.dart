import 'dart:async';
import 'package:mera_partners/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/view_model/splash/splash_screen_view_model.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashScreenViewModel splashScreenViewModel = Get.isRegistered<SplashScreenViewModel>() ? Get.find<SplashScreenViewModel>() : Get.put(SplashScreenViewModel());

  @override
  void initState() {
    splashScreenViewModel.loadData().then((value){
      splashScreenViewModel.isLoginAlready = value;
    });
    Timer(const Duration(seconds: 3), () {
      if(splashScreenViewModel.isLoginAlready){
        Get.toNamed(AppRoutes.homeScreen);
      } else {
        Get.toNamed(AppRoutes.loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Image.asset(MyImages.logo)),
      ),
      floatingActionButton: SizedBox(width:80,height:80,child: Image.asset(MyImages.loader)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
