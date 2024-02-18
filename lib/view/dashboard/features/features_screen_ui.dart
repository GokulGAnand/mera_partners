import 'package:evaluator_app/view_model/dashboard/features/feature_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ignore: must_be_immutable
class FeaturesScreen extends StatelessWidget {
  FeaturesScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  FeatureViewModel viewModel = Get.find<FeatureViewModel>();


  Widget pageOne() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page1Key,
            child: Column(),
          ),
        ),
      ),
    );
  }

  Widget pageTwo() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page2Key,
            child: Column(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
