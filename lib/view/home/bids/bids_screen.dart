import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/home/otb/otb_view_model.dart';
import 'package:mera_partners/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  late TabController tabController;
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
                      controller: TextEditingController(), 
                      prefixIcon: const Icon(Icons.search),
                      borderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      focusedBorderColor: MyColors.kPrimaryColor,
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      fillColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      validator: null),
                  )),
                const SizedBox(width: 15,),
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
              tabs: [
                Tab(text: '${MyStrings.live}(${Get.find<LiveCarsListViewModel>().liveCarsResponse.value.count ?? '0'})',),
                Tab(text: '${MyStrings.otb}(${Get.find<OTBCarsListViewModel>().carsListResponse.value.count ?? '0'})',),
              ],
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
      ),
    );
  }
}