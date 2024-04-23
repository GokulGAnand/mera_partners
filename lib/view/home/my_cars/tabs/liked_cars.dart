import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../widgets/liked_cars_widget.dart';

final BidCarsListViewModel controller = Get.put(BidCarsListViewModel());

class LikedCars extends StatelessWidget {
  const LikedCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: Obx(
                () => GridView.builder(
              itemCount: controller.likeResponse.value.data?[0].likedCars?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 315,
              ),
              itemBuilder: (context, index) {
                return LikedCarsWidget(
                  bidAmount: controller.likeResponse.value.data![0].likedCars?[index].highestBid.toString() ?? '',
                  id: controller.likeResponse.value.data![0].likedCars?[index].uniqueId.toString() ?? '',
                  carId: controller.likeResponse.value.data![0].likedCars?[index].sId.toString() ?? '',
                  imageUrl: controller.likeResponse.value.data![0].likedCars?[index].frontLeft?.url ?? '',
                  model: controller.likeResponse.value.data![0].likedCars?[index].model.toString() ?? '',
                  variant: controller.likeResponse.value.data![0].likedCars?[index].variant.toString() ?? '',
                  status: controller.likeResponse.value.data![0].likedCars?[index].status.toString() ?? '',
                  bidStartTime: DateTime.parse(controller.likeResponse.value.data![0].likedCars?[index].bidStartTime ?? DateTime.now().toString()),
                  bidEndTime: DateTime.parse(controller.likeResponse.value.data![0].likedCars?[index].bidEndTime ?? DateTime.now().toString()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
