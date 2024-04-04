import 'dart:developer';
import 'package:evaluator_app/model/response/live/live_cars_list_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../view_model/home/live/live_cars_list_view_model.dart';
import '../../../widgets/custom_car_detail_card.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

/// ignore: must_be_immutable
class LiveCarsListScreen extends StatelessWidget {
  LiveCarsListScreen({super.key});

  LiveCarsListViewModel controller = Get.isRegistered<LiveCarsListViewModel>() ? Get.find<LiveCarsListViewModel>() : Get.put(LiveCarsListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.liveCarsResponse.value.data != null
              ? ListView.builder(
                  itemCount: controller.liveCarsResponse.value.data?.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Obx(
                            () =>CustomCarDetailCard(
                      onCarTapped: () {
                        Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.liveCarsResponse.value.data?[index].sId);
                      },
                      isOtb: false,
                      isScheduled: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == 'scheduled' ? true : false,
                      imageUrl: controller.liveCarsResponse.value.data?[index].rearRight?.url ?? '',
                      carLocation: controller.liveCarsResponse.value.data?[index].vehicleLocation ?? '',
                      bidStatus: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase() ? RxString(MyStrings.scheduledBid) : globals.uniqueUserId != null && globals.uniqueUserId == controller.liveCarsResponse.value.data?[index].winner ? RxString(MyStrings.youAreLeading)
                          : globals.uniqueUserId != null && globals.uniqueUserId != controller.liveCarsResponse.value.data?[index].winner && controller.liveCarsResponse.value.data?[index].leaderBoard != null && controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                          ? RxString(MyStrings.youAreLoosing) :
                      RxString(MyStrings.highestBid),
                              statusColor: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? MyColors.black
                                  : (globals.uniqueUserId != null && globals.uniqueUserId == controller.liveCarsResponse.value.data?[index].winner)
                                  ? MyColors.green
                                  : (globals.uniqueUserId != null && controller.liveCarsResponse.value.data?[index].leaderBoard != null &&
                                  globals.uniqueUserId != controller.liveCarsResponse.value.data?[index].winner &&
                                  controller.liveCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                                  ? MyColors.red
                                  : MyColors.kPrimaryColor,
                      bidAmount: Constants.numberFormat.format(controller.liveCarsResponse.value.data?[index].highestBid).toString().obs,
                      bidStartTime: DateTime.parse(controller.liveCarsResponse.value.data?[index].bidStartTime ?? DateTime.now().toString()),
                      bidEndTime: DateTime.parse(controller.liveCarsResponse.value.data?[index].bidEndTime ?? DateTime.now().toString()),
                      carModel: controller.liveCarsResponse.value.data?[index].model ?? '',
                      carVariant: controller.liveCarsResponse.value.data?[index].variant ?? '',
                      rating: ((controller.liveCarsResponse.value.data?[index].engineStar ?? 0 + (controller.liveCarsResponse.value.data?[index].exteriorStar ?? 0) + (controller.liveCarsResponse.value.data?[index].interiorAndElectricalStar ?? 0) + (controller.liveCarsResponse.value.data?[index].testDriveStar ?? 0)) / 4),
                      fuelType: controller.liveCarsResponse.value.data?[index].fuelType ?? '',
                      id: controller.liveCarsResponse.value.data?[index].uniqueId.toString() ?? '',
                      fmv: controller.liveCarsResponse.value.data?[index].realValue.toString() ?? 'x',
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
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBidBottomSheet(
                                amountController: controller.autoBidController,
                                isAutoBid: true,
                                bidValue: RxInt(controller.liveCarsResponse.value.data?[index].highestBid ?? 0),
                                stepRate: controller.liveCarsResponse.value.data![index].highestBid! <= 99999
                                    ? RxInt(1000)
                                    : (controller.liveCarsResponse.value.data![index].highestBid! >= 100000 && controller.liveCarsResponse.value.data![index].highestBid! <= 299999)
                                    ? RxInt(4000)
                                    : (controller.liveCarsResponse.value.data![index].highestBid! >= 300000 && controller.liveCarsResponse.value.data![index].highestBid! <= 499999)
                                    ? RxInt(7000)
                                    : RxInt(10000),
                                onAutoBidPressed: () {
                                  try {
                                    controller.placeAutoBid(controller.bidController.value.text, controller.liveCarsResponse.value.data?[index].sId);
                                    Navigator.of(context).pop();
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                },
                              );
                            });
                      },
                      bid: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBidBottomSheet(
                                amountController: controller.bidController,
                                bidValue: RxInt(controller.liveCarsResponse.value.data?[index].highestBid ?? 0),
                                stepRate: controller.liveCarsResponse.value.data![index].highestBid! <= 99999
                                    ? RxInt(1000)
                                    : (controller.liveCarsResponse.value.data![index].highestBid! >= 100000 && controller.liveCarsResponse.value.data![index].highestBid! <= 299999)
                                    ? RxInt(4000)
                                    : (controller.liveCarsResponse.value.data![index].highestBid! >= 300000 && controller.liveCarsResponse.value.data![index].highestBid! <= 499999)
                                    ? RxInt(7000)
                                    : RxInt(10000),
                                onBidPressed: () {
                                  try {
                                    controller.placeBid(controller.bidController.value.text, controller.liveCarsResponse.value.data?[index].sId);
                                    Navigator.of(context).pop();
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                },
                              );
                            });
                      },
                    ));
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
