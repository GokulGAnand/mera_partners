import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mera_partners/utils/strings.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/enum.dart';
import '../../../view_model/home/otb/otb_view_model.dart';
import '../../../widgets/custom_car_detail_card.dart';
import '../../../widgets/otb_bottom_sheet.dart';

/// ignore: must_be_immutable
class OTBScreen extends StatelessWidget {
  OTBScreen({super.key});

  OTBCarsListViewModel controller = Get.isRegistered<OTBCarsListViewModel>() ? Get.find<OTBCarsListViewModel>() : Get.put(OTBCarsListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () {
                if(controller.searchList.isNotEmpty || (controller.searchList.isEmpty && controller.searchController.text.isEmpty)){
                  return PagedListView<int, Data>(
                  pagingController: controller.infinitePagingController,
                  builderDelegate: PagedChildBuilderDelegate<Data>(
                          // itemCount: controller.carsListResponse.value.data?.length,
                          // padding: const EdgeInsets.all(8),
                          itemBuilder: (context, item, index) {
                            return Obx(
                              () {
                                if((controller.searchController.text.isEmpty && controller.searchList.isEmpty) || controller.searchList.contains(controller.carsListResponse.value.data?[index].sId)){
                                return CustomCarDetailCard(
                                  carId: item.sId ?? '',
                                  onCarTapped: () {
                                    Get.toNamed(AppRoutes.carDetailsScreen, arguments: item.sId);
                                  },
                                  isFavourite: controller.likeResponse.value.data?[0].likedCars != null && (controller.likeResponse.value.data![0].likedCars!.isNotEmpty)? controller.likeResponse.value.data![0].likedCars!.any((element) => element.sId == controller.carsListResponse.value.data?[index].sId) ? true.obs : false.obs : false.obs,
                                  isOtb: true.obs,
                                  scheduleTime: Constants.getScheduledStatus(DateTime.parse(item.bidStartTime ?? DateTime.now().toString()).toLocal()),
                                  imageUrl: item.rearRight?.url ?? '',
                                  carLocation: item.vehicleLocation ?? '',
                                  bidStatus: RxString(item.status ?? ''),
                                  bidAmount: Constants.numberFormat.format(item.realValue ?? 0).toString().obs,
                                  carModel: item.model ?? '',
                                  carVariant: item.variant ?? '',
                                  rating: ((item.engineStar ?? 0 + (item.exteriorStar ?? 0) + (item.interiorAndElectricalStar ?? 0) + (item.testDriveStar ?? 0)) / 4).roundToDouble(),
                                  fuelType: item.fuelType ?? '',
                                  id: item.uniqueId.toString(),
                                  fmv: item.realValue != null ? item.realValue.toString() : '0',
                                  kmDriven: item.odometerReading != null ? item.odometerReading.toString() : '0',
                                  ownerShip: item.ownershipNumber ?? '',
                                  transmission: item.transmission ?? '',
                                  isScheduled: false.obs,
                                  bidStartTime: DateTime.parse(item.bidStartTime ?? DateTime.now().toString()).toLocal(),
                                  bidEndTime: DateTime.parse(item.bidEndTime ?? DateTime.now().toString()).toLocal(),
                                  endTime: Rx(Duration(seconds: DateTime.parse(item.bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds),
                                  timerController: item.status?.toLowerCase() == CarStatus.scheduled.name?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(item.bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds ?? 0, onEnd:() {},).obs : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(item.bidEndTime  ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds ?? 0, onEnd:() {},).obs,
                                  images: [
                                    item.frontLeft?.url ?? '',
                                    item.front?.url ?? '',
                                    item.frontRight?.url ?? '',
                                    item.rear?.url ?? '',
                                    item.engineCompartment?.url ?? '',
                                  ],
                                  otbTapped: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return OTBBottomSheet(
                                            otbPrice: item.realValue ?? 0,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              controller.buyOTBCar(item.sId ?? '', item.realValue ?? 0);
                                            },
                                          );
                                        });
                                  },
                                  statusColor: MyColors.kPrimaryColor,
                                );
                                }
                            return const SizedBox();
                              }
                          );
                          },
                        ),
                );
                }
                return const Center(child: Text(MyStrings.noDataFound));
              }
            ),
          ),
        ),
      );
  }
}
