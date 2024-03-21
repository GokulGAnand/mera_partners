import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Obx(
        () => SafeArea(
          child: controller.carsListResponse.value.data != null
              ? ListView.builder(
                  itemCount: controller.carsListResponse.value.data?.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return CustomCarDetailCard(
                      isOtb: true,
                      imageUrl: controller.carsListResponse.value.data?[index].rearRight?.url ?? '',
                      carLocation: controller.carsListResponse.value.data?[index].vehicleLocation ?? '',
                      bidStatus: controller.carsListResponse.value.data?[index].status ?? '',
                      bidAmount: controller.carsListResponse.value.data?[index].totalBidder.toString() ?? '',
                      carModel: controller.carsListResponse.value.data?[index].model ?? '',
                      carVariant: controller.carsListResponse.value.data?[index].variant ?? '',
                      rating: ((controller.carsListResponse.value.data![index].engineStar ?? 0 + (controller.carsListResponse.value.data![index].exteriorStar ?? 0) + (controller.carsListResponse.value.data![index].interiorAndElectricalStar ?? 0) + (controller.carsListResponse.value.data![index].testDriveStar ?? 0)) / 4),
                      fuelType: controller.carsListResponse.value.data?[index].fuelType ?? '',
                      id: controller.carsListResponse.value.data?[index].uniqueId.toString() ?? '',
                      fmv: controller.carsListResponse.value.data?[index].realValue.toString() ?? '',
                      kmDriven: controller.carsListResponse.value.data?[index].odometerReading != null ? controller.carsListResponse.value.data![index].odometerReading.toString() : '0',
                      ownerShip: controller.carsListResponse.value.data?[index].ownershipNumber ?? '',
                      transmission: controller.carsListResponse.value.data?[index].transmission ?? '',
                      images: [
                        controller.carsListResponse.value.data?[index].frontLeft?.url ?? '',
                        controller.carsListResponse.value.data?[index].front?.url ?? '',
                        controller.carsListResponse.value.data?[index].frontRight?.url ?? '',
                        controller.carsListResponse.value.data?[index].rear?.url ?? '',
                        controller.carsListResponse.value.data?[index].engineCompartment?.url ?? '',
                      ],
                      otbTapped: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return OTBBottomSheet(
                                // otbPrice: 10,
                                //todo
                                otbPrice: controller.carsListResponse.value.data?[index].realValue ?? 0,
                                onPressed: () {
                                  
                                },
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
