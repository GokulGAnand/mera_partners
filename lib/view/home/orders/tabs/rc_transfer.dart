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
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.liveCarsResponse.value.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 272,
              ),
              itemBuilder: (context, index) {
                return CustomOrderContainer(
                  dealStatus: Text(controller.liveCarsResponse.value.data?[index].model ?? ''),
                  button: CustomElevatedButton(
                    onPressed: () {},
                    buttonStyle: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2),
                        backgroundColor: MyColors.green3,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide.none)),
                    buttonColor: MyColors.green3,
                    buttonText: MyStrings.completed,
                    textStyle: MyStyles.white14500,
                  ), showButton: false,
                );
              }),
        ],
      ),
    );
  }
}
