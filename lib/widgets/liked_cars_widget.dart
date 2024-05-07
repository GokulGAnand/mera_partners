import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_svg/svg.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
  late final Rx<bool>? isFavourite = true.obs;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  Rxn<Duration> duration = Rxn();

  LikedCarsWidget({super.key,
    required this.imageUrl,
    required this.status,
    required this.variant,
    required this.model,
    required this.id,
    required this.bidAmount,
    required this.carId, this.bidStartTime, this.bidEndTime,
  });

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.value!.inSeconds == 0) {
        timer.cancel();
      } else {
        duration.value = duration.value! - const Duration(seconds: 1);
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

  /// Like Feature API integration
  void updateLikedCar(bool like) async {
    //todo - change status data
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId').toString());
      log(jsonEncode({"status": like== true?"LikedCar" :"Unlike"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId'),
      headers: globals.jsonHeaders, body: jsonEncode({"status": like== true? "LikedCar" :"Unlike"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('checking: ${bidCarsListViewModel.likeResponse}');
        Get.find<BidCarsListViewModel>().getLikedCarData();
        Get.find<BidCarsListViewModel>().likeResponse.refresh();
        CustomToast.instance.showMsg(MyStrings.success);
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
    var start = DateTime.now();
    var end = bidEndTime ?? DateTime.now();
    Duration diff = end.difference(start);
    duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
    if(start.isBefore(end)) {
      startTimer();
    }
    return SingleChildScrollView(
      child: Container(
        height: 315,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: MyColors.subTitleColor.withOpacity(0.15),
              blurRadius: 15.0,
            )
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 107,
                  child: Image.network(imageUrl,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return SvgPicture.asset(MyImages.loadingCar);
                      }, frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      }, loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SvgPicture.asset(MyImages.loadingCar);
                        }
                      }),
                ),
                Container(
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
                Positioned(
                  top: 10,
                  right: 10,
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
                          isFavourite!.value ? Icons.favorite : Icons.favorite_border,
                          color: isFavourite!.value ? MyColors.red : MyColors.grey,
                          size: 16,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                      status,
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
                  if(status.toLowerCase() == CarStatus.live.name)
                  const Text(
                    MyStrings.highestBid,
                    style: MyStyles.primary12500,
                  ),
                  if(status.toLowerCase() == CarStatus.live.name)
                   SizedBox(height: Dimens.standard_2),
                  if(status.toLowerCase() == CarStatus.live.name)
                  Text(
                    bidAmount,
                    style: MyStyles.primary16500,
                  ),
                  if(status.toLowerCase() == CarStatus.scheduled.name)
                      const Text(
                        MyStrings.yetToStart,
                        style: MyStyles.primary12500,
                      ),
                  if(status.toLowerCase() == CarStatus.scheduled.name)
                    SizedBox(height: Dimens.standard_2),
                  if(status.toLowerCase() == CarStatus.scheduled.name)
                    if(duration.value != null)
                      Obx(() => Row(
                        children: [
                          const Icon(
                            Icons.timer_sharp,
                            color: MyColors.kPrimaryColor,
                            size: 14,
                          ),
                          Text(formatDuration( duration.value! ), style: const TextStyle(
                            color: MyColors.kPrimaryColor,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          )),
                        ],
                      ),),
                   const SizedBox(height: Dimens.standard_8),
                  SizedBox(
                    height: 40,
                    child: CustomElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.carDetailsScreen);
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
      ),
    );
  }
}
