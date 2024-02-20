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
    print(id);
    getComments();
    super.onInit();
  }

  
  void addComments() async {
    //todo
    try {
      print(EndPoints.baseUrl+EndPoints.specialComment+'/'+id);
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.specialComment+'/'+id),
            body: {
              "carCondition":selectedCarCondition.value,
              "specialComments":specialCommentsController.value.text
            },
            headers: globals.headers
          );
      if(response.statusCode== 200){
            Get.toNamed(AppRoutes.dashBoardScreen);
          }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }
  
  void getComments()async{
     var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.specialComment+'/'+id),headers: globals.headers);
     if(response.statusCode ==200){
       specialResponse.value = specialcommentlist.fromJson(json.decode(response.body));
       loaddata();
   }log(response.body);
  }

  void loaddata(){
    if(specialResponse.value.data!=null){
      specialCommentsController.value.text = specialResponse.value.data?[0].specialComments ?? '';
      selectedCarCondition.value = specialResponse.value.data?[0].carCondition ?? '';
    }

  }




}