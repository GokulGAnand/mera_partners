import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class MyStyles {
  static final regular = TextStyle(color: MyColors.white, fontWeight: FontWeight.w400, fontSize: Dimens.standard_14);
  static const titleStyle = TextStyle(
    color: MyColors.white,
    fontSize: 22,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const subTitleWhiteStyle = TextStyle(
    color: MyColors.white,
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    height: 0.09,
  );
  static const subTitleBlackStyle = TextStyle(
    color: MyColors.black,
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    height: 0.09,
  );
  static const subTitleGreayStyle = TextStyle(
    color: MyColors.subTitleColor,
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    // height: 0.09,
  );
  static const pageTitleStyle = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  static const blackBold28 = TextStyle(
    color: MyColors.black,
    fontSize: 28,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const blackBold20 = TextStyle(
    color: MyColors.black,
    fontSize: 20,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  static const selectedTabBarTitleStyle = TextStyle(
    color: MyColors.black,
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  
}
