import 'dart:async';
import 'package:mera_partners/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.documentScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(MyImages.logo),
      ),
      floatingActionButton: SizedBox(width:100,height:100,child: Image.asset(MyImages.loader)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
