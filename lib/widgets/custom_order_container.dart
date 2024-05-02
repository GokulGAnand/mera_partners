import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_toast.dart';

class CustomOrderContainer extends StatefulWidget {
  CustomOrderContainer({super.key, this.button, required this.dealStatus, this.backgroundBlackOpacity, required this.buttonText, required this.buttonStatus, required this.carModel, required this.carName, required this.carID, required this.imageURL, required this.finalPrice, this.onPressed, required this.showButton, this.negStartTime, this.negEndTime});

  final Widget? button;
  final String dealStatus;
  final Widget? backgroundBlackOpacity;
  final String buttonText;
  final String buttonStatus;
  final String carModel;
  final String carName;
  final String carID;
  final String imageURL;
  final String finalPrice;
  final Function()? onPressed;
  final bool showButton;
  final DateTime? negStartTime;
  final DateTime? negEndTime;
  Rxn<Duration> duration = Rxn();

  @override
  State<CustomOrderContainer> createState() => _CustomOrderContainerState();
}

class _CustomOrderContainerState extends State<CustomOrderContainer> {

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
  void initState() {
    var start = DateTime.now();
    var end = widget.negEndTime ?? DateTime.now();
    Duration diff = end.difference(start);
    widget.duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    if(start.isBefore(end)) {
      startTimer();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyColors.subTitleColor.withOpacity(0.15),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 107,
                  // height: showButton?107:200,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageURL),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                (widget.backgroundBlackOpacity != null)
                    ? widget.backgroundBlackOpacity!
                    : Container(
                  width: double.infinity,
                  height: 107,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [
                        MyColors.black3.withOpacity(0),
                        MyColors.black3.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                (widget.dealStatus.isEmpty || (["timer", "deal won", "deal lost"].contains(widget.dealStatus) == false))
                    ? const SizedBox()
                    : Container(
                  height: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: (widget.dealStatus == "deal won") ? MyColors.green3 : MyColors.warning,
                    gradient: (widget.dealStatus == "timer")
                        ? const LinearGradient(
                      begin: Alignment(-0.5, 0.00),
                      end: Alignment(2, 0),
                      colors: [
                        MyColors.warning,
                        MyColors.black5,
                      ],
                    )
                        : null,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        (widget.dealStatus == "timer")
                            ? MySvg.timer
                            : (widget.dealStatus == "deal won")
                            ? MySvg.dealWon
                            : MySvg.dealLost,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      widget.dealStatus == "timer"?
                      Obx(() => Text(
                        (widget.dealStatus == "timer")
                            ?  formatDuration( widget.duration.value! )
                            : (widget.dealStatus == "deal won")
                            ? MyStrings.dealWon
                            : MyStrings.dealLost,
                        style: (widget.dealStatus == "timer")
                            ? MyStyles.white14700
                            : (widget.dealStatus == "deal won")
                            ? MyStyles.whiteTitleStyle
                            : MyStyles.whiteTitleStyle,
                      ),) :  Text(
                        (widget.dealStatus == "timer")
                            ?  formatDuration( widget.duration.value! )
                            : (widget.dealStatus == "deal won")
                            ? MyStrings.dealWon
                            : MyStrings.dealLost,
                        style: (widget.dealStatus == "timer")
                            ? MyStyles.white14700
                            : (widget.dealStatus == "deal won")
                            ? MyStyles.whiteTitleStyle
                            : MyStyles.whiteTitleStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.carName,
                    style: MyStyles.black12400,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    widget.carModel,
                    style: MyStyles.black14700,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: widget.carID));
                        CustomToast.instance.showMsg('Text copied to clipboard');
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.copy_rounded,
                            size: 16,
                          ),
                          Text(
                            widget.carID,
                            style: MyStyles.subtitle12400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Your bid: ${widget.finalPrice}",
                    style: MyStyles.primary14700,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.showButton)
                    SizedBox(
                      height: 40,
                      child: (widget.buttonStatus.isEmpty || (["completed", "view details", "pending"].contains(widget.buttonStatus) == false))
                          ? null
                          : DottedBorder(
                        color: (widget.buttonStatus.toLowerCase() == "pending") ? MyColors.yellow2 : Colors.transparent,
                        padding: EdgeInsets.zero,
                        radius: const Radius.circular(6),
                        dashPattern: const [3, 3],
                        child: CustomElevatedButton(
                          onPressed: (widget.onPressed != null) ? widget.onPressed : () {},
                          buttonStyle: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(2),
                            backgroundColor: (widget.buttonStatus.toLowerCase() == "view" || widget.buttonStatus == "view details")
                                ? MyColors.kPrimaryColor.withOpacity(0.1)
                                : (widget.buttonStatus.toLowerCase() == "pending")
                                ? MyColors.yellow.withOpacity(0.5)
                                : MyColors.green3,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: (widget.buttonStatus.toLowerCase() == "view" || widget.buttonStatus == "view details") ? const BorderSide(color: MyColors.kPrimaryColor) : BorderSide.none,
                            ),
                          ),
                          buttonColor: (widget.buttonStatus.toLowerCase() == "view" || widget.buttonStatus == "view details")
                              ? MyColors.kPrimaryColor.withOpacity(0.3)
                              : (widget.buttonStatus.toLowerCase() == "pending")
                              ? MyColors.yellow
                              : MyColors.green3,
                          buttonText: widget.buttonText,
                          textStyle: (widget.buttonStatus.toLowerCase() == "view" || widget.buttonStatus == "view details")
                              ? MyStyles.primary16500
                              : (widget.buttonStatus.toLowerCase() == "pending")
                              ? MyStyles.black6_16500
                              : MyStyles.whiteTitleStyle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
