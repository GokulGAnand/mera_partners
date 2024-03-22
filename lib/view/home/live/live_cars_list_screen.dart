import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/home/live/live_cars_list_view_model.dart';
import '../../../widgets/custom_car_detail_card.dart';

/// ignore: must_be_immutable
class LiveCarsListScreen extends StatelessWidget {
  LiveCarsListScreen({super.key});

  LiveCarsListViewModel controller = Get.isRegistered<LiveCarsListViewModel>()
      ? Get.find<LiveCarsListViewModel>()
      : Get.put(LiveCarsListViewModel());

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
                    return CustomCarDetailCard(
                      onCarTapped: () {
                        Get.toNamed(AppRoutes.carDetailsScreen);
                      },
                      isOtb: false,
                      isScheduled: controller.liveCarsResponse.value.data?[index].status?.toLowerCase() == 'scheduled' ? true : false,
                      imageUrl: controller.liveCarsResponse.value.data?[index]
                              .rearRight?.url ??
                          '',
                      carLocation: controller.liveCarsResponse.value
                              .data?[index].vehicleLocation ??
                          '',
                      bidStatus: controller
                              .liveCarsResponse.value.data?[index].status ??
                          '',
                      bidAmount: controller
                              .liveCarsResponse.value.data?[index].totalBidder
                              .toString() ??
                          '',
                      carModel: controller
                              .liveCarsResponse.value.data?[index].model ??
                          '',
                      carVariant: controller
                              .liveCarsResponse.value.data?[index].variant ??
                          '',
                      rating: ((controller.liveCarsResponse.value.data![index]
                                  .engineStar ??
                              0 +
                                  (controller.liveCarsResponse.value
                                          .data![index].exteriorStar ??
                                      0) +
                                  (controller
                                          .liveCarsResponse
                                          .value
                                          .data![index]
                                          .interiorAndElectricalStar ??
                                      0) +
                                  (controller.liveCarsResponse.value
                                          .data![index].testDriveStar ??
                                      0)) /
                          4),
                      fuelType: controller
                              .liveCarsResponse.value.data?[index].fuelType ??
                          '',
                      id: controller
                              .liveCarsResponse.value.data?[index].uniqueId
                              .toString() ??
                          '',
                      fmv: controller
                              .liveCarsResponse.value.data?[index].realValue
                              .toString() ??
                          '',
                      kmDriven: controller.liveCarsResponse.value.data?[index]
                                  .odometerReading !=
                              null
                          ? controller
                              .liveCarsResponse.value.data![index].odometerReading
                              .toString()
                          : '0',
                      ownerShip: controller.liveCarsResponse.value.data?[index]
                              .ownershipNumber ??
                          '',
                      transmission: controller.liveCarsResponse.value
                              .data?[index].transmission ??
                          '',
                      images: [
                        controller.liveCarsResponse.value.data?[index].frontLeft
                                ?.url ??
                            '',
                        controller.liveCarsResponse.value.data?[index].front
                                ?.url ??
                            '',
                        controller.liveCarsResponse.value.data?[index]
                                .frontRight?.url ??
                            '',
                        controller.liveCarsResponse.value.data?[index].rear
                                ?.url ??
                            '',
                        controller.liveCarsResponse.value.data?[index]
                                .engineCompartment?.url ??
                            '',
                      ],
                      autoBid: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBidBottomSheet(
                                isAutoBid: true,
                                bid: controller.bid,
                                bidValue: controller.bidValue,
                              );
                            });
                      },
                      bid: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBidBottomSheet(
                                bid: controller.bid,
                                bidValue: controller.bidValue,
                              );
                            });
                      },
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
