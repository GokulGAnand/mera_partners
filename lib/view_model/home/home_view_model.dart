import 'package:evaluator_app/view/home/account/account_screen_ui.dart';
import 'package:evaluator_app/view/home/bids/bids_screen.dart';
import 'package:evaluator_app/view/home/my_cars/my_cars_screen.dart';
import 'package:evaluator_app/view/home/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenViewModel extends GetxController {
  List<Widget> pages = [
    const BidsScreen(),
    const MyCarsScreen(),
    const OrdersScreen(),
    const Center(child: Text("Wallet"),),
    const AccountScreen(),
  ];
  RxInt selectedIndex = 0.obs;
}