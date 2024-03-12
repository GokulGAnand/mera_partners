import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    required this.title,
    this.appBarHeight = 150,
    super.key, this.subTitle, this.actions});
  final String title;
  final String? subTitle;
  final double? appBarHeight;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: MyColors.kPrimaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: actions,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.white,)),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: Dimens.padding16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(
                    title,
                    style: MyStyles.titleStyle
                  ),
                  if(subTitle != null)
                    const SizedBox(height: 13,),
                  if(subTitle != null)
                  Text(
                      subTitle ?? '',
                    style: MyStyles.regular
                  )
                ],
              ),
            ),
          ),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight!);
}