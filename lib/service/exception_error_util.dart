import 'dart:io';
import 'package:get/get.dart';
import '../model/base_response.dart';
import '../utils/strings.dart';
import '../widgets/progressbar.dart';

class ExceptionErrorUtil {
  static BaseResponse handleErrors(dynamic error) {
    ProgressBar.instance.stopProgressBar(Get.context!);
    BaseResponse response = BaseResponse();
    try {
      if (error is FormatException) {
        response.status = 0;
        response.errorMessage = "Check your input format";
      } else if (error is IOException) {
        response.status = 0;
        response.errorMessage = "Check your input format";
      } else if (error is ArgumentError) {
        response.status = 0;
        response.errorMessage = "Invalid argument provided";
      }else{
        response.status = 0;
        response.errorMessage = MyStrings.unableToConnect;
      }
    } catch (exception) {
      response.status = 0;
      response.errorMessage = "Check your internet and try again later";
    }

    return response;
  }
}
