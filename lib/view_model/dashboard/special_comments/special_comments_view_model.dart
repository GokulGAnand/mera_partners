import 'dart:developer';

import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants.dart';

class SpecialCommentsViewModel extends GetxController{
  Rx<TextEditingController> specialCommentsController = TextEditingController().obs;
  var selectedCarCondition = "".obs;
  List<String>specialCommentsList = Constants.specialCommentsList;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  final Rx<PageController> pageController = PageController(initialPage: 1).obs;
  // the index of the current page
  var activePage = 0.obs;
  
  void addComments() async {
    //todo
    try {
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.specialComment+'/65cf2025b07b4acdec103563'),
            body: {
              "carCondition":selectedCarCondition.value,
              "specialComments":specialCommentsController.value.text
            },
            headers: globals.headers
          );
      if(response.statusCode == 200){
            Get.toNamed(AppRoutes.dashBoardScreen);
          }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }




}