import 'package:evaluator_app/model/response/login/validate_user_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/api-manager.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginScreenViewModel extends GetxController{
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordVisibility = false.obs;
  ValidateUserResponse? validateUserResponse;

  void validateUser() async {
    try {
      var response = await ApiManager().getDio()!.post(EndPoints.baseUrl+EndPoints.login,data: {
            "role":"EVALUATOR",
            "userId": userNameController.text,
            "password": passwordController.text
          });

      if(response.statusCode == 200){
        Get.toNamed(AppRoutes.homeScreen);
        validateUserResponse = ValidateUserResponse.fromJson(response.data);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}
