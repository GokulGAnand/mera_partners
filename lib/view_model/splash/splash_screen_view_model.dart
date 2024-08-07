import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mera_partners/firebase_options.dart';
import 'package:mera_partners/model/response/user_data/user_car_details_response.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../service/notification_service.dart';

class SplashScreenViewModel extends GetxController {

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    await NotificationService().initialize();
    FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    getPermission();
    super.onInit();
  }

  Future getPermission() async{
  try{
    Permission storagePermission = Permission.storage;
    if(Platform.isAndroid){
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        storagePermission = Permission.photos;
      }
    }
    List<Permission> statuses = [
      Permission.camera,
      Permission.notification,
      storagePermission
    ];
    for (var element in statuses) {
        if ((await element.status.isDenied ||
            await element.status.isPermanentlyDenied)) {
          await statuses.request();
        }
      }
  } catch(e){
    log(e.toString());
  }
}

  bool isLoginAlready = false;
  bool isFirstLaunch = true;

  Future<bool> loadData() async {
    globals.token = await SharedPrefManager.instance.getStringAsync(Constants.token);
    globals.refreshToken = await SharedPrefManager.instance.getStringAsync(Constants.refreshToken);
    globals.isOnboarding = await SharedPrefManager.instance.getBoolAsync(Constants.isOnboarding);
    if (globals.token != null && globals.token.toString().isNotEmpty) {
      globals.phoneNum = await SharedPrefManager.instance.getStringAsync(Constants.phoneNum);
      globals.email = await SharedPrefManager.instance.getStringAsync(Constants.email);
      if (globals.phoneNum != null) {
        globals.contactNo = int.parse(await SharedPrefManager.instance.getStringAsync(Constants.contactNo) ?? "0");
      }
      globals.userId = await SharedPrefManager.instance.getStringAsync(Constants.userId);
      globals.uniqueUserId = await SharedPrefManager.instance.getStringAsync(Constants.uniqueUserId);
      globals.documentStatus = await SharedPrefManager.instance.getStringAsync(Constants.documentStatus);
      globals.isDeposited = await SharedPrefManager.instance.getBoolAsync(Constants.isDeposited);
      globals.addressProofFront = await SharedPrefManager.instance.getBoolAsync(Constants.addressProofFront);
      globals.userName = await SharedPrefManager.instance.getStringAsync(Constants.userName);
      globals.fcmToken = await SharedPrefManager.instance.getStringAsync(Constants.fcmToken);
      log(globals.token.toString());
      log(globals.uniqueUserId.toString());
      log(globals.userName.toString());
      return true;
    }
    return false;
  }

  var userResponse = UserResponse().obs;

  Future<void> getUserData() async {
    try {
      var response = await ApiManager.get(endpoint: EndPoints.users + globals.uniqueUserId!);
      if (response.statusCode == 200) {
        userResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        log("isDeactivate: ${userResponse.value.data![0].isDeactivate}");
        if (userResponse.value.data![0].isDeactivate == true) {
          globals.clearData();
          globals.uniqueUserId = null;
          globals.jsonHeaders = {};
          SharedPrefManager.instance.removeStringAsync(Constants.userName);
          SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
          SharedPrefManager.instance.removeStringAsync(Constants.email);
          SharedPrefManager.instance.removeStringAsync(Constants.contactNo);
          SharedPrefManager.instance.removeStringAsync(Constants.token);
          SharedPrefManager.instance.removeStringAsync(Constants.refreshToken);
          SharedPrefManager.instance.removeStringAsync(Constants.fcmToken);
          SharedPrefManager.instance.removeStringAsync(Constants.userId);
          SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
          SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
          isLoginAlready = false;
        }
      } else {
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
