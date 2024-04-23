import 'dart:developer';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/view/home/binding/home_binding.dart';
import 'package:mera_partners/view/home/home_screen_ui.dart';
import 'package:mera_partners/view/login/binding/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getPermission();
  bool isLoginAlready = await loadData();
  runApp(MyApp(isLoginAlready: isLoginAlready));
}

Future<bool> loadData() async{
  globals.token = await SharedPrefManager.instance.getStringAsync(Constants.token);
  if(globals.token != null){
    globals.phoneNum = await SharedPrefManager.instance.getStringAsync(Constants.phoneNum);
    if(globals.phoneNum != null){
      globals.contactNo = int.parse(await SharedPrefManager.instance.getStringAsync(Constants.contactNo) ?? "0");
    }
    globals.userId = await SharedPrefManager.instance.getStringAsync(Constants.userId);
    globals.uniqueUserId = await SharedPrefManager.instance.getStringAsync(Constants.uniqueUserId);
    globals.documentStatus = await SharedPrefManager.instance.getStringAsync(Constants.documentStatus);
    globals.isDeposited = await SharedPrefManager.instance.getBoolAsync(Constants.isDeposited);
    globals.addressProofFront = await SharedPrefManager.instance.getBoolAsync(Constants.addressProofFront);
    print(globals.token);
    print(globals.uniqueUserId);
    return true;
  }
  return false;
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
  const MyApp({
    this.isLoginAlready = false,
    super.key});
  final bool isLoginAlready;
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
      initialRoute: (isLoginAlready)?AppRoutes.homeScreen:AppRoutes.loginScreen,
      initialBinding: (isLoginAlready)?HomeBinding():LoginBinding(),
    );
  }
}
