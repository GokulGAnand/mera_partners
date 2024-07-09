import 'package:get/get.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:mera_partners/view_model/home/notification/notification_view_model.dart';
import '../../../widgets/notification_widget.dart';

/// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({
    super.key,
  });

  NotificationViewModel controller = Get.isRegistered<NotificationViewModel>() ? Get.find<NotificationViewModel>() : Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    //final appBarHeight = 240 / pixelRatio;
    final appBarHeight = 150 / pixelRatio;

    return Scaffold(
        // appBar: CustomAppBar(
        //    title: MyStrings.notification,
        //   appBarHeight: appBarHeight,
        // ),
      appBar: AppBar(
        title: const Text(MyStrings.notification,
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.w600
          ),
        ),
        toolbarHeight: appBarHeight,
        backgroundColor: MyColors.kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
        body: Obx(() => (controller.notificationList.value.data != null) && controller.notificationList.value.data!.isNotEmpty ? ListView.builder(
          itemCount: controller.notificationList.value.data?.length ?? 0,
          padding: const EdgeInsets.only(top: 15),
          itemBuilder: (context, index) {
            return NotificationWidget(title: controller.notificationList.value.data?[index].title ?? '',
                subtitle: controller.notificationList.value.data?[index].body ?? '',
                image: controller.notificationList.value.data?[index].imageUrl ?? '');
          },
        )  : const Center(child: Text(MyStrings.noDataFound),)) );
  }
}
