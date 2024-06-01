import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/constants.dart';
import '../utils/dimens.dart';
import 'custom_toast.dart';

/// ignore: must_be_immutable
class QuotePriceBottomSheet extends StatefulWidget {
  QuotePriceBottomSheet({super.key, required this.otbPrice, this.onPressed, required this.amountController, this.otbStartTime, this.otbEndTime, required this.minQuotePrice, this.timerController});

  final RxInt otbPrice;
  final RxNum minQuotePrice;
  final void Function()? onPressed;
  final Rx<TextEditingController> amountController;
  final DateTime? otbStartTime;
  final DateTime? otbEndTime;
  CurrentRemainingTime? remainingTime;
  final Rx<CountdownTimerController>? timerController;

  onEnd(){
    if(timerController!.value.isRunning){
      timerController?.value.disposeTimer();
    }
  }

  @override
  State<QuotePriceBottomSheet> createState() => _QuotePriceBottomSheetState();
}

class _QuotePriceBottomSheetState extends State<QuotePriceBottomSheet> {

  @override
  void initState() {
    widget.amountController.value.addListener(_onTextChanged);

    if (widget.amountController.value.text.isEmpty){
      // widget.amountController.value.text = numberFormatter.format(widget.otbPrice.value).toString();
      widget.amountController.value.text = widget.otbPrice.value.toString();
    }
    super.initState();
  }


  void _onTextChanged() {
    // This will trigger an update in all Obx widgets that depend on `amountController`'s text.
    widget.amountController.refresh();
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
      height: MediaQuery.of(context).size.height < 900 ? MediaQuery.of(context).size.height * 0.65: MediaQuery.of(context).size.height * 0.55,
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
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.timer_sharp,
                // color: MyColors.green2,
                color: widget.remainingTime?.hours != 0 ? MyColors.green2 : widget.remainingTime!.min! <= 2 ? MyColors.red2 : widget.remainingTime!.min! >= 10 ? MyColors.green2 : widget.remainingTime!.min! < 10 ? MyColors.orange : MyColors.red,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              CountdownTimer(
                controller: widget.timerController?.value,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return const Text('');
                  }else{
                    widget.remainingTime = time;
                  }
                  return Text(time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
                    color: widget.remainingTime?.hours != 0 ? MyColors.green2 : widget.remainingTime!.min! <= 2 ? MyColors.red2 : widget.remainingTime!.min! >= 10 ? MyColors.green2 : widget.remainingTime!.min! < 10 ? MyColors.orange : MyColors.red,
                    // color: MyColors.green2,
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ));
                },
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
          ),),
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
            '${MyStrings.minQuotePrice} ${Constants.numberFormat.format(widget.minQuotePrice.value)}',
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
            child: Row(
              children: [
                Expanded(
                  child:
                  BidTextFormField(
                    controller: widget.amountController.value,
                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(8)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Value cannot be empty";
                      } else if ((int.tryParse(value) ?? 0) < widget.minQuotePrice.value) {
                        return "Quoted price exceeds the maximum allowed difference from OTB price";
                      }
                      return null;
                    },
                    borderColor: MyColors.kPrimaryColor,
                  ),),
              ],
            )
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
            onPressed: (widget.amountController.value.text.isEmpty || ((int.tryParse(widget.amountController.value.text) ?? 0) < (widget.minQuotePrice.value))) ?() {
              int price = (int.tryParse(widget.amountController.value.text) ?? 0);
              if(widget.amountController.value.text.isEmpty){
                CustomToast.instance.showMsg("Quote price cannot be empty");
              }
              else if (price < (widget.minQuotePrice.value)) {
                CustomToast.instance.showMsg('Quoted price should not be less than minimum quote price');
              }
            }:widget.onPressed,
            buttonText: (MyStrings.quotePriceAt) + numberFormat.format(int.tryParse(widget.amountController.value.text) ?? 0),
            textStyle: MyStyles.white14700,
          ),)
          // })
        ],
      ),
    );
  }
}
