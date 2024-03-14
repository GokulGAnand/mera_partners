
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialScreenViewModel extends GetxController{
  RxInt page = 0.obs;
  RxInt controller = 0.obs;
  PageController indicator = PageController();
  var isDialogVisible = false.obs;


}