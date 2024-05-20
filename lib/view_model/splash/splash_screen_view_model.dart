import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mera_partners/model/response/user_data/user_car_details_response.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:mera_partners/widgets/custom_toast.dart';

class SplashScreenViewModel extends GetxController {
  bool isLoginAlready = false;

  Future<bool> loadData() async {
    globals.token =
        await SharedPrefManager.instance.getStringAsync(Constants.token);
    globals.isOnboarding =
          await SharedPrefManager.instance.getBoolAsync(Constants.isOnboarding);
    if (globals.token != null && globals.token.toString().isNotEmpty) {
      globals.phoneNum =
          await SharedPrefManager.instance.getStringAsync(Constants.phoneNum);
      if (globals.phoneNum != null) {
        globals.contactNo = int.parse(await SharedPrefManager.instance
                .getStringAsync(Constants.contactNo) ??
            "0");
      }
      globals.userId =
          await SharedPrefManager.instance.getStringAsync(Constants.userId);
      globals.uniqueUserId = await SharedPrefManager.instance
          .getStringAsync(Constants.uniqueUserId);
      globals.documentStatus = await SharedPrefManager.instance
          .getStringAsync(Constants.documentStatus);
      globals.isDeposited =
          await SharedPrefManager.instance.getBoolAsync(Constants.isDeposited);
      globals.addressProofFront = await SharedPrefManager.instance
          .getBoolAsync(Constants.addressProofFront);
      globals.userName =
          await SharedPrefManager.instance.getStringAsync(Constants.userName);
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
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(
          Uri.parse(
              '${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'),
          headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        userResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        log("isDeactivate: " +
            userResponse.value.data![0].isDeactivate.toString());
        if (userResponse.value.data![0].isDeactivate == true) {
          globals.clearData();
          SharedPrefManager.instance.removeStringAsync(Constants.userName);
          SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
          SharedPrefManager.instance.removeStringAsync(Constants.contactNo);
          SharedPrefManager.instance.removeStringAsync(Constants.token);
          SharedPrefManager.instance.removeStringAsync(Constants.fcmToken);
          SharedPrefManager.instance.removeStringAsync(Constants.userId);
          SharedPrefManager.instance.removeStringAsync(Constants.uniqueUserId);
          SharedPrefManager.instance.removeStringAsync(Constants.documentStatus);
          isLoginAlready = false;
        }
        log('API Response svvs: ${response.body}');
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log('Exception occurred: $e');
      CustomToast.instance
          .showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
