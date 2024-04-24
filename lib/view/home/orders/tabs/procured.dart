import 'dart:developer';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimens.dart';
import '../../../../view_model/home/orders/procured_cars_view_model.dart';

/// ignore: must_be_immutable
class Procured extends StatelessWidget {
   Procured({super.key});
   ProcuredScreenViewModel controller = Get.isRegistered<ProcuredScreenViewModel>()
      ? Get.find<ProcuredScreenViewModel>()
      : Get.put(ProcuredScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
            SizedBox(
            height: Dimens.standard_16,
          ),
          controller.searchList.isNotEmpty ?
          Obx(
            () {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:   controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 18,
                    mainAxisExtent: 272,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () {
                        return CustomOrderContainer(
                            buttonStatus: "view details",
                            carModel: controller.searchList[index].model ?? '',
                            finalPrice: controller.searchList[index].highestBid.toString() ?? '',
                            carName: controller.searchList[index].variant ?? '',
                            carID: controller.searchList[index].uniqueId?.toString() ?? '',
                            imageURL: controller.searchList[index].frontLeft?.url ?? '',
                            dealStatus: "deal won",
                            buttonText: MyStrings.viewBill,
                            showButton: true,
                            onPressed: () {
                              log("View Bill button pressed.");
                              Get.toNamed(AppRoutes.procuredBillScreen,
                                arguments: {
                                  'finalPrice': controller.searchList[index].highestBid.toString(),
                                  'carModel': controller.searchList[index].model ?? '',
                                  'carName': controller.searchList[index].make ?? '',
                                },
                        
                              );
                            });
                      }
                    );
              
                  });
            }
          ):
              const Center(child: Text(MyStrings.noDataFound),)
        ],
    );
  }
}
