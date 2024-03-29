import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../view_model/home/orders/rc_transfer_view_model.dart';

class RcTransfer extends StatelessWidget {
   RcTransfer({super.key});

  RcTransferViewModel controller = Get.isRegistered<RcTransferViewModel>()
      ? Get.find<RcTransferViewModel>()
      : Get.put(RcTransferViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: controller.liveCarsResponse.value.data?.length,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 272,
              ),
              itemBuilder: (context, index) {
                return CustomOrderContainer(
                  // dealStatus: Text(controller.liveCarsResponse.value.data?[index].model ?? ''),
                  onPressed: (){},
                  buttonStatus: "pending",
                  buttonText: MyStrings.pending,
                  showButton: false,
                );
              }),
        ],
      ),
    );
  }
}
