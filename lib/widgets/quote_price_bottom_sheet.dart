import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/constants.dart';
import '../utils/dimens.dart';
import 'custom_toast.dart';

/// ignore: must_be_immutable
class QuotePriceBottomSheet extends StatefulWidget {
  QuotePriceBottomSheet({super.key, required this.otbPrice, this.onPressed, this.amountController, this.otbStartTime, this.otbEndTime, this.minQuotePrice});

  final RxInt otbPrice;
  final RxInt? minQuotePrice;
  final void Function()? onPressed;
  final Rx<TextEditingController>? amountController;
  final DateTime? otbStartTime;
  final DateTime? otbEndTime;
  Rxn<Duration> duration = Rxn();

  @override
  State<QuotePriceBottomSheet> createState() => _QuotePriceBottomSheetState();
}

class _QuotePriceBottomSheetState extends State<QuotePriceBottomSheet> {

  @override
  void initState() {
    widget.minQuotePrice?.value = widget.otbPrice.value > 50000 ? widget.otbPrice.value - 50000 : 0;
    var start = DateTime.now();
    var end = widget.otbEndTime ?? DateTime.now();
    widget.amountController?.value.addListener(_onTextChanged);
    Duration diff = end.difference(start);
    widget.duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));

    if(start.isBefore(end)) {
      startTimer();
    }
    NumberFormat numberFormatter = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
    if (widget.amountController != null && widget.amountController!.value.text.isEmpty){
      widget.amountController!.value.text = numberFormatter.format(widget.otbPrice.value).toString();
    }
    super.initState();
  }


  void _onTextChanged() {
    // This will trigger an update in all Obx widgets that depend on `amountController`'s text.
    widget.amountController?.refresh();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.duration.value!.inSeconds == 0) {
        timer.cancel();
      } else {
        widget.duration.value = widget.duration.value! - const Duration(seconds: 1);
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hour = duration.inHours.toString();
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if(duration.inHours == 0){
      return "${twoDigitMinutes}min ${twoDigitSeconds}sec";
    } else if (duration.inHours < 10){
      hour = twoDigits(duration.inHours);
      return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
    }
    return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
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
              Icon(
                Icons.timer_sharp,
                color:  widget.duration.value!.inMinutes >= 10 ? MyColors.green : widget.duration.value!.inMinutes < 10 ? MyColors.orange : MyColors.red,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(formatDuration( widget.duration.value! ), style: TextStyle(
                color: widget.duration.value!.inMinutes >= 10 ? MyColors.green : widget.duration.value!.inMinutes < 10 ? MyColors.orange : MyColors.red,
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              )),
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
            '${MyStrings.currentOtbPrice} : ₹ ${widget.otbPrice.value}',
            style: MyStyles.selectedTabBarTitleStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '${MyStrings.minQuotePrice} ${Constants.numberFormat.format(widget.minQuotePrice?.value ?? 0)}',
            style: MyStyles.blue14500,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 54,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(color: MyColors.lightBlue, borderRadius: BorderRadius.circular(4), border: Border.all(color: MyColors.kPrimaryColor)),
            child: Expanded(
              child:
            BidTextFormField(
              controller: widget.amountController!.value,
              keyboardType: const TextInputType.numberWithOptions(decimal: false),
              inputFormatter: [FilteringTextInputFormatter.digitsOnly,],
              validator: (value) {
                if (value!.isEmpty) {
                  return "Value cannot be empty";
                } else if ((int.tryParse(value) ?? 0) < widget.minQuotePrice!.value) {
                  return "Quoted price exceeds the maximum allowed difference from OTB price";
                }
                return null;
              },
              borderColor: MyColors.kPrimaryColor,
            ),),
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.5,right: 1),
                child: Icon(Icons.info_outline,size: Dimens.iconSizeS,),
              ),
              Text(MyStrings.quotePriceDesc),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          // Obx(() {return
          Obx(() => CustomElevatedButton(
            onPressed: (widget.amountController!.value.text.isEmpty || ((int.tryParse(widget.amountController!.value.text) ?? 0) < widget.otbPrice.value)) ?() {
              int priceDifference = (int.tryParse(widget.amountController!.value.text) ?? 0) - widget.otbPrice.value;
              if(widget.amountController!.value.text.isEmpty){
                CustomToast.instance.showMsg("Quote price cannot be empty");
              }
              else if (priceDifference > widget.minQuotePrice!.value) {
                CustomToast.instance.showMsg('Quoted price exceeds the maximum allowed difference from OTB price');
              }
            }:widget.onPressed,
            buttonText: (MyStrings.quotePriceAt) + numberFormat.format(int.tryParse(widget.amountController?.value.text??'0') ?? 0),
            textStyle: MyStyles.white14700,
          ),)
          // })
        ],
      ),
    );
  }
}
