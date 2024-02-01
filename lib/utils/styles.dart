import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class MyStyles{

  static final regular = TextStyle(color: MyColors.kPrimaryColor,fontWeight: FontWeight.w400,fontSize: Dimens.standard_14);
  static final bold = TextStyle(color: MyColors.kPrimaryColor,fontWeight: FontWeight.w700,fontSize: Dimens.standard_30);
  static const titleTextStyle = TextStyle(color: MyColors.blue,fontWeight: Dimens.titleFontWeight,fontSize: Dimens.titleFontSize,);
  static const bodyTitleStyle = TextStyle(color: MyColors.blueDark,fontWeight: FontWeight.w600,fontSize: Dimens.bodyTitleFontSize,);
  static const cardTitleStyle = TextStyle(color: MyColors.white,fontWeight: FontWeight.w500,fontSize: Dimens.cardTitleFontSize,);
  static const cardTitleStyleBlue = TextStyle(color: MyColors.blue,fontWeight: FontWeight.w500,fontSize: Dimens.cardTitleFontSize,);
  static const blackW500F15Style = TextStyle(color: MyColors.black,fontWeight: FontWeight.w500,fontSize: Dimens.cardTitleFontSize,fontFamily: 'Inter');
  static const blackTitleStyle = TextStyle(color: MyColors.black,fontWeight: FontWeight.w500,fontSize: Dimens.fontSize17,fontFamily: 'Inter');
  static final greyStyle = TextStyle(color: MyColors.greyLight,fontWeight: FontWeight.w400,fontSize: Dimens.standard_14);
  static final greyMediumStyle = TextStyle(color: MyColors.greyMedium,fontWeight: FontWeight.w400,fontSize: Dimens.standard_14);
  static final locationStyle = TextStyle(color: MyColors.grey,fontWeight: FontWeight.w400,fontSize: Dimens.standard_14);

}

