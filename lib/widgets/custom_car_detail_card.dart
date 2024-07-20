import 'dart:convert';
import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/view_model/document/document_screen_view_model.dart';
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
  final String yearOfManufacture;
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
  final Rx<CountdownTimerController>? timerController;
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
          // content: const Text(
          //   MyStrings.verifyWarning,
          //   style: MyStyles.pageTitleStyle,
          // ),
          actions: [
            if(globals.documentStatus == DocumentStatus.NOTSUBMITTED.name || globals.isDeposited != true)
            TextButton(
              onPressed: () {
                if(Get.isRegistered<DocumentScreenViewModel>()){
                  Get.delete<DocumentScreenViewModel>();
                }
                if (globals.documentStatus == DocumentStatus.NOTSUBMITTED.name) {
                  Get.toNamed(AppRoutes.documentScreen, arguments: 0);
                }else if(globals.isDeposited != true){
                  Get.toNamed(AppRoutes.documentScreen,arguments: 3);
                }
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
    required this.yearOfManufacture,
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
      } else {
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
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
        FocusScope.of(context).requestFocus(FocusNode());
        widget.showPendingDialog();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 8,),
        child: Container(
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
          child: SizedBox(
            width: double.maxFinite,
            height: widget.criticalIssue!.isNotEmpty ? 500 : 480,
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
                      if ((widget.bidAmount.isNotEmpty && widget.isScheduled?.value == false) || widget.bidStatus.value == CarStatus.OTB_SCHEDULED.name)
                        Obx(() =>
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '₹ ',
                                  style: MyStyles.white16700.copyWith(fontFamily: 'Rupee')),
                              TextSpan(text: globals.documentStatus == DocumentStatus.VERIFIED.name?widget.bidAmount.value: widget.bidAmount.value.replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ','),
                              style: MyStyles.white16700,),
                            ],
                          ),
                        ),
                        ),
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    //Text(widget.carModel, style: MyStyles.subTitleBlackStyle),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(widget.yearOfManufacture.substring(widget.yearOfManufacture.length - 4), style: MyStyles.subTitleBlackStyle)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(widget.carModel, style: MyStyles.subTitleBlackStyle)),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    if (widget.criticalIssue!.isNotEmpty && widget.criticalIssue!.toLowerCase().contains('good'))
                      SvgPicture.asset(MyImages.verified)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 4),
                          Text(widget.carVariant, style: MyStyles.black16700),
                        ],
                      ),),
                      Row(
                        children: [
                          Text(
                            '${MyStrings.rating} ',
                            style: TextStyle(
                              color: widget.rating >= 4
                                  ? MyColors.green2
                                  : widget.rating >= 2.5 && widget.rating <= 3.5
                                      ? MyColors.orange
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
                                      ? MyColors.orange
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
                                    ? MyColors.orange
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
                            Text('${Constants.numberFormatter.format(double.parse(widget.kmDriven))} KM', style: MyStyles.regular12),
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
                if (widget.criticalIssue != null && widget.criticalIssue!.isNotEmpty && !widget.criticalIssue!.toLowerCase().contains('good'))
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
                if (widget.criticalIssue != null && widget.criticalIssue!.isNotEmpty)
                  const SizedBox(
                    height: 21,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => CountdownTimer(
                        controller: widget.timerController?.value,
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          if (time == null) {
                            return const Text(MyStrings.paused);
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.isScheduled?.value == true ? MyStrings.yetToStart : (time.hours != null && time.hours != 0) ? MyStrings.acceptingBids : (time.min ?? 0) <= 2 ? MyStrings.lastCall : (time.min ?? 0) >= 10 ? MyStrings.acceptingBids:
                                (time.min ?? 0) <= 10 ? MyStrings.bidEndsIn : MyStrings.lastCall,
                                style: TextStyle(
                                  color: widget.isScheduled?.value == true ? MyColors.kPrimaryColor : (time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red,
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Row(
                                children: [
                                  if(time.min != 0 && widget.timerController?.value != null)
                                    Icon(
                                      Icons.timer_sharp,
                                      color: widget.isScheduled!.value ? MyColors.kPrimaryColor : (time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red,
                                      size: 14,
                                    ),
                                  Text((time.hours != null && time.days != null) ? '${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
                                    color: widget.isScheduled!.value ? MyColors.kPrimaryColor : (time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ))
                                ],
                              ),
                            ],
                          );
                        },
                      ),),
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
                                    TextSpan(text: "₹",
                                    style: MyStyles.grey14700.copyWith(fontFamily: 'Rupee')),
                                    TextSpan(text: globals.documentStatus == DocumentStatus.VERIFIED.name ? Constants.numberFormat.format(double.parse(widget.fmv)) : '${widget.fmv.replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}', 
                                    style: MyStyles.grey14700),
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
                                    FocusScope.of(context).requestFocus(FocusNode());
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
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    widget.showPendingDialog();
                                  },
                            buttonText: MyStrings.bid),
                      ],
                    ),
                  ),
                if (widget.isOtb?.value == true && widget.isScheduled?.value == false)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: CustomElevatedButton(
                        buttonHeight: Dimens.defHeight,
                        onPressed: globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name
                            ? widget.otbTapped
                            : () {
                                FocusScope.of(context).requestFocus(FocusNode());
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