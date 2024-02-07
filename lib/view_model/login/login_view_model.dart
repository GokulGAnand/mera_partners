import 'dart:convert';
import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;

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
      passwordController.text = '12345';
    }
    super.onInit();
  }

  void validateUser() async {
    try {
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.login), body: {"role": "EVALUATOR", "userId": userNameController.text, "password": passwordController.text});

      if (response.statusCode == 200) {
        validateUserResponse = ValidateUserResponse.fromJson(json.decode(response.body));
        globals.userName = validateUserResponse!.data!.first.fullname;
        globals.contactNo = validateUserResponse!.data!.first.contactNo;
        globals.city = validateUserResponse!.data!.first.city;
        globals.email = validateUserResponse!.data!.first.email;
        globals.token = validateUserResponse!.meta!.access;
        globals.userId = validateUserResponse!.data!.first.userId;
        Get.toNamed(AppRoutes.homeScreen);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
