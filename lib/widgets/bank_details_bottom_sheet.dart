import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import 'bank_details_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double bottomSheetHeight = screenHeight * 0.44;

    return Container(
      height: bottomSheetHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: Dimens.standard_20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.07,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyColors.grey,
              ),
            ),
          ),
          SizedBox(height: Dimens.standard_10),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              Text(
                MyStrings.bankAc,
                style: MyStyles.black16700,
              )
            ],
          ),
          const BankDetailWidget(
            label: MyStrings.acHName,
            value: MyStrings.mAdmin,
          ),
          const BankDetailWidget(
            label: MyStrings.admin,
            value: MyStrings.aC
          ),
          const BankDetailWidget(
            label: MyStrings.ifsc,
            value: MyStrings.ifscCode
          )
        ],
      ),
    );
  }
}
