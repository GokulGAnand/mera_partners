import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../tutorial/tutorial_screen_ui.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/view_model/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = Get.isRegistered<HomeScreenViewModel>()
      ? Get.find<HomeScreenViewModel>()
      : Get.put(HomeScreenViewModel());

  @override
  void initState() {
    // showDialog(
    //   barrierDismissible: false,
    //   context: Get.context!,
    //   builder: (context) => AlertDialog(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //     backgroundColor: MyColors.white,
    //     content: TutorialScreen(),
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Obx(() {
        return homeScreenViewModel.pages[homeScreenViewModel.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: homeScreenViewModel.selectedIndex.value,
          selectedLabelStyle: MyStyles.primary12400,
          unselectedLabelStyle: MyStyles.grey12400,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    MySvg.bids,
                    color: (homeScreenViewModel.selectedIndex.value == 0) ?MyColors.kPrimaryColor: MyColors.grey,
                  ),
                ),
                label: "Bids"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    MySvg.myCars,
                    color: (homeScreenViewModel.selectedIndex.value == 1) ?MyColors.kPrimaryColor: MyColors.grey,
                  ),
                ),
                label: "My Cars"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    MySvg.orders,
                    color: (homeScreenViewModel.selectedIndex.value == 2) ?MyColors.kPrimaryColor: MyColors.grey,
                  ),
                ),
                label: "Orders"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    MySvg.wallet,
                    color: (homeScreenViewModel.selectedIndex.value == 3) ?MyColors.kPrimaryColor: MyColors.grey,
                  ),
                ),
                label: "Wallet"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    MySvg.account,
                    color: (homeScreenViewModel.selectedIndex.value ==4) ?MyColors.kPrimaryColor: MyColors.grey,
                  ),
                ),
                label: "Account"),
          ],
          onTap: (index) {
            homeScreenViewModel.selectedIndex.value = index;
          },
        );
      }),
    );
  }
}
