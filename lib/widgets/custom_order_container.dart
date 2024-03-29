import 'package:dotted_border/dotted_border.dart';
import 'package:evaluator_app/model/response/live/live_cars_list_response.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_toast.dart';

class CustomOrderContainer extends StatelessWidget {
  CustomOrderContainer(
      {this.backgroundBlackOpacity,
      required this.showButton,
      this.button,
      this.buttonText = "",
      this.buttonStatus = "",
      this.dealStatus = "",
      this.onPressed,
      super.key});

  final Widget? button;
  final String dealStatus;
  final Widget? backgroundBlackOpacity;
  final String buttonText;
  final String buttonStatus;
  final Function()? onPressed;
  final bool showButton;

  //button status => completed, pending, view details
  //deal status => timer, deal won, deal lost

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: MyColors.subTitleColor.withOpacity(0.15),
                blurRadius: 15.0)
          ]),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 107,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.fill)),
              ),
              (backgroundBlackOpacity != null)
                  ? backgroundBlackOpacity!
                  : Container(
                      width: double.infinity,
                      height: 107,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -1.00),
                          end: const Alignment(0, 1),
                          colors: [
                            MyColors.black3.withOpacity(0),
                            MyColors.black3.withOpacity(0.7)
                          ],
                        ),
                      ),
                    ),
              (dealStatus.isEmpty ||
                      (["timer", "deal won", "deal lost"]
                              .contains(dealStatus) ==
                          false))
                  ? const SizedBox()
                  : Container(
                      // width: double.infinity,
                      height: 25,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: (dealStatus == "deal won")
                            ? MyColors.green3
                            : MyColors.warning,
                        gradient: (dealStatus == "timer")
                            ? LinearGradient(
                                begin: Alignment(-0.5, 0.00),
                                end: Alignment(2, 0),
                                colors: [MyColors.warning, MyColors.black5],
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            (dealStatus == "timer")
                                ? MySvg.timer
                                : (dealStatus == "deal won")
                                    ? MySvg.dealWon
                                    : MySvg.dealLost,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            (dealStatus == "timer")
                                ? "29min 59sec"
                                : (dealStatus == "deal won")
                                    ? MyStrings.dealWon
                                    : MyStrings.dealLost,
                            style: (dealStatus == "timer")
                                ? MyStyles.white14700
                                : (dealStatus == "deal won")
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
                const Text(
                  "2016 Duster",
                  style: MyStyles.black12400,
                ),
                const Text(
                  "110 PS RXZ 4X2 AMT",
                  style: MyStyles.black14700,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: ''));
                      CustomToast.instance.showMsg('Text copied to clipboard');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy_rounded,
                          size: 16,
                        ),
                        Text(
                          "ID:73423642 ",
                          style: MyStyles.subtitle12400,
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Final: ₹19,99,999",
                  style: MyStyles.primary14700,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 40,
                  // child: showButton ? button : null,
                  child: (buttonStatus.isEmpty ||
                          (["completed", "view details", "pending"]
                                  .contains(buttonStatus) ==
                              false))
                      ? null
                      : DottedBorder(
                          color: (buttonStatus == "pending")
                              ? MyColors.yellow2
                              : Colors.transparent,
                          padding: EdgeInsets.zero,
                          radius: Radius.circular(6),
                          dashPattern: [3, 3],
                          child: CustomElevatedButton(
                            onPressed: (onPressed != null) ? onPressed : () {},
                            buttonStyle: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(2),
                                backgroundColor: (buttonStatus ==
                                        "view details")
                                    ? MyColors.kPrimaryColor.withOpacity(0.1)
                                    : (buttonStatus == "pending")
                                        ? MyColors.yellow.withOpacity(0.5)
                                        : MyColors.green3,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: (buttonStatus == "view details")
                                        ? BorderSide(
                                            color: MyColors.kPrimaryColor)
                                        : BorderSide.none)),
                            buttonColor: (buttonStatus == "view details")
                                ? MyColors.kPrimaryColor.withOpacity(0.3)
                                : (buttonStatus == "pending")
                                    ? MyColors.yellow
                                    : MyColors.green3,
                            buttonText: buttonText,
                            textStyle: (buttonStatus == "view details")
                                ? MyStyles.primary16500
                                : (buttonStatus == "pending")
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
    );
  }
}
