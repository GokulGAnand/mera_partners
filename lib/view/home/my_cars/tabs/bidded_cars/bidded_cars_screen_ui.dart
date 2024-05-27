import 'dart:developer';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import 'package:mera_partners/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/widgets/custom_car_detail_card.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/colors.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../../../../utils/enum.dart';
import '../../../../../widgets/custom_toast.dart';

/// ignore: must_be_immutable
class BidCarsListScreen extends StatelessWidget {
  BidCarsListScreen({super.key});

  BidCarsListViewModel controller = Get.isRegistered<BidCarsListViewModel>() ? Get.find<BidCarsListViewModel>() : Get.put(BidCarsListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.bidCarsResponse.value.data != null
              ? ((controller.bidCarsearchList.isNotEmpty || (controller.bidCarsearchList.isEmpty && controller.bidCarsearchController.text.isEmpty)) && controller.bidCarsResponse.value.data![0].biddedCars!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: controller.bidCarsResponse.value.data![0].biddedCars?.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          if (((controller.bidCarsearchController.value.text.isEmpty && controller.bidCarsearchList.isEmpty) || controller.bidCarsearchList.contains(controller.bidCarsResponse.value.data?[index].sId)) && controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() == CarStatus.live.name) {
                            return CustomCarDetailCard(
                              onCarTapped: () {
                                Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.bidCarsResponse.value.data?[0].biddedCars![index].sId);
                              },
                              isOtb: false.obs,
                              criticalIssue: controller.bidCarsResponse.value.data?[0].biddedCars![index].carCondition ?? '',
                              isFavourite: controller.likeResponse.value.data?[0].likedCars != null && (controller.likeResponse.value.data![0].likedCars!.isNotEmpty)
                                  ? controller.likeResponse.value.data![0].likedCars!.any((element) => element.sId == controller.bidCarsResponse.value.data?[0].biddedCars![index].sId)
                                      ? true.obs
                                      : false.obs
                                  : false.obs,
                              carId: controller.bidCarsResponse.value.data?[0].biddedCars?[index].sId ?? '',
                              scheduleTime: Constants.getScheduledStatus(DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidStartTime ?? DateTime.now().toString()).toLocal()),
                              isScheduled: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() == 'scheduled' ? true.obs : false.obs,
                              imageUrl: controller.bidCarsResponse.value.data?[0].biddedCars![index].rearRight?.url ?? '',
                              carLocation: controller.bidCarsResponse.value.data?[0].biddedCars![index].vehicleLocation ?? '',
                              bidStatus: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? RxString(MyStrings.scheduledBid)
                                  : globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!)
                                      ? RxString(MyStrings.youAreLeading)
                                      : globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && !controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data?[0].biddedCars![index].leaderBoard != null && controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                                          ? RxString(MyStrings.youAreLoosing)
                                          : RxString(MyStrings.highestBid),
                              statusColor: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? MyColors.black
                                  : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!))
                                      ? MyColors.green
                                      : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].leaderBoard != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && !controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                                          ? MyColors.red
                                          : MyColors.kPrimaryColor,
                              bidAmount: Constants.numberFormat.format(controller.bidCarsResponse.value.data?[0].biddedCars![index].highestBid).toString().obs,
                              bidStartTime: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidStartTime ?? DateTime.now().toString()).toLocal(),
                              bidEndTime: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidEndTime ?? DateTime.now().toString()).toLocal(),
                              endTime: Rx(Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds),
                              timerController: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                              carModel: controller.bidCarsResponse.value.data?[0].biddedCars![index].model ?? '',
                              carVariant: controller.bidCarsResponse.value.data?[0].biddedCars![index].variant ?? '',
                              rating: (((controller.bidCarsResponse.value.data?[0].biddedCars![index].engineStar ?? 0) + (controller.bidCarsResponse.value.data?[0].biddedCars![index].exteriorStar ?? 0) + (controller.bidCarsResponse.value.data?[0].biddedCars![index].interiorAndElectricalStar ?? 0) + (controller.bidCarsResponse.value.data?[0].biddedCars![index].testDriveStar ?? 0)) / 4).roundToDouble(),
                              fuelType: controller.bidCarsResponse.value.data?[0].biddedCars![index].fuelType ?? '',
                              id: controller.bidCarsResponse.value.data?[0].biddedCars![index].uniqueId.toString() ?? '',
                              fmv: controller.bidCarsResponse.value.data?[0].biddedCars![index].realValue != null ? controller.bidCarsResponse.value.data![0].biddedCars![index].realValue.toString() : '0',
                              kmDriven: controller.bidCarsResponse.value.data?[0].biddedCars![index].odometerReading != null ? controller.bidCarsResponse.value.data![0].biddedCars![index].odometerReading.toString() : '0',
                              ownerShip: controller.bidCarsResponse.value.data?[0].biddedCars![index].ownershipNumber ?? '',
                              transmission: controller.bidCarsResponse.value.data?[0].biddedCars![index].transmission ?? '',
                              images: [
                                controller.bidCarsResponse.value.data?[0].biddedCars![index].frontLeft?.url ?? '',
                                controller.bidCarsResponse.value.data?[0].biddedCars![index].front?.url ?? '',
                                controller.bidCarsResponse.value.data?[0].biddedCars![index].frontRight?.url ?? '',
                                controller.bidCarsResponse.value.data?[0].biddedCars![index].rear?.url ?? '',
                                controller.bidCarsResponse.value.data?[0].biddedCars![index].engineCompartment?.url ?? '',
                              ],
                              autoBid: () {
                                controller.autoBidController.value.clear();
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return CustomBidBottomSheet(
                                        timerController: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                                        amountController: controller.autoBidController,
                                        isAutoBid: true,
                                        bidValue: RxInt(controller.bidCarsResponse.value.data?[0].biddedCars![index].highestBid ?? 0),
                                        stepRate: controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 99999
                                            ? RxInt(2000)
                                            : (controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 299999)
                                                ? RxInt(4000)
                                                : (controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 499999)
                                                    ? RxInt(7000)
                                                    : RxInt(10000),
                                        onAutoBidPressed: () {
                                          try {
                                            if(globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.isAutobid == true && (int.tryParse(controller.autoBidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                              CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                            }else{
                                              controller.placeAutoBid(controller.autoBidController.value.text, controller.bidCarsResponse.value.data?[0].biddedCars![index].sId);
                                              Navigator.of(context).pop();
                                            }
                                          } catch (e) {
                                            log(e.toString());
                                          }
                                        },
                                      );
                                    });
                              },
                              bid: () {
                                controller.bidController.value.clear();
                                showModalBottomSheet(
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return CustomBidBottomSheet(
                                        timerController: controller.bidCarsResponse.value.data?[0].biddedCars![index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data?[0].biddedCars![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                                        amountController: controller.bidController,
                                        bidValue: RxInt(controller.bidCarsResponse.value.data?[0].biddedCars![index].highestBid ?? 0),
                                        stepRate: controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 99999
                                            ? RxInt(2000)
                                            : (controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 299999)
                                                ? RxInt(4000)
                                                : (controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![0].biddedCars![index].highestBid! <= 499999)
                                                    ? RxInt(7000)
                                                    : RxInt(10000),
                                        onBidPressed: () {
                                          try {
                                            if(globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[0].biddedCars![index].winner != null && controller.bidCarsResponse.value.data![0].biddedCars![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.isAutobid == true && (int.tryParse(controller.bidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                              CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(controller.bidCarsResponse.value.data![0].biddedCars![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                            }else{
                                              controller.placeBid(controller.bidController.value.text, controller.bidCarsResponse.value.data?[0].biddedCars![index].sId);
                                              Navigator.of(context).pop();
                                            }

                                          } catch (e) {
                                            log(e.toString());
                                          }
                                        },
                                      );
                                    });
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                      },
                    )
                  : const Center(
                      child: Text(MyStrings.noDataFound),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
