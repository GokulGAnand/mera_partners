import 'package:evaluator_app/utils/strings.dart';

class ValidateInput {
  static String? validateRequiredFields(String? value) {
    if (value!.trim().isNotEmpty) {
      return null;
    } else {
      return MyStrings.required;
    }
  }
<<<<<<< HEAD

  static String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value!)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }  
=======
>>>>>>> a1815bfbac36ac28c6712515d4495907fb7e21bd
}
