import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/dashboard/dashboard_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';

import '../../widgets/common_drawer.dart';

/// ignore: must_be_immutable
class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var viewModel = Get.isRegistered<DashBoardViewModel>()
      ? Get.find<DashBoardViewModel>()
      : Get.put(DashBoardViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: CommonAppBar(
            centerTitle: false,
            title: MyStrings.dashboard,
            leading: IconButton(
              icon: SvgPicture.asset(MyImages.menu),
              color: MyColors.black0,
              iconSize: 28,
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(MyImages.notification))
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17,top: 50),
              child: Center(
                child: CustomElevatedButton(
                  onPressed: () {

                  },
                  buttonText: MyStrings.submit,
                ),
              ),
            ),
          ),
          drawer: const CommonDrawer(),
          body: Padding(
            padding: EdgeInsets.only(
                left: Dimens.standard_16,
                right: Dimens.dp_16,
                top: Dimens.dp_30),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 29,
                  mainAxisSpacing: 29,
                  childAspectRatio: 3.5 / 3.5),
              itemCount: viewModel.dashboard.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomCard(
                  label: viewModel.dashboard[index].label ?? "",
                  icon: viewModel.dashboard[index].icon ?? "",
                  onPressed: () {},
                  cardColor: MyColors.lightBlue,
                  labelStyle: MyStyles.cardTitleStyleBlue,

                );
              },
            ),
          )),
    );
  }
}
