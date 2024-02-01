import 'package:evaluator_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/dimens.dart';
import '../utils/styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonAppBar({super.key, required this.leading, this.leadingWidth, this.elevation, this.title, this.actions, this.centerTitle});

  final Widget leading;
  final double? leadingWidth;
  final double? elevation;
  final String? title;
  final List<Widget>? actions;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      titleSpacing: 0.0,
      elevation: elevation ?? 0,
      backgroundColor: MyColors.appBarGrey,
      leadingWidth: leadingWidth,
      leading: leading ,
      title: Padding(
        padding: const EdgeInsets.only(left: 27.0),
        child: Text(title ?? "", style: MyStyles.titleTextStyle,textAlign: TextAlign.center,),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => leadingWidth != null
      ? Size.fromHeight(Dimens.standard_120)
      : const Size.fromHeight(kToolbarHeight);

}
