import 'dart:developer';
import 'package:evaluator_app/model/response/live/live_cars_list_response.dart';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/widgets/custom_bid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../view_model/home/live/live_cars_list_view_model.dart';
import '../../../widgets/custom_car_detail_card.dart';

/// ignore: must_be_immutable
class LiveCarsListScreen extends StatelessWidget {
  LiveCarsListScreen({super.key});

  LiveCarsListViewModel controller = Get.isRegistered<LiveCarsListViewModel>() ? Get.find<LiveCarsListViewModel>() : Get.put(LiveCarsListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedListView<int, Data>(
          pagingController: controller.infinitePagingController,
          builderDelegate: PagedChildBuilderDelegate<Data>(
              // itemCount: controller.liveCarsResponse.value.data?.length,
              // padding: const EdgeInsets.all(8),
              itemBuilder: ((context, item, index) {
            return CustomCarDetailCard(
              onCarTapped: () {
                Get.toNamed(AppRoutes.carDetailsScreen, arguments: item.sId);
              },
              isOtb: false,
              isScheduled: item.status?.toLowerCase() == 'scheduled' ? true : false,
              imageUrl: item.rearRight?.url ?? '',
              carLocation: item.vehicleLocation ?? '',
              bidStatus: item.status ?? '',
              bidAmount: Constants.numberFormat.format(item.highestBid).toString(),
              bidStartTime: Duration(minutes: 1),
              bidEndTime: Duration(minutes: 1),
              carModel: item.model ?? '',
              carVariant: item.variant ?? '',
              rating: ((item.engineStar ?? 0 + (item.exteriorStar ?? 0) + (item.interiorAndElectricalStar ?? 0) + (item.testDriveStar ?? 0)) / 4),
              fuelType: item.fuelType ?? '',
              id: item.uniqueId.toString(),
              fmv: item.realValue.toString(),
              kmDriven: item.odometerReading != null ? item.odometerReading.toString() : '0',
              ownerShip: item.ownershipNumber ?? '',
              transmission: item.transmission ?? '',
              images: [
                item.frontLeft?.url ?? '',
                item.front?.url ?? '',
                item.frontRight?.url ?? '',
                item.rear?.url ?? '',
                item.engineCompartment?.url ?? '',
              ],
              autoBid: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return CustomBidBottomSheet(
                        amountController: controller.autoBidController.value,
                        isAutoBid: true,
                        bidValue: RxInt(item.highestBid ?? 0),
                        stepRate: item.highestBid! <= 99999
                            ? RxInt(1000)
                            : (item.highestBid! >= 100000 && item.highestBid! <= 299999)
                            ? RxInt(4000)
                            : (item.highestBid! >= 300000 && item.highestBid! <= 499999)
                            ? RxInt(7000)
                            : RxInt(10000),
                        onAutoBidPressed: () {
                          try {
                            controller.placeAutoBid(controller.bidController.value.text, item.sId);
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
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return CustomBidBottomSheet(
                        amountController: controller.bidController.value,
                        bidValue: RxInt(item.highestBid ?? 0),
                        stepRate: item.highestBid! <= 99999
                            ? RxInt(1000)
                            : (item.highestBid! >= 100000 && item.highestBid! <= 299999)
                            ? RxInt(4000)
                            : (item.highestBid! >= 300000 && item.highestBid! <= 499999)
                            ? RxInt(7000)
                            : RxInt(10000),
                        onBidPressed: () {
                          try {
                            controller.placeBid(controller.bidController.value.text, item.sId);
                            Navigator.of(context).pop();
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                      );
                    });
              },
            );
          })),
        ),
      )),
    );
  }
}
