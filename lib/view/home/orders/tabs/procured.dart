import 'dart:developer';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimens.dart';
import '../../../../view_model/orders/procured_view_model.dart';

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
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:   controller.liveCarsResponse.value.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 272,
              ),
              itemBuilder: (context, index) {
                return CustomOrderContainer(
                    buttonStatus: "view details",
                    carModel: controller.liveCarsResponse.value.data?[index].model ?? '',
                    finalPrice: controller.liveCarsResponse.value.data?[index].highestBid.toString() ?? '',
                    carName: controller.liveCarsResponse.value.data?[index].variant ?? '',
                    carID: controller.liveCarsResponse.value.data?[index].uniqueId?.toString() ?? '',
                    imageURL: controller.liveCarsResponse.value.data?[index].frontLeft?.url ?? '',
                    dealStatus: "deal won",
                    buttonText: MyStrings.viewBill,
                    showButton: true,
                    onPressed: () {
                      log("View Bill button pressed.");
                      Get.toNamed(AppRoutes.procuredBillScreen,
                        arguments: {
                          'finalPrice': controller.liveCarsResponse.value.data?[index].highestBid.toString(),
                          'carModel': controller.liveCarsResponse.value.data?[index].model ?? '',
                          'carName': controller.liveCarsResponse.value.data?[index].make ?? '',
                        },

                      );
                    });

              })],
    );
  }
}
