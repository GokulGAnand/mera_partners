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
          controller.getRcTransfer();
        },
        child: ListView(
          children: [
            SizedBox(
              height: Dimens.standard_16,
            ),
            Obx(() {
              if (controller.searchRcTransferList.isNotEmpty) {
                return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.searchRcTransferList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 18,
                    mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 285 : 272,
                  ),
                  itemBuilder: (context, index) {
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
                  },
                );
              }
              return const Center(
                child: Text(MyStrings.noDataFound),
              );
            })
          ],
        ));
  }
}
