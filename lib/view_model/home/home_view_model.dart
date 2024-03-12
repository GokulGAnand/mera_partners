import 'package:evaluator_app/view/home/bids/bids_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenViewModel extends GetxController {
  List<Widget> pages = [
    const BidsScreen(),
    const Center(child: Text("My Cars"),),
    const Center(child: Text("Orders"),),
    const Center(child: Text("Wallet"),),
    const Center(child: Text("Account"),),
  ];
  RxInt selectedIndex = 0.obs;
}