import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../widgets/liked_cars_widget.dart';

class LikedCars extends StatelessWidget {
  const LikedCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BidCarsListViewModel controller = Get.find<BidCarsListViewModel>();

    return Column(
      children: [
        const SizedBox(height: 12),
        Expanded(
          child: Obx(() {
            final likedCarsLength = controller.likeResponse.value.data?[0].likedCars?.length ?? 0;
            return GridView.builder(
              itemCount: likedCarsLength,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 315,
              ),
              itemBuilder: (context, index) {
                final likedCar = controller.likeResponse.value.data?[0].likedCars?[index];
                return likedCar != null ? LikedCarsWidget(
                  bidAmount: controller.likeResponse.value.data![0].likedCars?[index].highestBid.toString() ?? '',
                  id: controller.likeResponse.value.data![0].likedCars?[index].uniqueId.toString() ?? '',
                  carId: controller.likeResponse.value.data![0].likedCars?[index].sId.toString() ?? '',
                  imageUrl: controller.likeResponse.value.data![0].likedCars?[index].frontLeft?.url ?? '',
                  model: controller.likeResponse.value.data![0].likedCars?[index].model.toString() ?? '',
                  variant: controller.likeResponse.value.data![0].likedCars?[index].variant.toString() ?? '',
                  status: controller.likeResponse.value.data![0].likedCars?[index].status.toString() ?? '',
                ) : SizedBox(); // Placeholder widget in case of null liked car
              },
            );
          }),
        ),
      ],
    );
  }
}
