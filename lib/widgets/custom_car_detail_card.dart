import 'dart:convert';
import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/widgets/custom_slider.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../service/endpoints.dart';
import '../utils/enum.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../utils/svg.dart';
import '../view_model/home/live/live_cars_list_view_model.dart';
import '../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import 'custom_button.dart';
import 'package:http/http.dart' as http;

/// ignore: must_be_immutable
class CustomCarDetailCard extends StatefulWidget {
  final String imageUrl;
  final List<String> images;
  final String carLocation;
  final RxString bidStatus;
  final RxString bidAmount;
  final Color statusColor;
  final String carModel;
  final String carVariant;
  final num rating;
  final String fuelType;
  final String? criticalIssue;
  final String id;
  final String carId;
  final String fmv;
  final String kmDriven;
  final String ownerShip;
  final String transmission;
  final Rx<bool>? isFavourite;
  final RxBool? isOtb;
  RxBool? isScheduled = false.obs;
  final Function()? autoBid;
  final Function()? bid;
  final Function()? otbTapped;
  final Function() onCarTapped;
  Rx<PageController> pageController = PageController(initialPage: 0, viewportFraction: 0.85).obs;
  var activePage = 0.obs;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  final Rx<int>? endTime;
  Rx<int> auctionTime = 0.obs;
  final Rx<CountdownTimerController>? timerController;
  // Rxn<Duration> duration = Rxn();
  // Timer? timer;
  final String? scheduleTime;

  onEnd(){
    if(timerController!.value.isRunning){
      timerController?.value.disposeTimer();
    }
  }

  showPendingDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            MyStrings.verifyPending,
            style: MyStyles.black20700,
          ),
          content: const Text(
            MyStrings.verifyWarning,
            style: MyStyles.pageTitleStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.documentScreen);
              },
              child: Text(MyStrings.cont.toUpperCase()),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                MyStrings.cancel.toUpperCase(),
                style: const TextStyle(color: MyColors.grey),
              ),
            ),
          ],
        );
      },
    );
  }

  CustomCarDetailCard({
    super.key,
    required this.imageUrl,
    required this.carLocation,
    required this.bidStatus,
    required this.bidAmount,
    required this.carModel,
    required this.carVariant,
    required this.rating,
    required this.fuelType,
    this.criticalIssue,
    required this.id,
    required this.fmv,
    required this.kmDriven,
    required this.ownerShip,
    required this.transmission,
    required this.images,
    this.autoBid,
    this.bid,
    this.isOtb,
    this.otbTapped,
    this.isScheduled,
    required this.onCarTapped,
    this.bidStartTime,
    this.bidEndTime,
    this.isFavourite,
    required this.statusColor, required this.carId, this.endTime, this.timerController, this.scheduleTime,

  });

  @override
  State<CustomCarDetailCard> createState() => _CustomCarDetailCardState();
}

class _CustomCarDetailCardState extends State<CustomCarDetailCard> {

  // void startTimer() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (widget.duration.value!.inSeconds == 0) {
  //       timer.cancel();
  //     } else {
  //       widget.duration.value = widget.duration.value! - const Duration(seconds: 1);
  //     }
  //   });
  // }
  //
  // String formatDuration(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, '0');
  //   String hour = duration.inHours.toString();
  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   if(duration.inHours == 0){
  //     return "${twoDigitMinutes}min ${twoDigitSeconds}sec";
  //   } else if (duration.inHours < 10){
  //     hour = twoDigits(duration.inHours);
  //     return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
  //   }
  //   return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
  // }

  @override
  void initState() {
    // var start = DateTime.now();
    // var end = widget.bidEndTime ?? DateTime.now();
    // if (widget.isScheduled?.value == false) {
    //   Duration diff = end.difference(start);
    //   widget.duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    //
    //   if(start.isBefore(end)) {
    //     startTimer();
    //   }
    // }else{
    //   Duration diff = widget.bidStartTime!.difference(start);
    //   widget.duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    //
    //   if(start.isAfter(widget.bidStartTime!)) {
    //     startTimer();
    //   }
    // }
    super.initState();
  }

  @override
  void dispose() {
    widget.timerController!.value.dispose();
    super.dispose();
  }

  /// Like Feature API integration
  void updateLikedCar(bool like) async {
    try {
      // ProgressBar.instance.showProgressbar(Get.context!);
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/${widget.carId}').toString());
      log(jsonEncode({"status": like ==true ?"LikedCar":"Unlike"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/${widget.carId}'),
      headers: globals.jsonHeaders, body: jsonEncode({"status": like==true?"LikedCar":"Unlike"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        if (Get.isRegistered<BidCarsListViewModel>()) {
          Get.find<BidCarsListViewModel>().getLikedCarData();
        }
        if (Get.isRegistered<LiveCarsListViewModel>()) {
          Get.find<LiveCarsListViewModel>().getLikedCarData();
        }
        // ProgressBar.instance.stopProgressBar(Get.context!);
          //CustomToast.instance.showMsg(MyStrings.success);
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>GestureDetector(
      onTap: globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name
          ? widget.onCarTapped
          : () {
        widget.showPendingDialog();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 8,),
        child: Container(
          // elevation: 5,
          // color: MyColors.white,
          // surfaceTintColor: MyColors.white,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: MyColors.white1,
              boxShadow: const [
                BoxShadow(
                  color: MyColors.greyShadow,
                  blurRadius: 8,
                  offset: Offset(0, 3.5),
                  spreadRadius: 0,
                )
              ],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8)),
          // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          child: SizedBox(
            width: double.maxFinite,
            height: 480,
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onHorizontalDragStart: (details) {
                        widget.activePage++;
                        widget.pageController.value.animateTo(
                          widget.activePage.toDouble(),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,);
                      },
                      child: CustomSlider(
                        sliderImage: widget.images,
                        pageSliderController: widget.pageController,
                        activePage: widget.activePage,
                        showBlackOpacity: true,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 10,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.location,
                          ),
                          Text(widget.carLocation, style: MyStyles.white11400),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        width: 39,
                        height: 39,
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(color: Colors.white, shape: OvalBorder(), shadows: [
                          BoxShadow(
                            color: MyColors.greyShadow,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 2,
                          )
                        ]),
                        child: Obx(
                          () => GestureDetector(
                            child: Icon(
                              widget.isFavourite!.value ? Icons.favorite : Icons.favorite_border,
                              color: widget.isFavourite!.value ? MyColors.red : MyColors.grey,
                              size: 23,
                            ),
                            onTap: () {
                              log("Tapping like button2");
                              updateLikedCar(widget.isFavourite!.value ? false : true);
                              widget.isFavourite!.value == true ? widget.isFavourite!.value = false : widget.isFavourite!.value = true;
                              log("Like status2: ${widget.isFavourite!.value}");
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => Container(
                  height: 37,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: const Alignment(2.00, 0.00),
                      begin: const Alignment(-1, 0),
                      colors: [widget.statusColor, MyColors.black5],
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Obx(() =>Text(widget.isOtb?.value == true ? MyStrings.closingPrice : widget.bidStatus.value, style: MyStyles.whiteTitleStyle)),
                      const SizedBox(
                        width: 15,
                      ),
                      if(widget.bidStatus.value == MyStrings.youAreLeading)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                          child: SvgPicture.asset(MySvg.arrowUp, width: 14,),
                        ),
                      if(widget.bidStatus.value == MyStrings.youAreLoosing)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                          child: SvgPicture.asset(MySvg.arrowDown, width: 14,),
                        ),
                      if (widget.bidAmount.isNotEmpty && widget.isScheduled?.value == false)
                        Obx(() =>Text(globals.documentStatus == DocumentStatus.VERIFIED.name?widget.bidAmount.value: widget.bidAmount.value.replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ','), textAlign: TextAlign.center, style: MyStyles.white16700)),
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: Text(widget.carModel, style: MyStyles.subTitleBlackStyle)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //Text(widget.carModel, style: MyStyles.subTitleBlackStyle),
                              const SizedBox(
                                width: 2,
                              ),
                              if (widget.criticalIssue?.toLowerCase() == 'good') SvgPicture.asset(MyImages.verified)
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(widget.carVariant, style: MyStyles.black16700),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${MyStrings.rating} ',
                            style: TextStyle(
                              color: widget.rating >= 4
                                  ? MyColors.green2
                                  : widget.rating >= 2.5 && widget.rating <= 3.5
                                      ? MyColors.yellow
                                      : MyColors.red,
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            widget.rating.toString(),
                            style: TextStyle(
                              color: widget.rating >= 4
                                  ? MyColors.green2
                                  : widget.rating >= 2.5 && widget.rating <= 3.5
                                      ? MyColors.yellow
                                      : MyColors.red,
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            width: 1.5,
                          ),
                          Icon(
                            Icons.star,
                            color: widget.rating >= 4
                                ? MyColors.green2
                                : widget.rating >= 2.5 && widget.rating <= 3.5
                                    ? MyColors.yellow
                                    : MyColors.red,
                            size: Dimens.iconSizeS,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: const BoxDecoration(color: MyColors.lightBlue),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.fuelType, style: MyStyles.regular12),
                            const SizedBox(width: 6),                            const Text('|', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                             Text('${formatKmDriven(widget.kmDriven)} KM', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            const Text('|', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            Text('${widget.ownerShip} Owner', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            if (widget.transmission.isNotEmpty) const Text('|', style: MyStyles.regular12),
                            if (widget.transmission.isNotEmpty) const SizedBox(width: 6),
                            Text(widget.transmission, style: MyStyles.regular12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                if (widget.criticalIssue != null && widget.criticalIssue?.toLowerCase() != 'good')
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning,
                          color: MyColors.red,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(widget.criticalIssue ?? '', style: MyStyles.red12700),
                      ],
                    ),
                  ),
                if (widget.criticalIssue != null)
                  const SizedBox(
                    height: 21,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(widget.auctionTime.value != 0 && widget.timerController?.value != null)
                          Obx(() => Text(
                            widget.isScheduled?.value == true ? MyStrings.yetToStart : widget.auctionTime.value >= 10 ? MyStrings.acceptingBids:
                            widget.auctionTime.value <= 10 ? MyStrings.bidEndsIn : MyStrings.lastCall,
                            style: TextStyle(
                              color: widget.isScheduled?.value == true ? MyColors.kPrimaryColor : widget.auctionTime.value >= 10 ? MyColors.green2 : widget.auctionTime.value < 10 ? MyColors.orange : MyColors.red,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),),
                          const SizedBox(
                            height: 1,
                          ),
                          Obx(() => Row(
                            children: [
                              if(widget.auctionTime.value != 0 && widget.timerController?.value != null)
                              Icon(
                                Icons.timer_sharp,
                                color: widget.isScheduled!.value ? MyColors.kPrimaryColor : widget.auctionTime.value >= 10 ? MyColors.green2 : widget.auctionTime.value < 10 ? MyColors.orange : MyColors.red,
                                size: 14,
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
                                  return Text((time.hours != null && time.days != null) ? '${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
                                    color: widget.isScheduled!.value ? MyColors.kPrimaryColor : widget.auctionTime.value >= 10 ? MyColors.green2 : widget.auctionTime.value < 10 ? MyColors.orange : MyColors.red,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ));
                                },
                              ),)
                              // Text(formatDuration( widget.duration.value! ), style: TextStyle(
                              //   color: widget.isScheduled!.value ? MyColors.kPrimaryColor : widget.duration.value!.inMinutes >= 10 ? MyColors.green : widget.duration.value!.inMinutes < 10 ? MyColors.orange : MyColors.red,
                              //   fontSize: 14,
                              //   fontFamily: 'DM Sans',
                              //   fontWeight: FontWeight.w700,
                              //   height: 0,
                              // )),
                            ],
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                            //height: MediaQuery.of(context).size.height*0.038,
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Icon(
                                    Icons.copy,
                                    color: MyColors.black,
                                    size: Dimens.iconSizeS,
                                  ),
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: widget.id));
                                    CustomToast.instance.showMsg('Text copied to clipboard');
                                  },
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('ID:${widget.id}', style: MyStyles.black12400),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(MyImages.carTag),
                              const SizedBox(
                                width: 4,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'Fair Value ', style: MyStyles.subTitleGreayStyle),
                                    TextSpan(text: globals.documentStatus == DocumentStatus.VERIFIED.name ? '₹${widget.fmv}' : '₹${widget.fmv.replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}', style: MyStyles.grey14700),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if ((widget.isOtb == null || widget.isOtb?.value != true) && widget.isScheduled?.value == false)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            buttonWidth: MediaQuery.of(context).size.width * 0.38,
                            buttonHeight: Dimens.defHeight,
                            textColor: MyColors.kPrimaryColor,
                            buttonStyle: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: MyColors.kPrimaryColor,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name ? widget.autoBid : () {
                                    widget.showPendingDialog();
                                  },
                            buttonText: MyStrings.autoBid),
                        CustomElevatedButton(
                            buttonWidth: MediaQuery.of(context).size.width * 0.38,
                            buttonHeight: Dimens.defHeight,
                            onPressed: /*widget.bid,*/
                            globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name
                                ? widget.bid
                                : () {
                                    widget.showPendingDialog();
                                  },
                            buttonText: MyStrings.bid),
                      ],
                    ),
                  ),
                if (widget.isOtb?.value == true)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: CustomElevatedButton(
                        buttonHeight: Dimens.defHeight,
                        onPressed: globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name
                            ? widget.otbTapped
                            : () {
                                widget.showPendingDialog();
                              },
                        buttonText: MyStrings.oneTouchBuy),
                  ),
                if (widget.isScheduled?.value == true)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: DottedBorder(
                      color: MyColors.kPrimaryColor,
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(6),
                      child: CustomElevatedButton(
                          buttonHeight: Dimens.defHeight,
                          textColor: MyColors.kPrimaryColor,
                          buttonStyle: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(),
                            disabledBackgroundColor: MyColors.lightBlue,
                          ),
                          onPressed: null,
                          buttonText: widget.scheduleTime ?? 'Scheduled'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  String formatKmDriven(String kmDrivenString) {
    int kmDriven = int.parse(kmDrivenString);
    if(kmDriven >= 10000) {
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else if (kmDriven >= 100000){
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else if (kmDriven >= 1000){
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else {
      return '$kmDriven';
    }
  }

}