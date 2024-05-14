import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view/tutorial/tutorial_screen_ui.dart';
import 'package:mera_partners/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/view_model/home/orders/procured_bill_view_model.dart';
import 'package:mera_partners/view_model/home/orders/rc_transfer_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import '../../widgets/show_logout_dialog.dart';

class HomeScreen extends StatefulWidget {
  const   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = Get.isRegistered<HomeScreenViewModel>() ? Get.find<HomeScreenViewModel>() : Get.put(HomeScreenViewModel());

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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          showLogoutDialog(context);
        },
        child: Scaffold(
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
                        color: (homeScreenViewModel.selectedIndex.value == 0) ? MyColors.kPrimaryColor : MyColors.grey,
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
                        color: (homeScreenViewModel.selectedIndex.value == 1) ? MyColors.kPrimaryColor : MyColors.grey,
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
                        color: (homeScreenViewModel.selectedIndex.value == 2) ? MyColors.kPrimaryColor : MyColors.grey,
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
                        color: (homeScreenViewModel.selectedIndex.value == 3) ? MyColors.kPrimaryColor : MyColors.grey3,
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
                        color: (homeScreenViewModel.selectedIndex.value == 4) ? MyColors.kPrimaryColor : MyColors.grey,
                      ),
                    ),
                    label: "Account"),
              ],
              onTap: (index) {
                if (index == 1) {
                  if (Get.isRegistered<BidCarsListViewModel>()) {
                    Get.delete<BidCarsListViewModel>();
                  } else {}
                  homeScreenViewModel.selectedIndex.value = index;
                } else if (index == 2) {
                  homeScreenViewModel.selectedIndex.value = index;
                  if (Get.isRegistered<NegotiationViewModel>()) {
                    Get.delete<NegotiationViewModel>();
                  }
                  if (Get.isRegistered<ProcuredScreenViewModel>()) {
                    Get.delete<ProcuredScreenViewModel>();
                  }
                  if (Get.isRegistered<RcTransferViewModel>()) {
                    Get.delete<RcTransferViewModel>();
                  }
                } else if (index != 3) {
                  homeScreenViewModel.selectedIndex.value = index;
                }
              },
            );
          }),
        ));
  }
}
