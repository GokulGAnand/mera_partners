import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../service/endpoints.dart';
import '../service/exception_error_util.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import 'custom_button.dart';
import 'custom_countdown_timer.dart';
import 'custom_toast.dart';

/// ignore: must_be_immutable
class LikedCarsWidget extends StatelessWidget {
  final BidCarsListViewModel bidCarsListViewModel = Get.find<BidCarsListViewModel>();
  final String imageUrl;
  final String status;
  final String variant;
  final String model;
  final String id;
  final String carId;
  final String bidAmount;
  final String otbPrice;
  late final Rx<bool>? isFavourite = true.obs;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  Rxn<Duration> duration = Rxn();
  final Rx<CountdownTimerController>? timerController;

  onEnd() {
    if (timerController!.value.isRunning) {
      timerController?.value.disposeTimer();
    }
  }

  LikedCarsWidget({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.variant,
    required this.model,
    required this.id,
    required this.bidAmount,
    required this.carId,
    this.bidStartTime,
    this.bidEndTime,
    this.timerController,
    required this.otbPrice,
  });

  /// Like Feature API integration
  void updateLikedCar(bool like) async {
    try {
      var response = await ApiManager.patch(endpoint: EndPoints.status + carId, body: {"status": like == true ? "LikedCar" : "Unlike"});
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('checking: ${bidCarsListViewModel.likeResponse}');
        Get.find<BidCarsListViewModel>().getLikedCarData(1);
        Get.find<BidCarsListViewModel>().likeResponse.refresh();
        //CustomToast.instance.showMsg(MyStrings.success);
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: MyColors.subTitleColor.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 6, spreadRadius: 0), BoxShadow(color: MyColors.subTitleColor.withOpacity(0.1), offset: const Offset(0, 10), blurRadius: 15, spreadRadius: 0)],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height < 900 ? MediaQuery.of(context).size.height * 0.12 : 107,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return SvgPicture.asset(MyImages.loadingCar);
                    },
                    placeholder: (context, url) {
                      return SvgPicture.asset(MyImages.loadingCar);
                    },),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height < 900 ? MediaQuery.of(context).size.height * 0.12 : 107,
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
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 28,
                  height: 28,
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
                        isFavourite!.value ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite!.value ? MyColors.red : MyColors.grey,
                        size: 18,
                      ),
                      onTap: () {
                        log("Tapping like button");
                        updateLikedCar(isFavourite!.value ? false : true);
                        isFavourite!.value == true ? isFavourite!.value = false : isFavourite!.value = true;
                        log("Like status: ${isFavourite!.value}");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.standard_8),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8.0,
              0,
              8.0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 17,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: status.toLowerCase() == CarStatus.live.name ? MyColors.green3 : MyColors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status.toLowerCase() == CarStatus.live.name || status.toLowerCase() == CarStatus.scheduled.name || status.toLowerCase() == CarStatus.otb.name || status == CarStatus.OTB_SCHEDULED.name ? status : MyStrings.bidClosed,
                    style: MyStyles.white12500,
                  ),
                ),
                const SizedBox(height: Dimens.standard_8),
                Text(
                  variant,
                  style: MyStyles.black12400,
                ),
                // const SizedBox(height: Dimens.standard_8),
                Text(
                  model,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: MyStyles.black14700,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: id));
                      CustomToast.instance.showMsg('Text copied to clipboard');
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.copy_rounded,
                          size: 16,
                        ),
                        Text(
                          "ID: $id",
                          style: MyStyles.subtitle12400,
                        ),
                      ],
                    ),
                  ),
                ),
                if (status.toLowerCase() == CarStatus.live.name || (status.toLowerCase() != CarStatus.scheduled.name && status.toLowerCase() != CarStatus.otb.name && status != CarStatus.OTB_SCHEDULED.name))
                  const Text(
                    MyStrings.highestBid,
                    style: MyStyles.primary12500,
                  ),
                if (status.toLowerCase() == CarStatus.live.name || (status.toLowerCase() != CarStatus.scheduled.name && status.toLowerCase() != CarStatus.otb.name && status != CarStatus.OTB_SCHEDULED.name)) SizedBox(height: Dimens.standard_2),
                if (status.toLowerCase() == CarStatus.live.name || (status.toLowerCase() != CarStatus.scheduled.name && status.toLowerCase() != CarStatus.otb.name && status != CarStatus.OTB_SCHEDULED.name))
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '₹ ', style: MyStyles.primary16500.copyWith(fontFamily: 'Rupee')),
                        TextSpan(
                          text: bidAmount,
                          style: MyStyles.primary16500,
                        ),
                      ],
                    ),
                  ),

                ///OTB
                if (status.toLowerCase() == CarStatus.otb.name || status == CarStatus.OTB_SCHEDULED.name)
                  const Text(
                    MyStrings.closingPrice,
                    style: MyStyles.primary12500,
                  ),
                if (status.toLowerCase() == CarStatus.otb.name || status == CarStatus.OTB_SCHEDULED.name) SizedBox(height: Dimens.standard_2),
                if (status.toLowerCase() == CarStatus.otb.name || status == CarStatus.OTB_SCHEDULED.name)
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '₹ ', style: MyStyles.primary16500.copyWith(fontFamily: 'Rupee')),
                        TextSpan(
                          text: otbPrice,
                          style: MyStyles.primary16500,
                        ),
                      ],
                    ),
                  ),
                if (status.toLowerCase() == CarStatus.scheduled.name) //schedule & otb timer
                  const Text(
                    MyStrings.yetToStart,
                    style: MyStyles.primary12500,
                  ),
                if (status.toLowerCase() == CarStatus.scheduled.name) SizedBox(height: Dimens.standard_2),
                if (status.toLowerCase() == CarStatus.scheduled.name)
                  Obx(() => CustomCountdownTimer(
                    timerController: timerController!.value,
                    isScheduled: true,
                  ),),
                const SizedBox(height: Dimens.standard_8),
                SizedBox(
                  height: 40,
                  child: CustomElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Get.toNamed(AppRoutes.carDetailsScreen, arguments: carId);
                    },
                    buttonStyle: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(2),
                      backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(color: MyColors.kPrimaryColor),
                      ),
                    ),
                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                    buttonText: MyStrings.viewDetail,
                    textStyle: MyStyles.primary14500,
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
