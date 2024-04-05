import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/dimens.dart';
import '../../../../view_model/orders/procured_view_model.dart';

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
                  carModel: controller.liveCarsResponse.value.data?[index].model?? '',
                  finalPrice: controller.liveCarsResponse.value.data?[index].highestBid.toString()??'',
                  carName: controller.liveCarsResponse.value.data?[index].make?? '',
                  carID: controller.liveCarsResponse.value.data?[index].uniqueId?.toString()??  '',
                  imageURL: controller.liveCarsResponse.value.data?[index].frontLeft?.url ?? '',
                  dealStatus: Container(
                    // width: double.infinity,
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: MyColors.green3,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          MySvg.dealWon,
                          width: 18,
                        ),
                         SizedBox(
                          width: Dimens.standard_3,
                        ),
                        const Text(
                          MyStrings.dealWon,
                          style: MyStyles.whiteTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  button: CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.procuredBill,
                        arguments: {
                          'finalPrice': controller.liveCarsResponse.value.data?[index].highestBid.toString(),
                          'carModel': controller.liveCarsResponse.value.data?[index].model ?? '',
                          'carName': controller.liveCarsResponse.value.data?[index].make ?? '',
                        }
                      );
                    },
                    buttonStyle: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                        backgroundColor:
                            MyColors.kPrimaryColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(color: MyColors.kPrimaryColor))),
                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                    buttonText: MyStrings.viewBill,
                    textStyle: MyStyles.primary14500,
                  ), showButton: true,
                );
              }),
        ],

    );
  }
}
