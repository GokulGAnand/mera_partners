import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../widgets/liked_cars_widget.dart';

final BidCarsListViewModel controller = Get.isRegistered<BidCarsListViewModel>() ? Get.find<BidCarsListViewModel>() : Get.put(BidCarsListViewModel());

class LikedCars extends StatelessWidget {
  const LikedCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: controller.carListResponse.value.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 315,
              ),
              itemBuilder: (context, index) {
               return LikedCarsWidget(
                 bidAmount: controller.carListResponse.value.data?[index].highestBid.toString() ?? '',
                 id: controller.carListResponse.value.data?[index].uniqueId.toString() ?? '',
                 carId: controller.carListResponse.value.data?[index].sId ?? '',
                 imageUrl: controller.carListResponse.value.data?[index].front?.url ?? '',
                 model: controller.carListResponse.value.data?[index].model ?? '',
                 variant: controller.carListResponse.value.data?[index].variant ?? '',
                 status: controller.carListResponse.value.data?[index].status ?? '',
               );
              }),
        ),
      ],
    );
  }
}
