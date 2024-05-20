// ignore_for_file: deprecated_member_use
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// ignore: must_be_immutable
class CustomBidBottomSheet extends StatefulWidget {
  CustomBidBottomSheet({required this.bidValue, this.isAutoBid = false, super.key, this.onBidPressed, this.amountController, this.stepRate, this.onAutoBidPressed,
    this.bidStartTime,
    this.bidEndTime,
    this.isScheduled, this.timerController,
  });

  final RxList<int> bid = [5000, 10000, 15000].obs;
  final RxInt bidValue;
  final RxInt? stepRate;
  final bool isAutoBid;
  final void Function()? onBidPressed;
  final void Function()? onAutoBidPressed;
  final Rx<TextEditingController>? amountController;
  final amountFormFieldKey = GlobalKey<FormFieldState>();
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  Rxn<Duration> duration = Rxn();
  RxBool? isScheduled = false.obs;
  Rx<int> auctionTime = 0.obs;
  final Rx<CountdownTimerController>? timerController;

  onEnd(){
    if(timerController!.value.isRunning){
      timerController?.value.disposeTimer();
    }
  }

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
    // var start = DateTime.now();
    // var end = widget.bidEndTime ?? DateTime.now();
    widget.amountController?.value.addListener(widget._onTextChanged);
    // Duration diff = end.difference(start);
    // widget.duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    //
    // if(start.isBefore(end)) {
    //   startTimer();
    // }
    NumberFormat numberFormatter = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
    if (widget.amountController != null && widget.amountController!.value.text.isEmpty){
      widget.amountController!.value.text = numberFormatter.format(widget.bidValue.value).toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.timerController!.value.dispose();
    super.dispose();
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
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.timer_sharp,
                  color:  widget.auctionTime.value >= 10 ? MyColors.green : widget.auctionTime < 10 ? MyColors.orange : MyColors.red,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Obx(() => CountdownTimer(
                  controller: widget.timerController?.value,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return const Text('');
                    }
                    if(time.min != null){
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        widget.auctionTime.value = time.min ?? 0;
                      });
                    }
                    return Text(time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
                      color: widget.auctionTime.value >= 10 ? MyColors.green : widget.auctionTime.value < 10 ? MyColors.orange : MyColors.red,
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ));
                  },
                ),),
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
            ),),
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
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(8)],
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
