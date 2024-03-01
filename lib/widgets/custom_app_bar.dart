import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import '../utils/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;

  final double? leadingWidth;

  final double? elevation;

  final Widget? leading;

  final String? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.elevation,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(right: 0.0, left: 0.0, top: 0.0, bottom: 30.0),
      child: AppBar(
        // toolbarHeight: 60,
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: MyColors.white),
        centerTitle: true,
        titleSpacing: 0.0,
        elevation: elevation ?? 0,
        leadingWidth: leadingWidth,
        bottom: bottom,
        // backgroundColor: MyColors.white,
        leading: leading ?? const SizedBox(),
        title: Text(
          title ?? "",
          style: MyStyles.titleTextStyle,
          textAlign: TextAlign.center,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => bottom != null ? Size.fromHeight(Dimens.standard_200) : const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar1({
    super.key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 46,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    double.maxFinite,
    height ?? 46,
  );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 46,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: MyColors.appBarGrey.withOpacity(0.62),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill,
}
