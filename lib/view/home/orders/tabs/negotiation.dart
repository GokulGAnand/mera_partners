import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/home/orders/orders_view_model.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:evaluator_app/widgets/negotiation_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Negotiation extends StatefulWidget {
  const Negotiation({super.key});

  @override
  State<Negotiation> createState() => _NegotiationState();
}

class _NegotiationState extends State<Negotiation> {
  OrderScreenViewModel orderScreenViewModel =
      Get.isRegistered<OrderScreenViewModel>()
          ? Get.find<OrderScreenViewModel>()
          : Get.put(OrderScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 33,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    orderScreenViewModel.negotiationOrdersCategory.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return GestureDetector(
                      onTap: () {
                        for (var element in orderScreenViewModel.negotiationOrdersCategory) {
                          element["isClick"].value = false;
                        }
                        orderScreenViewModel
                            .negotiationOrdersCategory[index]["isClick"]
                            .value = true;
                        orderScreenViewModel.isNegotiation.value =
                            !orderScreenViewModel.isNegotiation.value;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColors.kPrimaryColor.withOpacity(
                                (orderScreenViewModel
                                        .negotiationOrdersCategory[index]
                                            ["isClick"]
                                        .value)
                                    ? 1
                                    : 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: MyColors.kPrimaryColor)),
                        child: Text(
                          orderScreenViewModel.negotiationOrdersCategory[index]
                              ["title"],
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: (orderScreenViewModel
                                    .negotiationOrdersCategory[index]["isClick"]
                                    .value)
                                ? Colors.white
                                : MyColors.kPrimaryColor,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  });
                }),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
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
                      backgroundBlackOpacity: Obx(() {
                        if (orderScreenViewModel.isNegotiation.value) {
                          return Container(
                            width: double.infinity,
                            height: 107,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(0.00, -1.00),
                                end: const Alignment(0, 1),
                                colors: [
                                  MyColors.black3.withOpacity(0),
                                  MyColors.black3.withOpacity(0.7)
                                ],
                              ),
                            ),
                          );
                        }
                        return Container(
                          width: double.infinity,
                          height: 107,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: MyColors.black3.withOpacity(0.4)),
                        );
                      }),
                      dealStatus: (orderScreenViewModel.isNegotiation.value)?"timer":"deal lost",
                      buttonStatus: (orderScreenViewModel.isNegotiation.value)?"completed":"view details",
                      buttonText:  (orderScreenViewModel.isNegotiation.value)?MyStrings.viewOffer:MyStrings.viewDetail,
                      onPressed: (){
                        if (orderScreenViewModel.isNegotiation.value) {
                           showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return const NegotiationBottomSheet(
                                    biddedAmount: 173000,
                                    negotiatedAmount: 193000,
                                  );
                                });
                        } else {
                          Get.toNamed(AppRoutes.carDetailsScreen);
                        }
                      },
                      showButton: true,
                    );
                  }), showButton: true,
                );
              }),
        ],
      ),
    );
  }
}
