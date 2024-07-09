import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/enum.dart';
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
  NegotiationViewModel controller = Get.put(NegotiationViewModel());

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getNegotiationCarsData();
          controller.getLostDeal();
        },
        child: Obx(() => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 33,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16,0,16,0),
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
                              if (index == 0) {
                                controller.isNegotiation.value = true;
                              } else {
                                controller.isNegotiation.value = false;
                              }
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
                (controller.isNegotiation.value == true && (controller.carListResponse.value.data != null) && controller.carListResponse.value.data!.isNotEmpty)
                    ? GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(16,0,16,0),
                        itemCount: controller.searchNegotiationList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 22,
                          mainAxisSpacing: 18,
                          mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 284 : 270,
                        ),
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return CustomOrderContainer(
                              timerController: controller.searchNegotiationList[index].negotiationEndTime != null
                                  ? CountdownTimerController(
                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.searchNegotiationList[index].negotiationEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                      onEnd: controller.onEnd,
                                    ).obs
                                  : CountdownTimerController(endTime: 0).obs,
                              negEndTime: DateTime.parse(controller.searchNegotiationList[index].negotiationEndTime ?? DateTime.now().toString()),
                              negStartTime: DateTime.parse(controller.searchNegotiationList[index].negotiationStartTime ?? DateTime.now().toString()),
                              backgroundBlackOpacity:
                                  // if (controller.isNegotiation.value) {
                                  Container(
                                width: double.infinity,
                                height: 107,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: const Alignment(0.00, -1.00),
                                    end: const Alignment(0, 1),
                                    colors: [MyColors.black3.withOpacity(0), MyColors.black3.withOpacity(0.7)],
                                  ),
                                ),
                              ),
                              dealStatus: OrderStatus.negotiation.name,
                              buttonStatus: controller.searchNegotiationList[index].negotiationStatus?.toLowerCase() == Status.pending.name || ((controller.searchNegotiationList[index].negotiationStatus == null) || controller.searchNegotiationList[index].negotiationStatus!.isEmpty) ? Status.pending.name : Status.view.name,
                              buttonText: controller.searchNegotiationList[index].negotiationStatus?.toLowerCase() == Status.pending.name || ((controller.searchNegotiationList[index].negotiationStatus == null) || controller.searchNegotiationList[index].negotiationStatus!.isEmpty) ? Status.pending.name : MyStrings.viewOffer,
                              onPressed: controller.searchNegotiationList[index].negotiationStatus?.toLowerCase() == Status.pending.name || ((controller.searchNegotiationList[index].negotiationStatus == null) || controller.searchNegotiationList[index].negotiationStatus!.isEmpty)
                                  ? () => null
                                  : () {
                                      // if (controller.isNegotiation.value) {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return NegotiationBottomSheet(
                                              timerController: controller.searchNegotiationList[index].negotiationEndTime != null
                                                  ? CountdownTimerController(
                                                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(controller.searchNegotiationList[index].negotiationEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds,
                                                      onEnd: () {},
                                                    ).obs
                                                  : CountdownTimerController(endTime: 0).obs,
                                              negEndTime: DateTime.parse(controller.searchNegotiationList[index].negotiationEndTime ?? DateTime.now().toString()),
                                              negStartTime: DateTime.parse(controller.searchNegotiationList[index].negotiationStartTime ?? DateTime.now().toString()),
                                              biddedAmount: controller.searchNegotiationList[index].highestBid ?? 0,
                                              negotiatedAmount: controller.searchNegotiationList[index].negotiationAmount ?? 0,
                                              onAcceptPressed: () {
                                                controller.acceptOrRejectOffer('accept', controller.searchNegotiationList[index].sId ?? '');
                                                Get.back();
                                              },
                                              onRejectPressed: () {
                                                controller.acceptOrRejectOffer('reject', controller.searchNegotiationList[index].sId ?? '');
                                                Get.back();
                                              },
                                            );
                                          });
                                      // }
                                      // else {
                                      //   Get.toNamed(AppRoutes.carDetailsScreen);
                                      // }
                                    },
                              showButton: true,
                              carModel: controller.searchNegotiationList[index].model ?? '',
                              carName: controller.searchNegotiationList[index].variant ?? '',
                              carID: controller.searchNegotiationList[index].uniqueId != null ? controller.searchNegotiationList[index].uniqueId.toString() : '',
                              uniqueCarID: controller.searchNegotiationList[index].sId != null ? controller.searchNegotiationList[index].sId.toString() : '',
                              imageURL: controller.searchNegotiationList[index].front?.url ?? controller.searchNegotiationList[index].frontLeft?.url ?? controller.searchNegotiationList[index].frontRight?.url ?? '',
                              finalPrice: Constants.numberFormat.format(controller.searchNegotiationList[index].highestBid),
                              offerPrice: Constants.numberFormat.format(controller.searchNegotiationList[index].highestBid),
                            );
                          });
                        })
                    : (controller.isNegotiation.value == false && controller.searchLostList.isNotEmpty)
                        ? Obx(
                            () => GridView.builder(
                                padding: const EdgeInsets.fromLTRB(16,0,16,0),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.searchLostList.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 22,
                                  mainAxisSpacing: 18,
                                  mainAxisExtent: MediaQuery.of(context).size.height > 800 ? 284 : 270,
                                ),
                                itemBuilder: (context, index) {
                                  return CustomOrderContainer(
                                    backgroundBlackOpacity: Container(
                                      width: double.infinity,
                                      height: 107,
                                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: MyColors.black3.withOpacity(0.4)),
                                    ),
                                    dealStatus: OrderStatus.dealLost.name,
                                    buttonStatus: Status.view.name,
                                    buttonText: MyStrings.viewDetail,
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.carDetailsScreen, arguments: controller.searchLostList[index].sId.toString());
                                    },
                                    showButton: true,
                                    carModel: controller.searchLostList[index].model ?? '',
                                    carName: controller.searchLostList[index].variant ?? '',
                                    carID: controller.searchLostList[index].uniqueId.toString(),
                                    uniqueCarID: controller.searchLostList[index].sId.toString(),
                                    imageURL: controller.searchLostList[index].frontLeft?.url ?? '',
                                    finalPrice: Constants.numberFormat.format(controller.searchLostList[index].highestBid),
                                    offerPrice: Constants.numberFormat.format(controller.searchLostList[index].highestBid),
                                  );
                                }),
                          )
                        : const Center(
                            child: Text(MyStrings.noDataFound),
                          )
              ],
            ))));
  }
}
