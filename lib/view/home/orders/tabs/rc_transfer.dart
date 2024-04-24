import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/view/home/my_cars/tabs/liked_cars.dart';
import '../../../../utils/dimens.dart';
import '../../../../view_model/home/orders/rc_transfer_view_model.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';

class RcTransfer extends StatelessWidget {
  RcTransfer({super.key,});

  final RcTransferViewModel controller = Get.isRegistered<RcTransferViewModel>()
      ? Get.find<RcTransferViewModel>()
      : Get.put(RcTransferViewModel());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: Dimens.standard_16,
        ),
        (controller.liveCarsResponse.value.data != null) && controller.liveCarsResponse.value.data!.isNotEmpty ? GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.liveCarsResponse.value.data?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            mainAxisSpacing: 18,
            mainAxisExtent: 272,
          ),
          itemBuilder: (context, index) {
            return CustomOrderContainer(
              buttonStatus: "pending",
              carID: controller.liveCarsResponse.value.data?[index].uniqueId?.toString() ?? '',
              finalPrice: controller.liveCarsResponse.value.data?[index].highestBid.toString() ?? '',
              carModel: controller.liveCarsResponse.value.data?[index].model ?? '',
              carName: controller.liveCarsResponse.value.data?[index].make ?? '',
              imageURL: controller.liveCarsResponse.value.data?[index].frontLeft?.url ?? '',
              button: CustomElevatedButton(
                onPressed: () {},
                buttonStyle: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(2),
                  backgroundColor: MyColors.green3,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide.none,
                  ),
                ),
                buttonColor: MyColors.green3,
                buttonText: MyStrings.completed,
                textStyle: MyStyles.white14500,
              ),
              showButton: false,
            );
          },
        ):const Center(child: Text(MyStrings.noDataFound),),
      ],
    );
  }
}
