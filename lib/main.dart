import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/view/login/binding/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.white, // status bar color
      statusBarIconBrightness: Brightness.dark));
getPermission();
  runApp(const MyApp());
}

Future<void> getPermission() async {
  var cameraStatus = await Permission.camera.status;
  if (!cameraStatus.isGranted) {
    final result = await Permission.camera.request();
    print("camera access: " + result.isGranted.toString());
  }
  var galleryStatus = await Permission.storage.status;
  if (!galleryStatus.isGranted) {
    final result = await Permission.storage.request();
    print("gallery access: " + result.isGranted.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evaluator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.kPrimaryColor),
        useMaterial3: true,
      ),

      getPages: AppRoutes().pages,
      initialRoute: AppRoutes.loginScreen,
      initialBinding: LoginBinding(),
    );
  }
}
