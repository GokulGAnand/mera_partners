import 'package:evaluator_app/routes/app_pages.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mera Cars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.kPrimaryColor),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.documentScreen,
      // initialBinding: SplashScreenBinding(),
    );
  }
}
