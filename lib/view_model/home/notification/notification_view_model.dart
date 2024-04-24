import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../model/response/notification/notification_list_response.dart';

class NotificationViewModel extends GetxController{

  var notificationList = NotificationListResponse().obs;
  @override
  void onInit() {
    getNotificationsList();
    super.onInit();
  }
  
  void getNotificationsList() async {
    //todo change user id
    // var headers = {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWJkZjAzNmNjMmUwYTc0YTQ1NzUzODYiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzEzMzMxNzU3LCJleHAiOjE3MTU5MjM3NTd9.USTPvCBd2Sk8c3t6-jw8jC9OflidVS7idoCiADpfbIA'};
    try {
      var result = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.users+EndPoints.notification+globals.uniqueUserId!),headers: globals.headers);
      log(result.body.toString());
      if(result.statusCode == 200){
            notificationList.value = NotificationListResponse.fromJson(jsonDecode(result.body));
            update();
            refresh();
            notifyChildrens();
          }else{

          }
    } catch (e) {
      log(e.toString());
    }

  }
}