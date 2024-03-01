import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/progressbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../../service/exception_error_util.dart';
import '../../widgets/custom_toast.dart';

class LoginScreenViewModel extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordVisibility = false.obs;
  ValidateUserResponse? validateUserResponse;

  @override
  void onInit() {
    if (kDebugMode) {
      userNameController.text = 'E8I07V';
      passwordController.text = 'abcd';
    }
    super.onInit();
  }

  void validateUser() async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login),
          body: {"userId": userNameController.text, "password": passwordController.text});

      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        validateUserResponse = ValidateUserResponse.fromJson(jsonDecode(response.body));
        globals.userName = validateUserResponse!.data!.first.fullname;
        globals.contactNo = validateUserResponse!.data!.first.contactNo;
        globals.city = validateUserResponse!.data!.first.city;
        globals.email = validateUserResponse!.data!.first.email;
        globals.token = validateUserResponse!.meta!.access;
        globals.userId = validateUserResponse!.data!.first.userId;
        Get.toNamed(AppRoutes.homeScreen);
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(MyStrings.invalidUsernamePassword);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
}
