import 'dart:io';
import '../model/base_response.dart';
import '../utils/strings.dart';

class ExceptionErrorUtil {
  static BaseResponse handleErrors(dynamic error) {
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
