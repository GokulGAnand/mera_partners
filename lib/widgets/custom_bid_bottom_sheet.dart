// ignore_for_file: deprecated_member_use

import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomBidBottomSheet extends StatefulWidget {
  CustomBidBottomSheet({required this.bidValue, this.isAutoBid = false, super.key, this.onBidPressed, this.amountController, this.stepRate, this.onAutoBidPressed});

  final RxList<int> bid = [5000, 10000, 15000].obs;
  final RxInt bidValue;
  final RxInt? stepRate;
  final bool isAutoBid;
  final void Function()? onBidPressed;
  final void Function()? onAutoBidPressed;
  final Rx<TextEditingController>? amountController;
  final amountFormFieldKey = GlobalKey<FormFieldState>();

  void _onTextChanged() {
    // This will trigger an update in all Obx widgets that depend on `amountController`'s text.
    amountController?.refresh();
  }

  @override
  State<CustomBidBottomSheet> createState() => _CustomBidBottomSheetState();
}

class _CustomBidBottomSheetState extends State<CustomBidBottomSheet> {

  @override
  void initState() {
    widget.amountController?.value.addListener(widget._onTextChanged);
    NumberFormat numberFormatter = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
    if (widget.amountController != null && widget.amountController!.value.text.isEmpty){
      widget.amountController!.value.text = numberFormatter.format(widget.bidValue.value).toString();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
    return Container(
        height: (widget.isAutoBid) ? MediaQuery.of(context).size.height * 0.65 : MediaQuery.of(context).size.height * 0.55,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        child: Obx(() =>Column(
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
              '${MyStrings.currentBid} : ${numberFormat.format(widget.bidValue.value)}',
              style: MyStyles.selectedTabBarTitleStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${MyStrings.stepRate} : ${numberFormat.format(widget.stepRate?.value)}',
              style: MyStyles.selectedTabBarTitleStyle,
            ),
            (widget.isAutoBid)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  MyStrings.autoBid,
                  style: MyStyles.blue3_14700,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'We’ll automatically increase your bid by ₹ ${widget.stepRate?.value} until reaching the set amount.',
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
                        // bidValue.value -= 1000;
                        if (int.parse(widget.amountController!.value.text.replaceAll(',', '')) > widget.bidValue.value) {
                          int bidAmount = int.parse(widget.amountController!.value.text.replaceAll(',', ''));
                          bidAmount -= widget.stepRate?.value ?? 0;
                          widget.amountController?.value.text = bidAmount.toString();
                        }
                      },
                      child: const SizedBox(width: 56, child: Icon(Icons.remove))),
                  const VerticalDivider(
                    color: MyColors.kPrimaryColor,
                  ),
                  Expanded(child: Obx(() =>BidTextFormField(
                    controller: widget.amountController!.value,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly,],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Value cannot be empty";
                      } else if ((int.tryParse(value) ?? 0) < widget.bidValue.value) {
                        return "Bid amount can't be lower than the current amount";
                      }
                      return null;
                    },
                  ),
                  ),
                  ),
                  const VerticalDivider(
                    color: MyColors.kPrimaryColor,
                  ),
                  InkWell(
                      onTap: () {
                        // bidValue.value += 1000;
                        int bidAmount = int.parse(widget.amountController!.value.text.replaceAll(',', ''));
                        bidAmount += widget.stepRate?.value ?? 0;
                        widget.amountController?.value.text = bidAmount.toString();
                      },
                      child: const SizedBox(width: 56, child: Icon(Icons.add))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  for (int i = 0; i < widget.bid.length; i++) ...[
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            // bidValue.value += bid[i];
                            int bidAmount = int.parse(widget.amountController!.value.text.replaceAll(',', ''));
                            bidAmount += widget.bid[i];
                            widget.amountController?.value.text = bidAmount.toString();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: EdgeInsets.only(right: (i == widget.bid.length - 1) ? 0 : 8),
                            decoration: BoxDecoration(color: MyColors.lightBlue, borderRadius: BorderRadius.circular(4), border: Border.all(color: MyColors.kPrimaryColor)),
                            child: Text(
                              '+ ${numberFormat.format(widget.bid[i])}',
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
                onPressed: (widget.amountController!.value.text.isEmpty || ((int.tryParse(widget.amountController!.value.text) ?? 0) < widget.bidValue.value)) ?() {
                  if (widget.amountController!.value.text.isEmpty || ((int.tryParse(widget.amountController!.value.text) ?? 0) < widget.bidValue.value)) {
                    CustomToast.instance.showMsg('${MyStrings.vLowBidAmount}(${widget.bidValue.value+widget.stepRate!.value})');
                  }
                }: widget.isAutoBid? widget.onAutoBidPressed : widget.onBidPressed,
                buttonText: ((widget.isAutoBid) ? MyStrings.confirmAutoBid : MyStrings.confirmBid) + numberFormat.format(int.tryParse(widget.amountController!.value.text) ?? widget.bidValue.value),
                textStyle: MyStyles.white14700,
              );
            })
          ],
        ),
        ));
  }
}
