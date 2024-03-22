// ignore_for_file: deprecated_member_use

import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NegotiationBottomSheet extends StatelessWidget {
  const NegotiationBottomSheet({
    required this.biddedAmount,
    required this.negotiatedAmount,
    super.key});
  final int biddedAmount;
  final int negotiatedAmount;
  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
    return Container(
      height: 271,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(color: MyColors.grey, borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                MySvg.timer,
                width: 20,
                color: MyColors.warning,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "24min 06sec",
                style: MyStyles.warningRed_18700,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  MySvg.cancel,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
          '${MyStrings.biddedAmount} : ${numberFormat.format(biddedAmount)}',
          style: MyStyles.black14500,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
'${MyStrings.negotiatedAmount} : ${numberFormat.format(negotiatedAmount)}',
style: MyStyles.primary14700,
),
const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(MySvg.info,height: 12,width: 12,color: MyColors.black,),
              const SizedBox(
                width: 3,
              ),
              const Text(
                MyStrings.negotiationDesc,
                style: MyStyles.grey14500,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(2),
                          backgroundColor:
                              MyColors.kPrimaryColor.withOpacity(0.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(color: MyColors.kPrimaryColor))),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.reject,
                      textStyle: MyStyles.primary16500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(2),
                          backgroundColor: MyColors.kPrimaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(color: MyColors.kPrimaryColor))),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.accept,
                      textStyle: MyStyles.whiteTitleStyle,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}