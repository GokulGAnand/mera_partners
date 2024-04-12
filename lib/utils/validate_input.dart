import 'package:mera_partners/utils/strings.dart';

class ValidateInput {
  static String? validateRequiredFields(String? value) {
    if (value!.trim().isNotEmpty) {
      return null;
    } else {
      return MyStrings.required;
    }
  }

  static String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }  
}
