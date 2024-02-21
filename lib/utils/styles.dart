import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class MyStyles {
  static final regular = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static final regular12 = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: Dimens.standard_12);
  static final bold = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w700, fontSize: Dimens.standard_30);
  static final regularTitle = TextStyle(color: MyColors.kPrimaryColor, fontWeight: FontWeight.w700, fontSize: Dimens.standard_15);
  static const titleTextStyle = TextStyle(
    color: MyColors.blue,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.titleFontSize,
  );
  static const bodyTitleStyle = TextStyle(
    color: MyColors.blueDark,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.bodyTitleFontSize,
  );
  static const cardTitleStyle = TextStyle(
    color: MyColors.white,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.cardTitleFontSize,
  );
  static const cardTitleStyleBlue = TextStyle(
    color: MyColors.blue,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.cardTitleFontSize,
  );
  static const blackW500F15Style = TextStyle(color: MyColors.black, fontWeight: FontWeight.w500, fontSize: Dimens.cardTitleFontSize, fontFamily: 'Inter');
  static const blackTitleStyle = TextStyle(color: MyColors.black, fontWeight: FontWeight.w500, fontSize: Dimens.fontSize17, fontFamily: 'Inter');
  static final greyStyle = TextStyle(color: MyColors.greyLight, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static final greyMediumStyle = TextStyle(color: MyColors.greyMedium, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static final greyMedium = TextStyle(color: MyColors.greyMedium, fontWeight: FontWeight.w400, fontSize: Dimens.standard_12);
  static final black12w400 = TextStyle(color: MyColors.black, fontWeight: FontWeight.w400, fontSize: Dimens.standard_12);
  static final greyMedium500 = TextStyle(color: MyColors.greyMedium, fontWeight: FontWeight.w500, fontSize: Dimens.standard_12);
  static final locationStyle = TextStyle(color: MyColors.grey, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static const dropdownMenuStyle = TextStyle(color: MyColors.black, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontStyle: FontStyle.normal);
  static const uploadImageTitleStyle = TextStyle(
    color: Color(0xFF1D1B20),
    fontSize: 23,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const reportStyle = TextStyle(
    color: MyColors.kPrimaryColor,
    fontSize: 23,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const reportTitleStyle = TextStyle(
    color: MyColors.white,
    fontSize: 19,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const reportLabelStyle = TextStyle(
    color: MyColors.black,
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const ratingTitleStyle = TextStyle(
    color: MyColors.white,
    fontSize: 23,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  static const reportTextStyle = TextStyle(
    color: MyColors.black,
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const reportTitle = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0,
  );
}
