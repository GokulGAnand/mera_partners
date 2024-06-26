import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import '../../../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../../../widgets/liked_cars_widget.dart';

class LikedCars extends StatelessWidget {
  const LikedCars({super.key});

  @override
  Widget build(BuildContext context) {
    final BidCarsListViewModel controller = Get.find<BidCarsListViewModel>();

    return Column(
      children: [
        const SizedBox(height: 12),
        Expanded(
          child: Obx(
            () {
              if(controller.likedCarsearchList.isEmpty){
                return const Center(child: Text(MyStrings.noDataFound),);
              }
              return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16,8,16,8),
                  itemCount: controller.likedCarsearchList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 18,
                    mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 320 : 300,
                  ),
                  itemBuilder: (context, index) {
                   return Obx(
                     () {
                       return LikedCarsWidget(
                         timerController: controller.likedCarsearchList[index].status?.toLowerCase() == CarStatus.scheduled.name ?
                         CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.likedCarsearchList[index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs
                             : controller.likedCarsearchList[index].status?.toLowerCase() == CarStatus.otb.name?
                         CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.likedCarsearchList[index].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs
                             : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.likedCarsearchList[index].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs,
                         bidAmount: controller.likedCarsearchList[index].highestBid != null ? Constants.numberFormat.format(controller.likedCarsearchList[index].highestBid ?? 0) : '0',
                         id: controller.likedCarsearchList[index].uniqueId.toString(),
                         carId: controller.likedCarsearchList[index].sId.toString(),
                         imageUrl: controller.likedCarsearchList[index].frontLeft?.url ?? '',
                         model: controller.likedCarsearchList[index].model.toString(),
                         variant: controller.likedCarsearchList[index].variant.toString(),
                         status: controller.likedCarsearchList[index].status.toString(),
                         otbPrice: controller.likedCarsearchList[index].status?.toLowerCase() == CarStatus.otb.name ? Constants.numberFormat.format(controller.likedCarsearchList[index].realValue ?? 0) : '',
                         bidStartTime: DateTime.parse(controller.likedCarsearchList[index].bidStartTime ?? DateTime.now().toString()),
                         bidEndTime: DateTime.parse(controller.likedCarsearchList[index].bidEndTime ?? DateTime.now().toString()),
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
