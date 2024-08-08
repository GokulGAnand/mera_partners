// ignore_for_file: deprecated_member_use
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'custom_countdown_timer.dart';

/// ignore: must_be_immutable
class NegotiationBottomSheet extends StatelessWidget {
  const NegotiationBottomSheet({required this.biddedAmount, required this.negotiatedAmount, super.key, required this.onAcceptPressed, required this.onRejectPressed, this.negStartTime, this.negEndTime, this.timerController});

  final int biddedAmount;
  final int negotiatedAmount;
  final void Function() onAcceptPressed;
  final void Function() onRejectPressed;
  final DateTime? negStartTime;
  final DateTime? negEndTime;
  final Rx<CountdownTimerController>? timerController;

  onEnd(){
    if(timerController!.value.isRunning){
      timerController?.value.disposeTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var start = DateTime.now();
    // var end = negEndTime ?? DateTime.now();
    // Duration diff = end.difference(start);
    // duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    //
    // if(start.isBefore(end)) {
    //   startTimer();
    // }
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
              Obx(() => CustomCountdownTimer(
                timerController: timerController!.value,
                isScheduled: false,
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
                  const TextSpan(
                    text: '${MyStrings.biddedAmount} : ',
                    style: MyStyles.black14500,
                  ),
                  TextSpan(
                      text: '₹',
                      style: MyStyles.black14500.copyWith(fontFamily: 'Rupee')),
                  TextSpan(text: Constants.numberFormat.format(biddedAmount),
                   style: MyStyles.black14500,),
                ],
              ),
            ),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: '${MyStrings.negotiatedAmount} : ',
                    style: MyStyles.primary14700,
                  ),
                  TextSpan(
                      text: '₹',
                      style: MyStyles.primary14700.copyWith(fontFamily: 'Rupee')),
                  TextSpan(text: Constants.numberFormat.format(negotiatedAmount),
                   style: MyStyles.primary14700,),
                ],
              ),
            ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                MySvg.info,
                height: 12,
                width: 12,
                color: MyColors.black,
              ),
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
                    onPressed: onRejectPressed,
                    buttonStyle: ElevatedButton.styleFrom(padding: const EdgeInsets.all(2), backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: const BorderSide(color: MyColors.kPrimaryColor))),
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
                    onPressed: onAcceptPressed,
                    buttonStyle: ElevatedButton.styleFrom(padding: const EdgeInsets.all(2), backgroundColor: MyColors.kPrimaryColor, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: const BorderSide(color: MyColors.kPrimaryColor))),
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
