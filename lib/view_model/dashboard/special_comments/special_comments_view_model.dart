import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model/response/special_comments/special_comments_response.dart';
import '../../../utils/constants.dart';
import '../../../widgets/progressbar.dart';

class SpecialCommentsViewModel extends GetxController{
  Rx<TextEditingController> specialCommentsController = TextEditingController().obs;
  var selectedCarCondition = "".obs;
  var id = Get.arguments ?? '';
  List<String>specialCommentsList = Constants.specialCommentsList;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  var specialResponse = specialcommentlist().obs;


  final Rx<PageController> pageController = PageController(initialPage: 1).obs;
  // the index of the current page
  var activePage = 0.obs;

  @override
  void onInit() {
    log(id);
    getComments();
    super.onInit();
  }

  
  void addComments() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      log('${EndPoints.baseUrl}${EndPoints.specialComment}/${globals.carId}');
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.specialComment}/${globals.carId}'),
            body: {
              "carCondition":selectedCarCondition.value,
              "specialComments":specialCommentsController.value.text
            },
            headers: globals.headers
          );
      if(response.statusCode== 200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        // Get.back();
            Get.offNamed(AppRoutes.dashBoardScreen);
          }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
  
  void getComments()async{
     try {
       var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.specialComment}/${globals.carId}'),headers: globals.headers);
       if(response.statusCode ==200){
              specialResponse.value = specialcommentlist.fromJson(json.decode(response.body));
              loaddata();
          }
       log(response.body);
     } catch (e) {
       log(e.toString());
     }
  }

  void loaddata(){
    if(specialResponse.value.data!=null){
      specialCommentsController.value.text = specialResponse.value.data?[0].specialComments ?? '';
      selectedCarCondition.value = specialResponse.value.data?[0].carCondition ?? '';
    }

  }




}