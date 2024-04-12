import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonAppBar({
    required this.title,
    super.key,});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: MyColors.kPrimaryColor,
        leadingWidth: 50,
        leading:GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: SvgPicture.asset(MySvg.arrowBack),
          ),
        ),
        title: Text(
          title,
          style: MyStyles.white16700,
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}