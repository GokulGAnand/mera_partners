// ignore_for_file: deprecated_member_use

import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view/tutorial/tutorial_screen_ui.dart';
import 'package:evaluator_app/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tutorial/tutorial_screen_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = Get.isRegistered<HomeScreenViewModel>()
      ? Get.find<HomeScreenViewModel>()
      : Get.put(HomeScreenViewModel());


  bool _tutorialShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTutorial();
    });
  }

  Future<void> _checkTutorial() async {
    if (!_tutorialShown) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool shown = prefs.getBool('tutorialShown') ?? false;
      if (!shown) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            backgroundColor: MyColors.white,
            content: TutorialScreen(),
          ),
        ).then((_) {
          _markTutorialAsShown();
        });
      }
    }
  }

  Future<void> _markTutorialAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorialShown', true);
    setState(() {
      _tutorialShown = true;
    });
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
                    color: (homeScreenViewModel.selectedIndex.value == 3) ?MyColors.kPrimaryColor: MyColors.grey3,
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
          if(index!=3){
              homeScreenViewModel.selectedIndex.value = index;
            }else{

            }
            
          },
        );
      }),
    );
  }
}
