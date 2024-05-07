import 'package:flutter/material.dart';

extension DismissKeyBoard on BuildContext{
  void dismissKeyBoard(){
    FocusScope.of(this).unfocus();
  }
}