import 'dart:developer';
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
              ? ListView.builder(
                  itemCount: controller.bidCarsResponse.value.data?.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Obx(
                            () {
                              if((controller.searchController.text.isEmpty && controller.searchList.isEmpty) || controller.searchList.contains(controller.bidCarsResponse.value.data?[index].sId)){
                              return CustomCarDetailCard(
                          onCarTapped: () {
                            Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.bidCarsResponse.value.data?[index].sId);
                          },
                          isOtb: false.obs,
                          carId: controller.bidCarsResponse.value.data?[index].sId ?? '',
                          isScheduled: controller.bidCarsResponse.value.data?[index].status?.toLowerCase() == 'scheduled' ? true.obs : false.obs,
                          imageUrl: controller.bidCarsResponse.value.data?[index].rearRight?.url ?? '',
                          carLocation: controller.bidCarsResponse.value.data?[index].vehicleLocation ?? '',
                          bidStatus: controller.bidCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase() ? RxString(MyStrings.scheduledBid) : globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) ? RxString(MyStrings.youAreLeading)
                              : globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[index].winner != null && !controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) && controller.bidCarsResponse.value.data?[index].leaderBoard != null && controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                              ? RxString(MyStrings.youAreLoosing) :
                          RxString(MyStrings.highestBid),
                          statusColor: controller.bidCarsResponse.value.data?[index].status?.toLowerCase() != MyStrings.live.toLowerCase()
                              ? MyColors.black
                              : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[index].winner != null && controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!))
                              ? MyColors.green
                              : (globals.uniqueUserId != null && controller.bidCarsResponse.value.data?[index].leaderBoard != null && controller.bidCarsResponse.value.data?[index].winner != null && !controller.bidCarsResponse.value.data![index].winner!.contains(globals.uniqueUserId!) &&
                              controller.bidCarsResponse.value.data![index].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                              ? MyColors.red
                              : MyColors.kPrimaryColor,
                          bidAmount: Constants.numberFormat.format(controller.bidCarsResponse.value.data?[index].highestBid).toString().obs,
                          bidStartTime: DateTime.parse(controller.bidCarsResponse.value.data?[index].bidStartTime ?? DateTime.now().toString()),
                          bidEndTime: DateTime.parse(controller.bidCarsResponse.value.data?[index].bidEndTime ?? DateTime.now().toString()),
                          carModel: controller.bidCarsResponse.value.data?[index].model ?? '',
                          carVariant: controller.bidCarsResponse.value.data?[index].variant ?? '',
                          rating: ((controller.bidCarsResponse.value.data?[index].engineStar ?? 0 + (controller.bidCarsResponse.value.data?[index].exteriorStar ?? 0) + (controller.bidCarsResponse.value.data?[index].interiorAndElectricalStar ?? 0) + (controller.bidCarsResponse.value.data?[index].testDriveStar ?? 0)) / 4),
                          fuelType: controller.bidCarsResponse.value.data?[index].fuelType ?? '',
                          id: controller.bidCarsResponse.value.data?[index].uniqueId.toString() ?? '',
                          fmv: controller.bidCarsResponse.value.data?[index].realValue != null ? controller.bidCarsResponse.value.data![index].realValue.toString() : '0',
                          kmDriven: controller.bidCarsResponse.value.data?[index].odometerReading != null ? controller.bidCarsResponse.value.data![index].odometerReading.toString() : '0',
                          ownerShip: controller.bidCarsResponse.value.data?[index].ownershipNumber ?? '',
                          transmission: controller.bidCarsResponse.value.data?[index].transmission ?? '',
                          images: [
                            controller.bidCarsResponse.value.data?[index].frontLeft?.url ?? '',
                            controller.bidCarsResponse.value.data?[index].front?.url ?? '',
                            controller.bidCarsResponse.value.data?[index].frontRight?.url ?? '',
                            controller.bidCarsResponse.value.data?[index].rear?.url ?? '',
                            controller.bidCarsResponse.value.data?[index].engineCompartment?.url ?? '',
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
                                    amountController: controller.autoBidController,
                                    isAutoBid: true,
                                    bidValue: RxInt(controller.bidCarsResponse.value.data?[index].highestBid ?? 0),
                                    stepRate: controller.bidCarsResponse.value.data![index].highestBid! <= 99999
                                        ? RxInt(2000)
                                        : (controller.bidCarsResponse.value.data![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![index].highestBid! <= 299999)
                                        ? RxInt(4000)
                                        : (controller.bidCarsResponse.value.data![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![index].highestBid! <= 499999)
                                        ? RxInt(7000)
                                        : RxInt(10000),
                                    onAutoBidPressed: () {
                                      try {
                                        controller.placeAutoBid(controller.autoBidController.value.text, controller.bidCarsResponse.value.data?[index].sId);
                                        Navigator.of(context).pop();
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
                                    amountController: controller.bidController,
                                    bidValue: RxInt(controller.bidCarsResponse.value.data?[index].highestBid ?? 0),
                                    stepRate: controller.bidCarsResponse.value.data![index].highestBid! <= 99999
                                        ? RxInt(2000)
                                        : (controller.bidCarsResponse.value.data![index].highestBid! >= 100000 && controller.bidCarsResponse.value.data![index].highestBid! <= 299999)
                                        ? RxInt(4000)
                                        : (controller.bidCarsResponse.value.data![index].highestBid! >= 300000 && controller.bidCarsResponse.value.data![index].highestBid! <= 499999)
                                        ? RxInt(7000)
                                        : RxInt(10000),
                                    onBidPressed: () {
                                      try {
                                        controller.placeBid(controller.bidController.value.text, controller.bidCarsResponse.value.data?[index].sId);
                                        Navigator.of(context).pop();
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
                            }
                        );
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
