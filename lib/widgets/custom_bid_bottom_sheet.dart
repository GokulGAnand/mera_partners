// ignore_for_file: deprecated_member_use

import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// ignore: must_be_immutable
class CustomBidBottomSheet extends StatelessWidget {
  CustomBidBottomSheet({required this.bidValue, this.isAutoBid = false, super.key, this.onBidPressed, this.amountController, this.stepRate, this.onAutoBidPressed});

  final List<int> bid = [5000, 10000, 15000];
  final RxInt bidValue;
  final RxInt? stepRate;
  final bool isAutoBid;
  final void Function()? onBidPressed;
  final void Function()? onAutoBidPressed;
  final TextEditingController? amountController;

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
    return Container(
      height: (isAutoBid) ? 442 : 363,
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
                color: MyColors.green2,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "24min 06sec",
                style: MyStyles.green2_18700,
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
            '${MyStrings.currentBid} : ${numberFormat.format(bidValue.value)}',
            style: MyStyles.selectedTabBarTitleStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${MyStrings.stepRate} : ${numberFormat.format(stepRate?.value)}',
            style: MyStyles.selectedTabBarTitleStyle,
          ),
          (isAutoBid)
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      MyStrings.autoBid,
                      style: MyStyles.blue3_14700,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      MyStrings.autoBidDesc,
                      style: MyStyles.grey14500,
                    ),
                  ],
                )
              : const SizedBox(),
          Container(
            width: double.infinity,
            height: 54,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(color: MyColors.lightBlue, borderRadius: BorderRadius.circular(4), border: Border.all(color: MyColors.kPrimaryColor)),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      bidValue.value -= 1000;
                    },
                    child: const SizedBox(width: 56, child: Icon(Icons.remove))),
                const VerticalDivider(
                  color: MyColors.kPrimaryColor,
                ),
                // Obx(() {
                //   return Expanded(
                //       child: Text(
                //     numberFormat.format(bidValue.value),
                //     textAlign: TextAlign.center,
                //     style: MyStyles.black18700,
                //   ));
                // }),
                Expanded(child: BidTextFormField(
                  controller: amountController ?? TextEditingController(),
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly,],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Value cannot be empty";
                    } else if ((int.tryParse(value) ?? 0) < bidValue.value) {
                      return "Bid amount can't be lower than the current amount";
                    }
                    return null;
                  },
                ),),
                const VerticalDivider(
                  color: MyColors.kPrimaryColor,
                ),
                InkWell(
                    onTap: () {
                      bidValue.value += 1000;
                    },
                    child: const SizedBox(width: 56, child: Icon(Icons.add))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                for (int i = 0; i < bid.length; i++) ...[
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      bidValue.value += bid[i];
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.only(right: (i == bid.length - 1) ? 0 : 8),
                      decoration: BoxDecoration(color: MyColors.lightBlue, borderRadius: BorderRadius.circular(4), border: Border.all(color: MyColors.kPrimaryColor)),
                      child: Text(
                        '+ ${numberFormat.format(bid[i])}',
                        textAlign: TextAlign.center,
                        style: MyStyles.black14700,
                      ),
                    ),
                  ))
                ],
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() {
            return CustomElevatedButton(
              onPressed: isAutoBid? onAutoBidPressed : onBidPressed,
              buttonText: ((isAutoBid) ? MyStrings.confirmAutoBid : MyStrings.confirmBid) + numberFormat.format(bidValue.value),
              textStyle: MyStyles.white14700,
            );
          })
        ],
      ),
    );
  }
}
