import 'package:evaluator_app/view/new_evaluation/new_evaluation_page_one.dart';
import 'package:evaluator_app/view/new_evaluation/new_evaluation_page_three.dart';
import 'package:evaluator_app/view/new_evaluation/new_evaluation_page_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/new_evaluation/new_evaluation_page_four.dart';

class NewEvaluationViewModel extends GetxController{

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  // the index of the current page
  var activePage = 0.obs;

  final List<Widget> pages = [
    NewEvaluationPageOne(),
    const NewEvaluationPageTwo(),
    const NewEvaluationPageThree(),
    const NewEvaluationPageFour(),
  ].obs;
}