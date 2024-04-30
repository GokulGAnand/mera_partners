import 'dart:developer';

import 'package:get/get.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view/home/orders/tabs/negotiation.dart';
import 'package:mera_partners/view/home/orders/tabs/procured.dart';
import 'package:mera_partners/view/home/orders/tabs/rc_transfer.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/view_model/home/orders/rc_transfer_view_model.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_routes.dart';
import '../../../view_model/home/orders/procured_cars_view_model.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
      
  NegotiationViewModel negotiationScreenViewModel = Get.isRegistered<NegotiationViewModel>() 
      ? Get.find<NegotiationViewModel>() 
      : Get.put(NegotiationViewModel());

  ProcuredScreenViewModel procuredScreenViewModel = Get.isRegistered<ProcuredScreenViewModel>()
      ? Get.find<ProcuredScreenViewModel>()
      : Get.put(ProcuredScreenViewModel());

  RcTransferViewModel rcTransferViewModel = Get.isRegistered<RcTransferViewModel>()
      ? Get.find<RcTransferViewModel>()
      : Get.put(RcTransferViewModel());
      
  Rxn<TabController> tabController = Rxn();
  @override
  void initState() {
    tabController.value = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: CustomTextFormField(
                          controller: (tabController.value!.index == 0 && negotiationScreenViewModel.isNegotiation.value == true)
                          ?negotiationScreenViewModel.searchNegotiationController
                          :(tabController.value!.index == 0 && negotiationScreenViewModel.isNegotiation.value == false)
                          ?negotiationScreenViewModel.searchLostController
                          :(tabController.value!.index == 1)
                          ?procuredScreenViewModel.searchController
                          :rcTransferViewModel.searchRcTransferController,
                          onChange: (value){
                            if(tabController.value!.index == 0){
                              if(negotiationScreenViewModel.isNegotiation.value == true){
                                negotiationScreenViewModel.searchNegotiationList.clear();
                                for(int i=0; i<negotiationScreenViewModel.carListResponse.value.data!.length; i++){
                                  if(negotiationScreenViewModel.carListResponse.value.data![i].model!.contains(negotiationScreenViewModel.searchNegotiationController.text) || 
                                    negotiationScreenViewModel.carListResponse.value.data![i].model!.toLowerCase().contains(negotiationScreenViewModel.searchNegotiationController.text) ||
                                    negotiationScreenViewModel.carListResponse.value.data![i].make!.contains(negotiationScreenViewModel.searchNegotiationController.text) ||
                                    negotiationScreenViewModel.carListResponse.value.data![i].make!.toLowerCase().contains(negotiationScreenViewModel.searchNegotiationController.text) ||
                                    negotiationScreenViewModel.carListResponse.value.data![i].uniqueId!.toString().toLowerCase().contains(negotiationScreenViewModel.searchNegotiationController.text)){
                                    negotiationScreenViewModel.searchNegotiationList.add(negotiationScreenViewModel.carListResponse.value.data![i]);
                                    log(negotiationScreenViewModel.searchNegotiationList.toString());
                                  }
                                }
                              } else {
                                negotiationScreenViewModel.searchLostList.clear();
                                for(int i=0; i<negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal!.length; i++){
                                  if(negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i].model!.contains(negotiationScreenViewModel.searchLostController.text) || 
                                    negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i].model!.toLowerCase().contains(negotiationScreenViewModel.searchLostController.text) ||
                                    negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i].make!.contains(negotiationScreenViewModel.searchLostController.text) ||
                                    negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i].make!.toLowerCase().contains(negotiationScreenViewModel.searchLostController.text) ||
                                    negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i].uniqueId!.toString().toLowerCase().contains(negotiationScreenViewModel.searchLostController.text)){
                                    negotiationScreenViewModel.searchLostList.add(negotiationScreenViewModel.lostDealsData.value.data![0].lostDeal![i]);
                                    log(negotiationScreenViewModel.searchLostList.toString());
                                  }
                                }
                              }
                            }else if(tabController.value!.index == 1){
                              log(procuredScreenViewModel.searchController.text);
                              log(procuredScreenViewModel.liveCarsResponse.value.data!.length.toString());
                              procuredScreenViewModel.searchList.clear();
                              for(int i=0; i<procuredScreenViewModel.liveCarsResponse.value.data!.length; i++){
                                if(procuredScreenViewModel.liveCarsResponse.value.data![i].model!.contains(procuredScreenViewModel.searchController.text) || 
                                  procuredScreenViewModel.liveCarsResponse.value.data![i].model!.toLowerCase().contains(procuredScreenViewModel.searchController.text) ||
                                  procuredScreenViewModel.liveCarsResponse.value.data![i].make!.contains(procuredScreenViewModel.searchController.text) ||
                                  procuredScreenViewModel.liveCarsResponse.value.data![i].make!.toLowerCase().contains(procuredScreenViewModel.searchController.text) ||
                                  procuredScreenViewModel.liveCarsResponse.value.data![i].uniqueId!.toString().toLowerCase().contains(procuredScreenViewModel.searchController.text)){
                                  procuredScreenViewModel.searchList.add(procuredScreenViewModel.liveCarsResponse.value.data![i]);
                                  log(procuredScreenViewModel.searchList.toString());
                                }
                              }
                            } else {
                              rcTransferViewModel.searchRcTransferList.clear();
                              for(int i=0; i<rcTransferViewModel.liveCarsResponse.value.data!.length; i++){
                                if(rcTransferViewModel.liveCarsResponse.value.data![i].model!.contains(rcTransferViewModel.searchRcTransferController.text) || 
                                  rcTransferViewModel.liveCarsResponse.value.data![i].model!.toLowerCase().contains(rcTransferViewModel.searchRcTransferController.text) ||
                                  rcTransferViewModel.liveCarsResponse.value.data![i].make!.contains(rcTransferViewModel.searchRcTransferController.text) ||
                                  rcTransferViewModel.liveCarsResponse.value.data![i].make!.toLowerCase().contains(rcTransferViewModel.searchRcTransferController.text) ||
                                  rcTransferViewModel.liveCarsResponse.value.data![i].uniqueId!.toString().toLowerCase().contains(rcTransferViewModel.searchRcTransferController.text)){
                                  rcTransferViewModel.searchRcTransferList.add(rcTransferViewModel.liveCarsResponse.value.data![i]);
                                  log(rcTransferViewModel.searchRcTransferList.toString());
                                }
                              }
                            }
                          },
                          prefixIcon: const Icon(Icons.search),
                          borderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                          focusedBorderColor: MyColors.kPrimaryColor,
                          contentPadding: const EdgeInsets.all(8),
                          enabledBorderColor:
                              MyColors.kPrimaryColor.withOpacity(0.1),
                          fillColor: MyColors.kPrimaryColor.withOpacity(0.1),
                          validator: null),
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notificationScreen);
                      },
                      child: Container(
                        width: 50,
                        height: 44,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: MyColors.kPrimaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: MyColors.kPrimaryColor.withOpacity(0.1))
                        ),
                        child: SvgPicture.asset(MySvg.notification),
                      ),
                    )
                  ],
                ),
                TabBar(
                  controller: tabController.value,
                  labelStyle: MyStyles.selectedTabBarTitleStyle,
                  labelColor: MyColors.black,
                  unselectedLabelStyle: MyStyles.selectedTabBarTitleStyle,
                  unselectedLabelColor: MyColors.grey.withOpacity(0.5),
                  indicatorColor: MyColors.kPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  dividerColor: MyColors.grey.withOpacity(0.25),
                  dividerHeight: 2,
                  onTap: (val){
                    setState(() {});
                  },
                  tabs: const [
                    Tab(text: MyStrings.negotiation),
                    Tab(text: MyStrings.procured),
                    Tab(text: MyStrings.rcTransfer),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController.value,
                    children:  [
                      const Negotiation(),
                      Procured(),
                      Center(child: RcTransfer()),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
