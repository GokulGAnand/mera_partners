import 'package:get/get.dart';
import '../../../../view_model/home/notification/notification_view_model.dart';

class NotificationScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationViewModel());
  }

}