import 'dart:developer';
import 'package:get/get.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view/home/my_cars/tabs/bidded_cars/bidded_cars_screen_ui.dart';
import 'package:mera_partners/view/home/my_cars/tabs/liked_cars.dart';
import 'package:mera_partners/view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_routes.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen>
    with SingleTickerProviderStateMixin {

  BidCarsListViewModel bidCarsListViewModel = 
  Get.isRegistered<BidCarsListViewModel>() 
        ? Get.find<BidCarsListViewModel>() : 
        Get.put(BidCarsListViewModel());

  late TabController tabController;
  BidCarsListViewModel controller =  Get.isRegistered<BidCarsListViewModel>()?Get.find<BidCarsListViewModel>():Get.put(BidCarsListViewModel());
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                      controller: (tabController.index == 0)?bidCarsListViewModel.bidCarsearchController : bidCarsListViewModel.likedCarsearchController,
                      onChange: (value){
                        if(tabController.index == 0){
                          bidCarsListViewModel.bidCarsearchList.clear();
                          for(int i=0; i<bidCarsListViewModel.bidCarsResponse.value.data!.length; i++){
                            if(bidCarsListViewModel.bidCarsResponse.value.data![0].biddedCars![i].model!.contains(bidCarsListViewModel.bidCarsearchController.text) || 
                              bidCarsListViewModel.bidCarsResponse.value.data![0].biddedCars![i].model!.toLowerCase().contains(bidCarsListViewModel.bidCarsearchController.text) ||
                              bidCarsListViewModel.bidCarsResponse.value.data![0].biddedCars![i].make!.contains(bidCarsListViewModel.bidCarsearchController.text) ||
                              bidCarsListViewModel.bidCarsResponse.value.data![0].biddedCars![i].make!.toLowerCase().contains(bidCarsListViewModel.bidCarsearchController.text) ||
                              bidCarsListViewModel.bidCarsResponse.value.data![0].biddedCars![i].uniqueId!.toString().toLowerCase().contains(bidCarsListViewModel.bidCarsearchController.text)){
                              bidCarsListViewModel.bidCarsearchList.add(bidCarsListViewModel.bidCarsResponse.value.data![i].sId.toString());
                              log(bidCarsListViewModel.bidCarsearchList.toString());
                            }
                          }
                        } else {
                          bidCarsListViewModel.likedCarsearchList.clear();
                          for(int i=0; i<bidCarsListViewModel.likeResponse.value.data![0].likedCars!.length; i++){
                            if(bidCarsListViewModel.likeResponse.value.data![0].likedCars![i].model!.contains(bidCarsListViewModel.likedCarsearchController.text) || 
                              bidCarsListViewModel.likeResponse.value.data![0].likedCars![i].model!.toLowerCase().contains(bidCarsListViewModel.likedCarsearchController.text) ||
                              bidCarsListViewModel.likeResponse.value.data![0].likedCars![i].make!.contains(bidCarsListViewModel.likedCarsearchController.text) ||
                              bidCarsListViewModel.likeResponse.value.data![0].likedCars![i].make!.toLowerCase().contains(bidCarsListViewModel.likedCarsearchController.text) ||
                              bidCarsListViewModel.likeResponse.value.data![0].likedCars![i].uniqueId!.toString().toLowerCase().contains(bidCarsListViewModel.likedCarsearchController.text)){
                              bidCarsListViewModel.likedCarsearchList.add(bidCarsListViewModel.likeResponse.value.data![0].likedCars![i]);
                              log(bidCarsListViewModel.likedCarsearchList.toString());
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
            Obx(() => TabBar(
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
                Tab(text: Get.isRegistered<BidCarsListViewModel>()?'${MyStrings.biddedCars}(${Get.find<BidCarsListViewModel>().bidCarsResponse.value.data?[0].biddedCars?.where((car) => car.status == CarStatus.live.name).length ?? '0'})':MyStrings.biddedCars,),
                Tab(text: Get.isRegistered<BidCarsListViewModel>()?'${MyStrings.likedCars}(${Get.find<BidCarsListViewModel>().likeResponse.value.data?[0].likedCars?.length ?? '0'})':MyStrings.likedCars,),
              ],
            ),),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  BidCarsListScreen(),
                  const Center(child: LikedCars(),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
