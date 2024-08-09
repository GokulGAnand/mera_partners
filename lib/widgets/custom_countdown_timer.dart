import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class CustomCountdownTimer extends StatelessWidget {
  final CountdownTimerController timerController;
  final void Function()? onEnd;
  final bool isScheduled;
  final Widget? icon;
  final Color? timerColor;
  const CustomCountdownTimer({super.key, required this.timerController, this.onEnd, required this.isScheduled, this.icon, this.timerColor,});

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: timerController,
      onEnd: onEnd,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return const Text(MyStrings.paused);
        }
        return Row(
          children: [
            if(time.min != 0)
              icon ?? Icon(
                Icons.timer_sharp,
                color: isScheduled ? MyColors.kPrimaryColor : ((time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red),
                size: 14,
              ),
            Text((time.hours != null && time.days != null) ? '${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
              color: isScheduled ? MyColors.kPrimaryColor : timerColor ?? ((time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red),
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ))
          ],
        );
      },
    );
  }
}
