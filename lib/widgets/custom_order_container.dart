import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/images.dart';
import '../view_model/home/orders/procured_bill_view_model.dart';
import '../view_model/home/orders/rc_transfer_view_model.dart';
import 'custom_toast.dart';

class CustomOrderContainer extends StatefulWidget {
  CustomOrderContainer({super.key, required this.dealStatus, this.backgroundBlackOpacity, required this.buttonText, required this.buttonStatus, required this.carModel, required this.carName, required this.carID, required this.imageURL, required this.finalPrice, this.onPressed, required this.showButton, this.negStartTime, this.negEndTime});

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
        if (Get.isRegistered<NegotiationViewModel>()) {
          Get.find<NegotiationViewModel>().getNegotiationCarsData();
          Get.find<NegotiationViewModel>().getLostDeal();
        }
        if(Get.isRegistered<ProcuredScreenViewModel>()){
          Get.find<ProcuredScreenViewModel>().getProcuredBill();
        }
        if(Get.isRegistered<RcTransferViewModel>()){
          Get.find<RcTransferViewModel>().getRcTransfer();
        }
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: MyColors.subTitleColor.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 0
            ),BoxShadow(
                color: MyColors.subTitleColor.withOpacity(0.1),
                offset: const Offset(0, 10),
                blurRadius: 15,
                spreadRadius: 0
            )
          ],
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
                    child: Image.network(widget.imageURL,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(MyImages.loadingCar);
                        }, frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          return child;
                        }, loadingBuilder:
                            (context, child, loadingProgress) {
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
                  (widget.dealStatus.isEmpty)
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
                        widget.dealStatus == OrderStatus.negotiation.name?
                        Obx(() => Text(
                          (widget.dealStatus == OrderStatus.negotiation.name)
                              ?  formatDuration( widget.duration.value! )
                              : (widget.dealStatus == OrderStatus.procurement.name)
                              ? MyStrings.dealWon
                              : MyStrings.dealLost,
                          style: (widget.dealStatus == OrderStatus.negotiation.name)
                              ? MyStyles.white14700
                              : (widget.dealStatus == OrderStatus.procurement.name)
                              ? MyStyles.whiteTitleStyle
                              : MyStyles.whiteTitleStyle,
                        ),) :  Text(
                          (widget.dealStatus == OrderStatus.negotiation.name)
                              ?  formatDuration( widget.duration.value! )
                              : (widget.dealStatus == OrderStatus.procurement.name)
                              ? MyStrings.dealWon
                              : MyStrings.dealLost,
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.carName,
                      style: MyStyles.black12400,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.00),
                    Text(
                      //extra added
                      widget.carModel,
                      overflow:TextOverflow.ellipsis ,
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
                              MyStrings.id+widget.carID,
                              style: MyStyles.subtitle12400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.dealStatus == OrderStatus.procurement.name || widget.dealStatus == OrderStatus.rcTransfer.name || widget.dealStatus.isEmpty
                          ?   MyStrings.yFinal+widget.finalPrice
                          : MyStrings.yBid+widget.finalPrice,
                      style: MyStyles.primary14700,
                    ),
                    const SizedBox(
                      height: 12,
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
