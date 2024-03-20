import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final appBarHeight = 240 / pixelRatio;

    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.notification,
        appBarHeight: appBarHeight,

      ),
     body: ListView.builder(
       itemCount: 5,
       itemBuilder: (context, index) {
         return  NotificationWidget(title: MyStrings.title1, subtitle: MyStrings.offer, image: '');
       },


     )



    );
  }
}


