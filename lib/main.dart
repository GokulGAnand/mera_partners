import 'dart:developer';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/notification_service.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mera_partners/view/splash/binding/splash_screen_binding.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await NotificationService().initNotification();
  getPermission();
  runApp(const MyApp());
}

Future getPermission() async {
  PermissionStatus cameraStatus = await Permission.camera.status;
  if (!cameraStatus.isGranted) {
    cameraStatus = await Permission.camera.request();
  }
  log("camera access: ${cameraStatus.isGranted}");
  final deviceInfo = await DeviceInfoPlugin().androidInfo;
  PermissionStatus? storageStatus;
  if (deviceInfo.version.sdkInt > 32) {
    storageStatus = await Permission.photos.request();
  } else {
    storageStatus = await Permission.storage.request();
  }
  log("storage access: ${storageStatus.isGranted}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mera Partners',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.kPrimaryColor),
        useMaterial3: true,
      ),
      getPages: AppRoutes().pages,
      initialRoute:AppRoutes.splashScreen,
      initialBinding: SplashScreenBinding(),
    );
  }
}
