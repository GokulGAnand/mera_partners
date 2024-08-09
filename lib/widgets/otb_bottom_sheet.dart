import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/dimens.dart';
import 'custom_countdown_timer.dart';

/// ignore: must_be_immutable
class OTBBottomSheet extends StatelessWidget {
  OTBBottomSheet({super.key, required this.otbPrice, this.onPressed, this.bidStartTime, this.bidEndTime, this.timerController});

  final int otbPrice;
  final void Function()? onPressed;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  Rxn<Duration> duration = Rxn();
  final Rx<CountdownTimerController>? timerController;

  onEnd(){
    if(timerController!.value.isRunning){
      timerController?.value.disposeTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var start = DateTime.now();
    // var end = bidEndTime ?? DateTime.now();
    // Duration diff = end.difference(start);
    // duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    //
    // if(start.isBefore(end)) {
    //   startTimer();
    // }
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
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
              Obx(() => CustomCountdownTimer(
                timerController: timerController!.value, isScheduled: false,
              ),),
              const Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
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
          RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: "${MyStrings.otbPrice} : ",
                   style: MyStyles.selectedTabBarTitleStyle,),
                   TextSpan(
                      text: '₹ ',
                      style: MyStyles.selectedTabBarTitleStyle.copyWith(fontFamily: 'Rupee')),
                   TextSpan(text: otbPrice.toString(),
                   style: MyStyles.selectedTabBarTitleStyle,),
                ],
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(MyImages.bolt,height: Dimens.iconSizeS,width: Dimens.iconSizeS,color: MyColors.black,),
              const SizedBox(
                width: 3,
              ),
              const Text(
                MyStrings.otbBuyDesc,
                style: MyStyles.grey14500,
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          // Obx(() {return
          CustomElevatedButton(
            onPressed: onPressed,
            buttonText: '',
            child: RichText(
                    textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text: MyStrings.confirmBuy,
                                    style: MyStyles.white14700,),
                                    TextSpan(
                                        text: '₹ ',
                                        style: MyStyles.white14700.copyWith(fontFamily: 'Rupee')),
                                    TextSpan(text: numberFormat.format(otbPrice),
                                    style: MyStyles.white14700,),
                                  ],
                                ),
                              ),
            // textStyle: MyStyles.white14700,
          ),
          // })
        ],
      ),
    );
  }
}
