import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class MyStyles {
  static final regular = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static final regular12 = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: Dimens.standard_12);
  static final bold = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w700, fontSize: Dimens.standard_30);
  static final regularTitle = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w700, fontSize: Dimens.standard_15);

  static final loginTitleStyle = TextStyle(
    color: MyColors.titleColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.standard_28,
  );

  static final titleStyle = TextStyle(
    color: MyColors.titleColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.standard_16,
  );

  static final subTitleStyle = TextStyle(
    color: MyColors.subTitleColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.standard_14,
  );

  static final appBarTitleStyle = TextStyle(
    color: MyColors.white,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.standard_22,
  );
}
