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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getCarData(1);
        },
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: Obx(
            () => SafeArea(
              child: controller.bidCarsResponse.value.data != null
                  ? ((controller.bidCarsearchList.isNotEmpty || (controller.bidCarsearchList.isEmpty && controller.bidCarsearchController.text.isEmpty)) && controller.bidCarsResponse.value.data!.isNotEmpty)
                      ? ListView.builder(
                        controller: controller.biddedCarScrollController,
                          itemCount: controller.bidCarsResponse.value.data!.length,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              if (((controller.bidCarsearchController.value.text.isEmpty && controller.bidCarsearchList.isEmpty) || controller.bidCarsearchList.contains(controller.bidCarsResponse.value.data?[index].sId)) && controller.bidCarsResponse.value.data![index].status?.toLowerCase() == CarStatus.live.name) {
                                // if(index>=controller.bidCarsResponse.value.data!.length){
                                //       if(controller.biddedCarLoadingMore.value == true){
                                //         return Center(child: CircularProgressIndicator());
                                //       } else {
                                //         return const SizedBox();
                                //       }
                                //     }
                                return CustomCarDetailCard(
                                  onCarTapped: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.bidCarsResponse.value.data![index].sId);
                                  },
                                  isOtb: false.obs,
                                  criticalIssue: controller.bidCarsResponse.value.data![index].carCondition?.join(',') ?? '',
                                  yearOfManufacture: controller.bidCarsResponse.value.data![index].monthAndYearOfManufacture ?? '',
                                  isFavourite: controller.likeResponse.value.data != null && (controller.likeResponse.value.data!.isNotEmpty)
                                      ? controller.likeResponse.value.data!.any((element) => element.sId == controller.bidCarsResponse.value.data![index].sId)
                                          ? true.obs
                                          : false.obs
                                      : false.obs,
                                  carId: controller.bidCarsResponse.value.data![index].sId ?? '',
                                  scheduleTime: Constants.getScheduledStatus(DateTime.parse(controller.bidCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal()),
                                  isScheduled: controller.bidCarsResponse.value.data![index].status?.toLowerCase() == 'scheduled' ? true.obs : false.obs,
                                  imageUrl: controller.bidCarsResponse.value.data![index].rearRight?.url ?? '',
                                  carLocation: controller.bidCarsResponse.value.data![index].vehicleLocation ?? '',
                                  bidStatus: controller.bidCarsResponse.value.data![index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                      ? RxString(MyStrings.scheduledBid)
                                      : globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!)
                                          ? RxString(MyStrings.youAreLeading)
                                          : globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].winner != null && !controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![index].leaderBoard != null && controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                                              ? RxString(MyStrings.youAreLoosing)
                                              : RxString(MyStrings.highestBid),
                                  statusColor: controller.bidCarsResponse.value.data![index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                      ? MyColors.black
                                      : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!))
                                          ? MyColors.green
                                          : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].leaderBoard != null && controller.bidCarsResponse.value.data![index].winner != null && !controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                                              ? MyColors.red
                                              : MyColors.kPrimaryColor,
                                  bidAmount: Constants.numberFormat.format(controller.bidCarsResponse.value.data![index].highestBid).toString().obs,
                                  bidStartTime: DateTime.parse(controller.bidCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal(),
                                  bidEndTime: DateTime.parse(controller.bidCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal(),
                                  endTime: Rx(Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds),
                                  timerController: controller.bidCarsResponse.value.data![index].status?.toLowerCase() == CarStatus.scheduled.name
                                      ? CountdownTimerController(
                                          endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                          onEnd: () {},
                                        ).obs
                                      : CountdownTimerController(
                                          endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                          onEnd: () {
                                            /*controller.bidCarsResponse.value.data!.removeAt(index);*/
                                          },
                                        ).obs,
                                  carModel: controller.bidCarsResponse.value.data![index].model ?? '',
                                  carVariant: controller.bidCarsResponse.value.data![index].variant ?? '',
                                  rating: (((controller.bidCarsResponse.value.data![index].engineStar ?? 0) + (controller.bidCarsResponse.value.data![index].exteriorStar ?? 0) + (controller.bidCarsResponse.value.data![index].interiorAndElectricalStar ?? 0) + (controller.bidCarsResponse.value.data![index].testDriveStar ?? 0)) / 4).roundToDouble(),
                                  fuelType: controller.bidCarsResponse.value.data![index].fuelType ?? '',
                                  id: controller.bidCarsResponse.value.data![index].uniqueId.toString() ?? '',
                                  fmv: controller.bidCarsResponse.value.data![index].realValue != null ? controller.bidCarsResponse.value.data![index].realValue.toString() : '0',
                                  kmDriven: controller.bidCarsResponse.value.data![index].odometerReading != null ? controller.bidCarsResponse.value.data![index].odometerReading.toString() : '0',
                                  ownerShip: controller.bidCarsResponse.value.data![index].ownershipNumber ?? '',
                                  transmission: controller.bidCarsResponse.value.data![index].transmission ?? '',
                                  images: [
                                    controller.bidCarsResponse.value.data![index].frontLeft?.url ?? controller.bidCarsResponse.value.data![index].rearLeft?.url ?? '',
                                    controller.bidCarsResponse.value.data![index].front?.url /*?? controller.bidCarsResponse.value.data![index].leftImage?.url */?? '',
                                    controller.bidCarsResponse.value.data![index].frontRight?.url ?? controller.bidCarsResponse.value.data![index].rearRight?.url ?? '',
                                    controller.bidCarsResponse.value.data![index].rear?.url /*?? controller.bidCarsResponse.value.data![index].rightImage?.url */?? '',
                                    controller.bidCarsResponse.value.data![index].engineCompartment?.url /*?? controller.bidCarsResponse.value.data![index].roof?.url */?? '',
                                  ],
                                  autoBid: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    controller.autoBidController.value.clear();
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Obx(
                                            () => CustomBidBottomSheet(
                                              timerController: controller.bidCarsResponse.value.data![index].status?.toLowerCase() == CarStatus.scheduled.name
                                                  ? CountdownTimerController(
                                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                                      onEnd: () {},
                                                    ).obs
                                                  : CountdownTimerController(
                                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                                      onEnd: () {},
                                                    ).obs,
                                              amountController: controller.autoBidController,
                                              isAutoBid: true,
                                              bidValue: RxInt(controller.bidCarsResponse.value.data![index].highestBid ?? 0),
                                              stepRate: controller.bidCarsResponse.value.data![index].highestBid! <= 99999
                                                  ? RxInt(2000)
                                                  : (controller.bidCarsResponse.value.data![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![index].highestBid! <= 299999)
                                                      ? RxInt(4000)
                                                      : (controller.bidCarsResponse.value.data![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![index].highestBid! <= 499999)
                                                          ? RxInt(7000)
                                                          : RxInt(10000),
                                              onAutoBidPressed: () {
                                                try {
                                                  if (globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.autoBidLimit != null && (int.tryParse(controller.autoBidController.value.text) ?? 0) <= element.autoBidLimit!)) {
                                                    CustomToast.instance.showMsg(MyStrings.vAutoBidLimit + (controller.bidCarsResponse.value.data![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                                  } else {
                                                    controller.placeAutoBid(controller.autoBidController.value.text, controller.bidCarsResponse.value.data![index].sId);
                                                    Navigator.of(context).pop();
                                                  }
                                                } catch (e) {
                                                  log(e.toString());
                                                }
                                              },
                                            ),
                                          );
                                        });
                                  },
                                  bid: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    controller.bidController.value.clear();
                                    showModalBottomSheet(
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Obx(
                                            () => CustomBidBottomSheet(
                                              timerController: controller.bidCarsResponse.value.data![index].status?.toLowerCase() == CarStatus.scheduled.name
                                                  ? CountdownTimerController(
                                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                                      onEnd: () {},
                                                    ).obs
                                                  : CountdownTimerController(
                                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.bidCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                                      onEnd: () {},
                                                    ).obs,
                                              amountController: controller.bidController,
                                              bidValue: RxInt(controller.bidCarsResponse.value.data![index].highestBid ?? 0),
                                              stepRate: controller.bidCarsResponse.value.data![index].highestBid! <= 99999
                                                  ? RxInt(2000)
                                                  : (controller.bidCarsResponse.value.data![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![index].highestBid! <= 299999)
                                                      ? RxInt(4000)
                                                      : (controller.bidCarsResponse.value.data![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![index].highestBid! <= 499999)
                                                          ? RxInt(7000)
                                                          : RxInt(10000),
                                              onBidPressed: () {
                                                try {
                                                  if (globals.uniqueUserId != null && controller.bidCarsResponse.value.data![index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.autoBidLimit != null && (int.tryParse(controller.bidController.value.text) ?? 0) <= element.autoBidLimit!)) {
                                                    CustomToast.instance.showMsg(MyStrings.vAutoBidLimit + (controller.bidCarsResponse.value.data![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                                  } else {
                                                    controller.placeBid(controller.bidController.value.text, controller.bidCarsResponse.value.data![index].sId);
                                                    Navigator.of(context).pop();
                                                  }
                                                } catch (e) {
                                                  log(e.toString());
                                                }
                                              },
                                            ),
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
        ));
  }
}
