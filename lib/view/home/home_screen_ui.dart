import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = Get.isRegistered<HomeScreenViewModel>() ? Get.find<HomeScreenViewModel>() : Get.put(HomeScreenViewModel());

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
          selectedLabelStyle:  TextStyle(
            color: MyColors.blue,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextStyle(
            color: MyColors.disableTextColor,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  height: 40,
                  child: SvgPicture.asset(
                    "assets/svg/bids.svg",
                    color: (homeScreenViewModel.selectedIndex.value == 0) ?MyColors.blue: MyColors.disableTextColor,
                  ),
                ),
                label: "Bids"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/svg/my_cars.svg",
                    color: (homeScreenViewModel.selectedIndex.value == 1) ?MyColors.blue: MyColors.disableTextColor,
                  ),
                ),
                label: "My Cars"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/svg/orders.svg",
                    color: (homeScreenViewModel.selectedIndex.value == 2) ?MyColors.blue: MyColors.disableTextColor,
                  ),
                ),
                label: "Orders"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/svg/wallet.svg",
                    color: (homeScreenViewModel.selectedIndex.value == 3) ?MyColors.blue: MyColors.disableTextColor,
                  ),
                ),
                label: "Wallet"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/svg/account.svg",
                    color: (homeScreenViewModel.selectedIndex.value ==4) ?MyColors.blue: MyColors.disableTextColor,
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