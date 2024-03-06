import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/utils/shared_pref_manager.dart';
import 'package:evaluator_app/view/login/binding/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: MyColors.white, // status bar color
  //     statusBarIconBrightness: Brightness.dark));
  await loadData();

  runApp(const MyApp());
}
String? phoneNum;
String? password;
Future<void> loadData()async{
  globals.phoneNum = await SharedPrefManager.instance.getStringAsync(Constants.phoneNum);
  globals.password = await SharedPrefManager.instance.getStringAsync(Constants.password);
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
