import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/images.dart';
import '../view_model/home/orders/procured_bill_view_model.dart';
import '../view_model/home/orders/rc_transfer_view_model.dart';
import 'custom_toast.dart';

class CustomOrderContainer extends StatefulWidget {
  CustomOrderContainer({super.key, required this.dealStatus, this.backgroundBlackOpacity, required this.buttonText, required this.buttonStatus, required this.carModel, required this.carName, required this.carID, required this.imageURL, required this.finalPrice, this.onPressed, required this.showButton, this.negStartTime, this.negEndTime, this.timerController, required this.uniqueCarID});

  final String dealStatus;
  final Widget? backgroundBlackOpacity;
  final String buttonText;
  final String buttonStatus;
  final String carModel;
  final String carName;
  final String carID;
  final String uniqueCarID;
  final String imageURL;
  final String finalPrice;
  final Function()? onPressed;
  final bool showButton;
  final DateTime? negStartTime;
  final DateTime? negEndTime;
  Rx<int> remainingTime = 0.obs;
  final Rx<CountdownTimerController>? timerController;

  onEnd() {
    if (timerController!.value.isRunning) {
      timerController?.value.disposeTimer();
    }
    if (Get.isRegistered<NegotiationViewModel>()) {
      Get.find<NegotiationViewModel>().getNegotiationCarsData();
      Get.find<NegotiationViewModel>().getLostDeal();
    }
    if (Get.isRegistered<ProcuredScreenViewModel>()) {
      Get.find<ProcuredScreenViewModel>().getProcuredBill();
    }
    if (Get.isRegistered<RcTransferViewModel>()) {
      Get.find<RcTransferViewModel>().getRcTransfer();
    }
  }

  @override
  State<CustomOrderContainer> createState() => _CustomOrderContainerState();
}

class _CustomOrderContainerState extends State<CustomOrderContainer> {
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hour = duration.inHours.toString();
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return "${twoDigitMinutes}min ${twoDigitSeconds}sec";
    } else if (duration.inHours < 10) {
      hour = twoDigits(duration.inHours);
      return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
    }
    return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.timerController?.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.dealStatus == OrderStatus.dealLost.name
          ? null
          : () {
        Get.toNamed(AppRoutes.carDetailsScreen, arguments: widget.uniqueCarID);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: MyColors.subTitleColor.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 6, spreadRadius: 0), BoxShadow(color: MyColors.subTitleColor.withOpacity(0.1), offset: const Offset(0, 10), blurRadius: 15, spreadRadius: 0)],
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 107,
                    alignment: Alignment.bottomCenter,
                    child: Image.network(widget.imageURL, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(MyImages.loadingCar);
                    }, frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    }, loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return SvgPicture.asset(MyImages.loadingCar);
                      }
                    }),
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
                  (widget.dealStatus.isEmpty || (widget.dealStatus == OrderStatus.negotiation.name && widget.buttonText.toLowerCase() == Status.pending.name))
                      ? const SizedBox()
                      : Container(
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: (widget.dealStatus.toLowerCase() != OrderStatus.dealLost.name) ? MyColors.green3 : MyColors.warning,
                            gradient: (widget.dealStatus == OrderStatus.dealLost.name)
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
                                (widget.dealStatus == OrderStatus.negotiation.name)
                                    ? MySvg.timer
                                    : (widget.dealStatus == OrderStatus.procurement.name)
                                        ? MySvg.dealWon
                                        : MySvg.dealLost,
                                width: 18,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              widget.dealStatus == OrderStatus.negotiation.name
                                  ? Obx(
                                      () => CountdownTimer(
                                        controller: widget.timerController?.value,
                                        onEnd: widget.onEnd,
                                        widgetBuilder: (_, CurrentRemainingTime? time) {
                                          if (time == null) {
                                            return const Text('');
                                          }
                                          if (time.min != null) {
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              widget.remainingTime.value = time.min ?? 0;
                                            });
                                          }
                                          return Text(time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',
                                              style: const TextStyle(
                                                color: MyColors.white,
                                                fontSize: 14,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ));
                                        },
                                      ),
                                    )
                                  : Text(
                                      (widget.dealStatus == OrderStatus.procurement.name) ? MyStrings.dealWon : MyStrings.dealLost,
                                      style: (widget.dealStatus == OrderStatus.negotiation.name)
                                          ? MyStyles.white14700
                                          : (widget.dealStatus == OrderStatus.procurement.name)
                                              ? MyStyles.whiteTitleStyle
                                              : MyStyles.whiteTitleStyle,
                                    ),
                            ],
                          ),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.carName,
                      overflow: TextOverflow.ellipsis,
                      style: MyStyles.black12400,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.00),
                    Text(
                      //extra added
                      widget.carModel,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                              MyStrings.id + widget.carID,
                              style: MyStyles.subtitle12400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.dealStatus == OrderStatus.procurement.name || widget.dealStatus == OrderStatus.rcTransfer.name || widget.dealStatus.isEmpty ? MyStrings.yFinal + widget.finalPrice : MyStrings.yBid + widget.finalPrice,
                      style: MyStyles.primary14700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (widget.showButton)
                      SizedBox(
                        height: 40,
                        child: (widget.buttonStatus.isEmpty)
                            ? null
                            : DottedBorder(
                                color: (widget.buttonStatus.toLowerCase() == Status.pending.name) ? MyColors.yellow2 : Colors.transparent,
                                padding: EdgeInsets.zero,
                                radius: const Radius.circular(6),
                                borderType: BorderType.RRect,
                                dashPattern: const [3, 3],
                                child: CustomElevatedButton(
                                  onPressed: (widget.onPressed != null) ? widget.onPressed : () {},
                                  buttonStyle: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(2),
                                    backgroundColor: (widget.buttonStatus.toLowerCase() == Status.view.name)
                                        ? MyColors.kPrimaryColor.withOpacity(0.1)
                                        : (widget.buttonStatus.toLowerCase() == Status.pending.name)
                                            ? MyColors.yellow.withOpacity(0.5)
                                            : MyColors.green3,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: (widget.buttonStatus.toLowerCase() == Status.view.name) ? const BorderSide(color: MyColors.kPrimaryColor) : BorderSide.none,
                                    ),
                                  ),
                                  buttonColor: (widget.buttonStatus.toLowerCase() == Status.view.name)
                                      ? MyColors.kPrimaryColor.withOpacity(0.3)
                                      : (widget.buttonStatus.toLowerCase() == Status.pending.name)
                                          ? MyColors.yellow
                                          : MyColors.green3,
                                  buttonText: widget.buttonText,
                                  textStyle: (widget.buttonStatus.toLowerCase() == Status.view.name)
                                      ? MyStyles.primary16500
                                      : (widget.buttonStatus.toLowerCase() == Status.pending.name)
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
      ),
    );
  }
}
