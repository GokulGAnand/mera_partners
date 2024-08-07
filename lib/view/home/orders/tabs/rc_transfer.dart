import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/dimens.dart';
import '../../../../utils/enum.dart';
import '../../../../view_model/home/orders/rc_transfer_view_model.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';

class RcTransfer extends StatelessWidget {
  RcTransfer({
    super.key,
  });

  final RcTransferViewModel controller = Get.isRegistered<RcTransferViewModel>() ? Get.find<RcTransferViewModel>() : Get.put(RcTransferViewModel());

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getRcTransfer(1);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.standard_16),
          child: Obx(() {
            if (controller.searchRcTransferList.isNotEmpty) {
              return GridView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.fromLTRB(16,0,16,0),
                itemCount: controller.searchRcTransferList.length + ((controller.searchRcTransferController.text.isNotEmpty)?0:1).toInt(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 18,
                  mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 285 : 272,
                ),
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      if(index>=controller.liveCarsResponse.value.data!.length){
                                      if(controller.loadingMore.value == true){
                                        return Center(child: CircularProgressIndicator());
                                      } else {
                                        return const SizedBox();
                                        // return Center(child: Text(MyStrings.noMoreData, style: MyStyles.black115400,));
                                      }
                                    }
                      return CustomOrderContainer(
                        buttonStatus: Status.completed.name,
                        carID: controller.searchRcTransferList[index].uniqueId?.toString() ?? '',
                        uniqueCarID: controller.searchRcTransferList[index].sId?.toString() ?? '',
                        finalPrice: controller.searchRcTransferList[index].highestBid != null ? Constants.numberFormat.format(controller.searchRcTransferList[index].highestBid) : '',
                        offerPrice: controller.searchRcTransferList[index].finalPrice != null ? Constants.numberFormat.format(controller.searchRcTransferList[index].finalPrice) : '',
                        carModel: controller.searchRcTransferList[index].model ?? '',
                        carName: controller.searchRcTransferList[index].make ?? '',
                        imageURL: controller.searchRcTransferList[index].frontLeft?.url ?? '',
                        showButton: true,
                        dealStatus: '',
                        buttonText: MyStrings.completed,
                      );
                    }
                  );
                },
              );
            }
            return const Center(
              child: Text(MyStrings.noDataFound),
            );
          }),
        ));
  }
}
