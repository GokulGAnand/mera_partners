import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/widgets/custom_order_container.dart';
import 'package:mera_partners/widgets/negotiation_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class Negotiation extends StatefulWidget {
  const Negotiation({super.key});

  @override
  State<Negotiation> createState() => _NegotiationState();
}

class _NegotiationState extends State<Negotiation> {
  NegotiationViewModel controller = Get.isRegistered<NegotiationViewModel>() ? Get.find<NegotiationViewModel>() : Get.put(NegotiationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 33,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.negotiationOrdersCategory.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          for (var element in controller.negotiationOrdersCategory) {
                            element["isClick"].value = false;
                          }
                          controller.negotiationOrdersCategory[index]["isClick"].value = true;
                          controller.isNegotiation.value = !controller.isNegotiation.value;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: MyColors.kPrimaryColor.withOpacity((controller.negotiationOrdersCategory[index]["isClick"].value) ? 1 : 0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: MyColors.kPrimaryColor)),
                          child: Text(
                            controller.negotiationOrdersCategory[index]["title"],
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (controller.negotiationOrdersCategory[index]["isClick"].value) ? Colors.white : MyColors.kPrimaryColor,
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
            controller.isNegotiation.value
                ? (controller.carListResponse.value.data != null) && controller.carListResponse.value.data!.isNotEmpty ? GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.carListResponse.value.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 18,
                  mainAxisExtent: 289,
                ),
                itemBuilder: (context, index) {
                  return Obx(() {
                    return CustomOrderContainer(
                      backgroundBlackOpacity: Obx(() {
                        if (controller.isNegotiation.value) {
                          return Container(
                            width: double.infinity,
                            height: 107,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(0.00, -1.00),
                                end: const Alignment(0, 1),
                                colors: [MyColors.black3.withOpacity(0), MyColors.black3.withOpacity(0.7)],
                              ),
                            ),
                          );
                        }
                        return Container(
                          width: double.infinity,
                          height: 107,
                          decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: MyColors.black3.withOpacity(0.4)),
                        );
                      }),
                      dealStatus: (controller.isNegotiation.value) ? "timer" : "deal lost",
                      buttonStatus: (controller.isNegotiation.value) ? "completed" : "view details",
                      buttonText: (controller.isNegotiation.value) ? MyStrings.viewOffer : MyStrings.viewDetail,
                      onPressed: () {
                        if (controller.isNegotiation.value) {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return NegotiationBottomSheet(
                                  biddedAmount: controller.carListResponse.value.data?[index].highestBid ?? 0,
                                  //todo - change the negotiation amount
                                  negotiatedAmount: controller.carListResponse.value.data?[index].highestBid ?? 0,
                                  onAcceptPressed: () {
                                    controller.acceptOrRejectOffer('accept', controller.carListResponse.value.data?[index].sId ?? '');
                                    Get.back();
                                  },
                                  onRejectPressed: () {
                                    controller.acceptOrRejectOffer('reject', controller.carListResponse.value.data?[index].sId ?? '');
                                    Get.back();
                                  },
                                );
                              });
                        } else {
                          Get.toNamed(AppRoutes.carDetailsScreen);
                        }
                      },
                      showButton: true,
                      carModel: controller.carListResponse.value.data?[index].model ?? '',
                      carName: controller.carListResponse.value.data?[index].variant ?? '',
                      carID: controller.carListResponse.value.data?[index].uniqueId.toString() ?? '',
                      imageURL: controller.carListResponse.value.data?[index].front?.url ?? '',
                      finalPrice: Constants.numberFormat.format(controller.carListResponse.value.data?[index].highestBid),
                    );
                  });
                })
                : (controller.lostDealsData.value.data != null) && controller.lostDealsData.value.data![0].lostDeal!.isNotEmpty ? Obx(() => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.lostDealsData.value.data?[0].lostDeal?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 18,
                  mainAxisExtent: 272,
                ),
                itemBuilder: (context, index) {
                  return CustomOrderContainer(
                    backgroundBlackOpacity: Container(
                      width: double.infinity,
                      height: 107,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: MyColors.black3.withOpacity(0.4)),
                    ),
                    dealStatus: "deal lost",
                    buttonStatus: "view details",
                    buttonText: MyStrings.viewDetail,
                    onPressed: () {
                      if (controller.isNegotiation.value) {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return NegotiationBottomSheet(
                                biddedAmount: controller.carListResponse.value.data?[index].highestBid ?? 0,
                                //todo - change the negotiation amount
                                negotiatedAmount: controller.carListResponse.value.data?[index].highestBid ?? 0,
                                onAcceptPressed: () {
                                  controller.acceptOrRejectOffer('accept', controller.carListResponse.value.data?[index].sId ?? '');
                                  Get.back();
                                },
                                onRejectPressed: () {
                                  controller.acceptOrRejectOffer('reject', controller.carListResponse.value.data?[index].sId ?? '');
                                  Get.back();
                                },
                              );
                            });
                      } else {
                        Get.toNamed(AppRoutes.carDetailsScreen);
                      }
                    },
                    showButton: true,
                    carModel: controller.lostDealsData.value.data?[0].lostDeal?[index].model ?? '',
                    carName: controller.lostDealsData.value.data?[0].lostDeal?[index].variant ?? '',
                    carID: controller.lostDealsData.value.data?[0].lostDeal?[index].uniqueId.toString() ?? '',
                    imageURL: controller.lostDealsData.value.data?[0].lostDeal?[index].frontLeft?.url ?? '',
                    finalPrice: Constants.numberFormat.format(controller.lostDealsData.value.data?[0].lostDeal?[index].highestBid),
                  );
                }),)
                :const Center(child: Text(MyStrings.noDataFound),)
                :const Center(child: Text(MyStrings.noDataFound),)
          ],
        )
    ));
  }
}
