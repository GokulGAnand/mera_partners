import 'dart:developer';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import '../../../model/response/live/live_cars_list_response.dart';
import '../../../utils/svg.dart';
import '../../../view_model/home/live/live_cars_list_view_model.dart';
import '../../../view_model/home/orders/negotiation_cars_view_model.dart';
import '../../../widgets/custom_car_detail_card.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

/// ignore: must_be_immutable
class LiveCarsListScreen extends StatelessWidget {
  LiveCarsListScreen({super.key});

  LiveCarsListViewModel controller = Get.isRegistered<LiveCarsListViewModel>() ? Get.find<LiveCarsListViewModel>() : Get.put(LiveCarsListViewModel());

  @override
  Widget build(BuildContext context) {
    var negotiationData = CarListResponse().data.obs;
    var duration = DateTime.now().difference(DateTime.parse(negotiationData.value?[0].negotiationEndTime ?? DateTime.now().toString()));
    controller.endTime?.value = DateTime.now().millisecondsSinceEpoch + Duration(seconds: duration.inSeconds).inMilliseconds;
    controller.timerController = CountdownTimerController(endTime: controller.endTime?.value ?? 0, onEnd: controller.onEnd).obs;
    return Scaffold(
      body: Obx(
        () {
          if (Get.isRegistered<NegotiationViewModel>()) {
            negotiationData.value = Get.find<NegotiationViewModel>().carListResponse.value.data;
          }
          return SafeArea(
              child: Column(
            children: [
              (negotiationData.value != null) && (negotiationData.value!.isNotEmpty && negotiationData.value?[0].negotiationStatus?.toLowerCase() == Status.view.name)
                  ? SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: /*negotiationData.value?.length ?? */1,
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 16),
                  itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(color: MyColors.kPrimaryColor, borderRadius: BorderRadius.circular(8)),
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      child: ListTile(
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: InkWell(
                              onTap: () {
                                // negotiationData.value?.clear();
                                // negotiationData.value?.removeAt(index);
                              },
                              child: SvgPicture.asset(
                                MySvg.cancel,
                                color: MyColors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            "Negotiation for ${negotiationData.value![0].model??''} ${negotiationData.value![0].variant??''} ",
                            overflow: TextOverflow.ellipsis,
                            style: MyStyles.white14500,
                          ),
                          subtitle: Row(
                            children: [
                              const Text(
                                "ends ",
                                textAlign: TextAlign.center,
                                style: MyStyles.white14500,
                              ),
                              const Icon(
                                Icons.timer_sharp,
                                color: MyColors.white,
                                size: 14,
                              ),
                              CountdownTimer(
                                controller: controller.timerController?.value,
                                widgetBuilder: (_, CurrentRemainingTime? time) {
                                  if (time == null) {
                                    return const Text('');
                                  }
                                  return Text('${time.min}min ${time.sec}sec',style: MyStyles.white14500, );
                                },
                              ),
                            ],
                          )));
                },),
              )
                  : const SizedBox(
                      height: 1,
                      width: 1,
                    ),
              controller.liveCarsResponse.value.data != null
                  ? ((controller.searchList.isNotEmpty || (controller.searchList.isEmpty && controller.searchController.text.isEmpty)) && controller.liveCarsResponse.value.data!.isNotEmpty)
                  ? Expanded(
                      child: ListView.builder(
                      itemCount: controller.liveCarsResponse.value.data?.length,
                      padding: const EdgeInsets.fromLTRB(16,8,16,8),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          if ((controller.searchController.text.isEmpty && controller.searchList.isEmpty) || controller.searchList.contains(controller.liveCarsResponse.value.data?[index].sId)) {
                            return CustomCarDetailCard(
                              onCarTapped: () {
                                Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.liveCarsResponse.value.data?[index].sId);
                              },
                              isFavourite: controller.likeResponse.value.data?[0].likedCars != null && (controller.likeResponse.value.data![0].likedCars!.isNotEmpty)
                                  ? controller.likeResponse.value.data![0].likedCars!.any((element) => element.sId == controller.liveCarsResponse.value.data?[index].sId)
                                      ? true.obs
                                      : false.obs
                                  : false.obs,
                              isOtb: false.obs,
                              scheduleTime: Constants.getScheduledStatus(DateTime.parse(controller.liveCarsResponse.value.data?[index].bidStartTime ?? DateTime.now().toString()).toLocal()),
                              carId: controller.liveCarsResponse.value.data?[index].sId ?? '',
                              isScheduled: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == 'scheduled' ? true.obs : false.obs,
                              imageUrl: controller.liveCarsResponse.value.data?[index].rearRight?.url ?? '',
                              carLocation: controller.liveCarsResponse.value.data?[index].vehicleLocation ?? '',
                              bidStatus: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? RxString(MyStrings.scheduledBid)
                                  : globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].winner != null && controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!)
                                      ? RxString(MyStrings.youAreLeading)
                                      : globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].winner != null && !controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.liveCarsResponse.value.data?[index].leaderBoard != null && controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                                          ? RxString(MyStrings.youAreLoosing)
                                          : RxString(MyStrings.highestBid),
                              statusColor: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? MyColors.black
                                  : (globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].winner != null && controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!))
                                      ? MyColors.green
                                      : (globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].leaderBoard != null && controller.liveCarsResponse.value.data?[index].winner != null && !controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                                          ? MyColors.red
                                          : MyColors.kPrimaryColor,
                              bidAmount: Constants.numberFormat.format(controller.liveCarsResponse.value.data?[index].highestBid ?? 0).toString().obs,
                              endTime: Rx(Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds),
                              timerController: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {controller.liveCarsResponse.value.data?.removeAt(index);},).obs,
                              bidStartTime: DateTime.parse(controller.liveCarsResponse.value.data?[index].bidStartTime ?? DateTime.now().toString()).toLocal(),
                              bidEndTime: DateTime.parse(controller.liveCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal(),
                              carModel: controller.liveCarsResponse.value.data?[index].model ?? '',
                              carVariant: controller.liveCarsResponse.value.data?[index].variant ?? '',
                              criticalIssue: controller.liveCarsResponse.value.data?[index].carCondition ?? '',
                              rating: (((controller.liveCarsResponse.value.data?[index].engineStar ?? 0) + (controller.liveCarsResponse.value.data?[index].exteriorStar ?? 0) + (controller.liveCarsResponse.value.data?[index].interiorAndElectricalStar ?? 0) + (controller.liveCarsResponse.value.data?[index].testDriveStar ?? 0)) / 4).roundToDouble(),
                              fuelType: controller.liveCarsResponse.value.data?[index].fuelType ?? '',
                              id: controller.liveCarsResponse.value.data?[index].uniqueId.toString() ?? '',
                              fmv: controller.liveCarsResponse.value.data?[index].realValue != null ? controller.liveCarsResponse.value.data![index].realValue.toString() : '0',
                              kmDriven: controller.liveCarsResponse.value.data?[index].odometerReading != null ? controller.liveCarsResponse.value.data![index].odometerReading.toString() : '0',
                              ownerShip: controller.liveCarsResponse.value.data?[index].ownershipNumber ?? '',
                              transmission: controller.liveCarsResponse.value.data?[index].transmission ?? '',
                              images: [
                                controller.liveCarsResponse.value.data?[index].frontLeft?.url ?? '',
                                controller.liveCarsResponse.value.data?[index].front?.url ?? '',
                                controller.liveCarsResponse.value.data?[index].frontRight?.url ?? '',
                                controller.liveCarsResponse.value.data?[index].rear?.url ?? '',
                                controller.liveCarsResponse.value.data?[index].engineCompartment?.url ?? '',
                              ],
                              autoBid: () {
                                controller.autoBidController.value.clear();
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Obx(() => CustomBidBottomSheet(
                                        timerController: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                                        amountController: controller.autoBidController,
                                        isAutoBid: true,
                                        bidValue: RxInt(controller.liveCarsResponse.value.data?[index].highestBid ?? 0),
                                        stepRate: controller.liveCarsResponse.value.data![index].highestBid! <= 99999
                                            ? RxInt(2000)
                                            : (controller.liveCarsResponse.value.data![index].highestBid! >= 100000 && controller.liveCarsResponse.value.data![index].highestBid! <= 299999)
                                            ? RxInt(4000)
                                            : (controller.liveCarsResponse.value.data![index].highestBid! >= 300000 && controller.liveCarsResponse.value.data![index].highestBid! <= 499999)
                                            ? RxInt(7000)
                                            : RxInt(10000),
                                        onAutoBidPressed: () {
                                          try {
                                            if(globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].winner != null && controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.isAutobid == true && controller.autoBidController.value.text.isNotEmpty && (int.tryParse(controller.autoBidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                              CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(controller.liveCarsResponse.value.data![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                            }else{
                                              controller.placeAutoBid(controller.autoBidController.value.text, controller.liveCarsResponse.value.data?[index].sId);
                                              Navigator.of(context).pop();
                                            }
                                          } catch (e) {
                                            log(e.toString());
                                          }
                                        },
                                      ),);
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
                                      return Obx(() => CustomBidBottomSheet(
                                        timerController: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.liveCarsResponse.value.data![index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                                        amountController: controller.bidController,
                                        bidValue: RxInt(controller.liveCarsResponse.value.data?[index].highestBid ?? 0),
                                        stepRate: controller.liveCarsResponse.value.data![index].highestBid! <= 99999
                                            ? RxInt(2000)
                                            : (controller.liveCarsResponse.value.data![index].highestBid! >= 100000 && controller.liveCarsResponse.value.data![index].highestBid! <= 299999)
                                            ? RxInt(4000)
                                            : (controller.liveCarsResponse.value.data![index].highestBid! >= 300000 && controller.liveCarsResponse.value.data![index].highestBid! <= 499999)
                                            ? RxInt(7000)
                                            : RxInt(10000),
                                        onBidPressed: () {
                                          try {
                                            if(globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].winner != null && controller.liveCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.isAutobid == true && (int.tryParse(controller.bidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                              CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(controller.liveCarsResponse.value.data![index].leaderBoard![0].autoBidLimit ?? 0).toString());
                                            }else{
                                              controller.placeBid(controller.bidController.value.text, controller.liveCarsResponse.value.data?[index].sId);
                                              Navigator.of(context).pop();
                                            }
                                          } catch (e) {
                                            log(e.toString());
                                          }
                                        },
                                      ),);
                                    });
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                      },
                    )): const Expanded(
                      child: Center(
                                      child: Text(MyStrings.noDataFound),
                                    ),
                    )
                  : const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
            ],
          ));
        },
      ),
    );
  }
}
