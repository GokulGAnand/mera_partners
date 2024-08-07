import 'dart:developer';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/home/otb/otb_view_model.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../view_model/home/live/live_cars_list_view_model.dart';
import '../live/live_cars_list_screen.dart';
import '../otb/otb_screen_ui.dart';

class BidsScreen extends StatefulWidget {
  const BidsScreen({super.key});

  @override
  State<BidsScreen> createState() => _BidsScreenState();
}

class _BidsScreenState extends State<BidsScreen> with SingleTickerProviderStateMixin{

  LiveCarsListViewModel liveCarListViewModel =
      Get.isRegistered<LiveCarsListViewModel>()
          ? Get.find<LiveCarsListViewModel>() :
          Get.put(LiveCarsListViewModel());

  OTBCarsListViewModel otbCarsListViewModel = Get.isRegistered<OTBCarsListViewModel>()
          ? Get.find<OTBCarsListViewModel>() :
          Get.put(OTBCarsListViewModel());

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    liveCarListViewModel.searchController.addListener(() {
      setState(() {});
    });

    otbCarsListViewModel.searchController.addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CustomTextFormField(
                      controller: (tabController.index == 0)
                          ? liveCarListViewModel.searchController
                          : otbCarsListViewModel.searchController,
                      onChange: (value) {
                        if (tabController.index == 0) {
                          liveCarListViewModel.searchList.clear();
                          for (int i = 0; i < liveCarListViewModel.liveCarsResponse.value.data!.length; i++) {
                            if (liveCarListViewModel.liveCarsResponse.value.data![i].model!.toLowerCase().contains(liveCarListViewModel.searchController.text.toLowerCase()) ||
                                liveCarListViewModel.liveCarsResponse.value.data![i].make!.toLowerCase().contains(liveCarListViewModel.searchController.text.toLowerCase()) ||
                                liveCarListViewModel.liveCarsResponse.value.data![i].variant!.toLowerCase().contains(liveCarListViewModel.searchController.text.toLowerCase()) ||
                                liveCarListViewModel.liveCarsResponse.value.data![i].uniqueId!.toString().toLowerCase().contains(liveCarListViewModel.searchController.text.toLowerCase())) {
                              liveCarListViewModel.searchList.add(liveCarListViewModel.liveCarsResponse.value.data![i].sId.toString());
                              log(liveCarListViewModel.searchList.toString());
                            }
                          }
                          liveCarListViewModel.update();
                        } else {
                          otbCarsListViewModel.searchList.clear();
                          for (int i = 0; i < otbCarsListViewModel.carsListResponse.value.data!.length; i++) {
                            if (otbCarsListViewModel.carsListResponse.value.data![i].model!.toLowerCase().contains(otbCarsListViewModel.searchController.text.toLowerCase()) ||
                                otbCarsListViewModel.carsListResponse.value.data![i].make!.toLowerCase().contains(otbCarsListViewModel.searchController.text.toLowerCase()) ||
                                otbCarsListViewModel.carsListResponse.value.data![i].variant!.toLowerCase().contains(otbCarsListViewModel.searchController.text.toLowerCase()) ||
                                otbCarsListViewModel.carsListResponse.value.data![i].uniqueId!.toString().toLowerCase().contains(otbCarsListViewModel.searchController.text.toLowerCase())) {
                              otbCarsListViewModel.searchList.add(otbCarsListViewModel.carsListResponse.value.data![i].sId.toString());
                              log(otbCarsListViewModel.searchList.toString());
                            }
                          }
                          otbCarsListViewModel.update();
                        }
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: (tabController.index == 0
                          ? liveCarListViewModel.searchController.text.isNotEmpty
                          : otbCarsListViewModel.searchController.text.isNotEmpty)
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          if (tabController.index == 0) {
                            liveCarListViewModel.searchController.clear();
                            liveCarListViewModel.searchList.clear();
                            liveCarListViewModel.isShowFullList.value = true;
                            liveCarListViewModel.update();
                          } else {
                            otbCarsListViewModel.searchController.clear();
                            otbCarsListViewModel.searchList.clear();
                            otbCarsListViewModel.isShowFullList.value = true;
                            otbCarsListViewModel.update();
                          }
                          FocusScope.of(context).unfocus();
                        },
                      )
                          : null,
                      borderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      focusedBorderColor: MyColors.kPrimaryColor,
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      fillColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      validator: null,
                    )
                  )),
                const SizedBox(width: 15,),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
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
          ),
          Obx(() => Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TabBar(
                controller: tabController,
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
                tabs: [
                  Tab(text: '${MyStrings.live}(${Get.find<LiveCarsListViewModel>().liveCarsResponse.value.count ?? '0'})',),
                  Tab(text: '${MyStrings.otb}(${Get.find<OTBCarsListViewModel>().carsListResponse.value.count ?? '0'})',),
                ],
              ),
            ),
          ),),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      LiveCarsListScreen(),
                      OTBScreen(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}