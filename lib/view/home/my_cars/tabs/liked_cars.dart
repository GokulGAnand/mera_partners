import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../widgets/liked_cars_widget.dart';

final BidCarsListViewModel controller = Get.put(BidCarsListViewModel());
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
          child: Obx(
            () {
              return GridView.builder(
                  itemCount: controller.likedCarsearchList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 18,
                    mainAxisExtent: 315,
                  ),
                  itemBuilder: (context, index) {
                   return Obx(
                     () {
                       return LikedCarsWidget(
                         bidAmount: controller.likedCarsearchList[index].highestBid.toString() ?? '',
                         id: controller.likedCarsearchList[index].uniqueId.toString() ?? '',
                         carId: controller.likedCarsearchList[index].sId.toString() ?? '',
                         imageUrl: controller.likedCarsearchList[index].frontLeft?.url ?? '',
                         model: controller.likedCarsearchList[index].model.toString() ?? '',
                         variant: controller.likedCarsearchList[index].variant.toString() ?? '',
                         status: controller.likedCarsearchList[index].status.toString() ?? ''
                       );
                     }
                   );
                  });
            }
          ),
        ),
      ],
    );
  }
}
