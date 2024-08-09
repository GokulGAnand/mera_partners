import 'dart:developer';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimens.dart';
import '../../../../view_model/home/orders/procured_bill_view_model.dart';

/// ignore: must_be_immutable
class Procured extends StatelessWidget {
  Procured({super.key});

  ProcuredScreenViewModel controller = Get.isRegistered<ProcuredScreenViewModel>() ? Get.find<ProcuredScreenViewModel>() : Get.put(ProcuredScreenViewModel());

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getProcuredBill(1);
        },
        child: 
            Padding(
              padding:  EdgeInsets.symmetric(vertical: Dimens.standard_16),
              child: controller.searchList.isNotEmpty
                  ? Obx(() {
                      return GridView.builder(
                        controller: controller.scrollController,
                          padding: const EdgeInsets.fromLTRB(16,0,16,0),
                          // physics: const NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          itemCount: controller.searchList.length + ((controller.searchController.text.isNotEmpty)?0:1).toInt(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 22,
                            mainAxisSpacing: 18,
                            mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 285 : 272,
                          ),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              if(index>=controller.liveCarsResponse.value.data!.length){
                                      if(controller.loadingMore.value == true){
                                        return Center(child: CircularProgressIndicator());
                                      } else {
                                        return const SizedBox();
                                        // return Center(child: Text(MyStrings.noMoreData, style: MyStyles.black115400,));
                                      }
                                    }
                              return CustomOrderContainer(
                                  buttonStatus: controller.searchList[index].procurementStatus == null || controller.searchList[index].procurementStatus?.toLowerCase() == Status.pending.name || controller.searchList[index].procurementStatus!.isEmpty ? Status.pending.name : Status.view.name,
                                  carModel: controller.searchList[index].model ?? '',
                                  finalPrice: controller.searchList[index].highestBid != null ? Constants.numberFormat.format(controller.searchList[index].highestBid) : '',
                                  offerPrice: controller.searchList[index].finalPrice != null ? Constants.numberFormat.format(controller.searchList[index].finalPrice) : '',
                                  carName: controller.searchList[index].variant ?? '',
                                  carID: controller.searchList[index].uniqueId?.toString() ?? '',
                                  uniqueCarID: controller.searchList[index].sId?.toString() ?? '',
                                  imageURL: controller.searchList[index].frontLeft?.url ?? '',
                                  dealStatus: OrderStatus.procurement.name,
                                  buttonText: controller.searchList[index].procurementStatus == null || controller.searchList[index].procurementStatus?.toLowerCase() == Status.pending.name || controller.searchList[index].procurementStatus!.isEmpty ? Status.pending.name : MyStrings.viewBill,
                                  showButton: true,
                                  onPressed: (controller.searchList[index].procurementStatus == null || controller.searchList[index].procurementStatus == "" || controller.searchList[index].procurementStatus?.toLowerCase() == Status.pending.name)
                                      ? null
                                      : () {
                                          FocusScope.of(context).requestFocus(FocusNode());
                                          log("View Bill button pressed.");
                                          Get.toNamed(
                                            AppRoutes.procuredBillScreen,
                                            arguments: {
                                              'finalPrice': controller.searchList[index].finalPrice != null ? controller.searchList[index].finalPrice.toString() : '0',
                                              'carModel': controller.searchList[index].model ?? '',
                                              'carName': controller.searchList[index].variant ?? '',
                                              'gst': controller.searchList[index].gst != null ? controller.searchList[index].gst.toString() : '0',
                                              'serviceFees': controller.searchList[index].serviceFees != null ? controller.searchList[index].serviceFees.toString() : '0',
                                              'totalAmount': controller.searchList[index].totalAmount != null ? controller.searchList[index].totalAmount.toString() : '0',
                                            },
                                          );
                                        });
                            });
                          });
                    })
                  : const Center(
                      child: Text(MyStrings.noDataFound),
                    ),
            )
          );
  }
}
