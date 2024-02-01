import 'package:evaluator_app/utils/strings.dart';

class ValidateInput {

  static String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
      return null/*"Name must be a-z and A-Z"*/;
    }
    return null;
  }

  static String? validateLoginPassword(String? value){
    if(value!.isEmpty){
      return "Password is required";
    }
    return null;
  }


  static String? validatePassword(String? value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$';
    RegExp regExp = RegExp(pattern);
    RegExp regExpUppercase = RegExp('(?=.*?[A-Z])');
    RegExp regExpLowercase = RegExp('(?=.*?[a-z])');
    RegExp regExpNumber = RegExp('(?=.*?[0-9])');
    RegExp regExpSpecial = RegExp(r'(?=.*?[!@#\$&*~])');
    String errorMessage="";
    if (value!.isEmpty) {
      return "Password is Required";
    }else if (!regExp.hasMatch(value)){
      if (value.isNotEmpty && value.length <= 6) {
        errorMessage="${errorMessage}Minimum Length: 7\n";
      }
      if (!regExpUppercase.hasMatch(value)) {
        errorMessage="${errorMessage}Minimum Uppercase Characters: 1\n";
      }
      if (!regExpLowercase.hasMatch(value)) {
        errorMessage="${errorMessage}Minimum Lowercase Characters: 1\n";
      }
      if (!regExpNumber.hasMatch(value)) {
        errorMessage="${errorMessage}Minimum Numeric Characters: 1\n";
      }
      if (!regExpSpecial.hasMatch(value)) {
        errorMessage="${errorMessage}Minimum Special Characters: 1";
      }
      return errorMessage;
    }
    return null;
  }

  static String? requiredFields(String? value) {
    if (value!.trim().isNotEmpty) {
      return null;
    } else {
      return MyStrings.required;
    }
  }

}



