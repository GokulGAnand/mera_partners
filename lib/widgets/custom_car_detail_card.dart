import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
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
  late final Rx<bool>? isFavourite = false.obs;
  final bool? isOtb;
  final bool? isScheduled;
  final Function()? autoBid;
  final Function()? bid;
  final Function()? otbTapped;
  final Function() onCarTapped;
  Rx<PageController> pageController = PageController(initialPage: 0, viewportFraction: 0.85).obs;
  var activePage = 0.obs;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  Duration duration = Duration.zero;
  Timer? timer;

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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
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
    this.isScheduled = false,
    required this.onCarTapped,
    this.bidStartTime,
    this.bidEndTime,
    required this.statusColor, required this.carId,
  });

  @override
  State<CustomCarDetailCard> createState() => _CustomCarDetailCardState();
}

class _CustomCarDetailCardState extends State<CustomCarDetailCard> {

  void startTimer() {
    widget.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          widget.duration = widget.duration - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void initState() {
    widget.duration = const Duration(minutes: 20);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Like Feature API integration
  void updateLikedCar() async {
    try {
      // ProgressBar.instance.showProgressbar(Get.context!);
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/${widget.carId}').toString());
      log(jsonEncode({"status":"LikedCar"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/${widget.carId}'),headers: globals.headers, body: jsonEncode({"status":"LikedCar"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(MyStrings.success);
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
      onTap: widget.onCarTapped,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 58.0, top: 8),
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
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomSlider(
                      sliderImage: widget.images,
                      pageSliderController: widget.pageController,
                      activePage: widget.activePage,
                      showBlackOpacity: true,
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
                        width: 23,
                        height: 23,
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
                              size: 16,
                            ),
                            onTap: () {
                              updateLikedCar();
                              widget.isFavourite!.value == true ? widget.isFavourite!.value = false : widget.isFavourite!.value = true;

                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
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
                      Obx(() =>Text(widget.isOtb == true ? MyStrings.closingPrice : widget.bidStatus.value, style: MyStyles.whiteTitleStyle)),
                      const SizedBox(
                        width: 15,
                      ),
                      if (widget.bidAmount.isNotEmpty && widget.isScheduled == false) Obx(() =>Text(widget.bidAmount.value, textAlign: TextAlign.center, style: MyStyles.white16700)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                              Text(widget.carModel, style: MyStyles.subTitleBlackStyle),
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
                            const SizedBox(width: 6),
                            const Text('|', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            Text('${widget.kmDriven} KM', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            const Text('|', style: MyStyles.regular12),
                            const SizedBox(width: 6),
                            Text(widget.ownerShip, style: MyStyles.regular12),
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
                          Text(
                            widget.duration.inMinutes >= 10 ? MyStrings.acceptingBids:
                            widget.duration.inMinutes < 10 ? MyStrings.bidEndsIn : MyStrings.lastCall,
                            style: TextStyle(
                              color: widget.duration.inMinutes >= 10 ? MyColors.green : widget.duration.inMinutes < 10 ? MyColors.orange : MyColors.red,
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
                              Icon(
                                Icons.timer_sharp,
                                color: widget.duration.inMinutes >= 10 ? MyColors.green : widget.duration.inMinutes < 10 ? MyColors.orange : MyColors.red,
                                size: 14,
                              ),
                              Text( widget._formatDuration( widget.duration ), style: TextStyle(
                                color: widget.duration.inMinutes >= 10 ? MyColors.green : widget.duration.inMinutes < 10 ? MyColors.orange : MyColors.red,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 14,
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
                                    const TextSpan(text: 'FMV  ', style: MyStyles.subTitleGreayStyle),
                                    TextSpan(text: '₹${widget.fmv}', style: MyStyles.grey14700),
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
                if ((widget.isOtb == null || widget.isOtb != true) && widget.isScheduled == false)
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
                            onPressed: widget.autoBid,/*globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name ? widget.autoBid : () {
                                    widget.showPendingDialog();
                                  },*/
                            buttonText: MyStrings.autoBid),
                        CustomElevatedButton(
                            buttonWidth: MediaQuery.of(context).size.width * 0.38,
                            buttonHeight: Dimens.defHeight,
                            onPressed: widget.bid,
                            /*globals.documentStatus?.toUpperCase() == DocumentStatus.VERIFIED.name
                                ? bid
                                : () {
                                    showPendingDialog();
                                  },*/
                            buttonText: MyStrings.bid),
                      ],
                    ),
                  ),
                if (widget.isOtb == true)
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
                if (widget.isScheduled == true)
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
                          buttonText: 'Scheduled for tomorrow, 6:00 PM'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}