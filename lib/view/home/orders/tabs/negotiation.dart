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
                return CustomOrderContainer(
                  imageURL: '',
                  carID: '',
                  carName: '',
                  carModel: '',
                  finalPrice: '',
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
                  dealStatus: Obx(() {
                    if (orderScreenViewModel.isNegotiation.value) {
                      return Container(
                        // width: double.infinity,
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-0.5, 0.00),
                            end: Alignment(2, 0),
                            colors: [MyColors.warning, MyColors.black5],
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              MySvg.timer,
                              width: 18,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "29min 59sec",
                              style: MyStyles.white14700,
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      // width: double.infinity,
                      height: 25,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: MyColors.warning,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MySvg.dealLost,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            MyStrings.dealLost,
                            style: MyStyles.whiteTitleStyle,
                          ),
                        ],
                      ),
                    );
                  }),
                  button: Obx(() {
                    if (orderScreenViewModel.isNegotiation.value) {
                      return CustomElevatedButton(
                        onPressed: () {
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
                        },
                        buttonStyle: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(2),
                            backgroundColor: MyColors.green3,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide.none)),
                        buttonColor: MyColors.green3,
                        buttonText: MyStrings.viewOffer,
                        textStyle: MyStyles.white14500,
                      );
                    }
                    return CustomElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.carDetailsScreen);
                      },
                      buttonStyle: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(2),
                          backgroundColor:
                              MyColors.kPrimaryColor.withOpacity(0.1),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(color: MyColors.kPrimaryColor))),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.viewDetail,
                      textStyle: MyStyles.primary14500,
                    );
                  }), showButton: true,
                );
              }),
        ],
      ),
    );
  }
}
