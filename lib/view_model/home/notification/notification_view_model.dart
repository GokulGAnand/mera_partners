import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../model/response/notification/notification_list_response.dart';

class NotificationViewModel extends GetxController {
  var notificationList = NotificationListResponse().obs;

  @override
  void onInit() {
    getNotificationsList();
    super.onInit();
  }

  void getNotificationsList() async {
    try {
      var result = await ApiManager.get(endpoint: EndPoints.users + EndPoints.notification + globals.uniqueUserId!);
      log(result.body.toString());
      if (result.statusCode == 200) {
        notificationList.value = NotificationListResponse.fromJson(jsonDecode(result.body));
        if (notificationList.value.data != null) {
          notificationList.value.data = notificationList.value.data!.reversed.toList();
        }
        update();
        refresh();
        notifyChildrens();
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
