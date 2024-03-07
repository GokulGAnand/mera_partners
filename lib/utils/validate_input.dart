import 'package:evaluator_app/utils/strings.dart';

class ValidateInput {
  static String? validateRequiredFields(String? value) {
    if (value!.trim().isNotEmpty) {
      return null;
    } else {
      return MyStrings.required;
    }
  }
}
