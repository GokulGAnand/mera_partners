import 'package:evaluator_app/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../../widgets/custom_car_detail_card.dart';

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
                    return CustomCarDetailCard(
                      imageUrl: controller.bidCarsResponse.value.data?[index].rearRight?.url ?? '',
                      carLocation: controller.bidCarsResponse.value.data?[index].vehicleLocation ?? '',
                      bidStatus: controller.bidCarsResponse.value.data?[index].status ?? '',
                      bidAmount: controller.bidCarsResponse.value.data?[index].totalBidder.toString() ?? '',
                      carModel: controller.bidCarsResponse.value.data?[index].model ?? '',
                      carVariant: controller.bidCarsResponse.value.data?[index].variant ?? '',
                      rating: ((controller.bidCarsResponse.value.data![index].engineStar ?? 0 + (controller.bidCarsResponse.value.data![index].exteriorStar ?? 0) + (controller.bidCarsResponse.value.data![index].interiorAndElectricalStar ?? 0) + (controller.bidCarsResponse.value.data![index].testDriveStar ?? 0)) / 4),
                      fuelType: controller.bidCarsResponse.value.data?[index].fuelType ?? '',
                      id: controller.bidCarsResponse.value.data?[index].uniqueId.toString() ?? '',
                      fmv: controller.bidCarsResponse.value.data?[index].realValue.toString() ?? '',
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
