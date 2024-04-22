import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    required this.title,
    this.appBarHeight = 150,
    this.showBackIcon = true,
    super.key, this.subTitle, this.actions});
  final String title;
  final String? subTitle;
  final double? appBarHeight;
  final List<Widget>? actions;
  final bool showBackIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: MyColors.kPrimaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: actions,
          leading: (showBackIcon)?GestureDetector(
            onTap: (){
              Get.back();
            },
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: SvgPicture.asset(MySvg.arrowBack, color: MyColors.white,),
            ),)
            :const SizedBox(),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: Dimens.padding16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 19,),
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