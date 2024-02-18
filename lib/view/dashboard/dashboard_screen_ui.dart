import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
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
  var id = Get.arguments ?? '';
  DashBoardScreen({super.key,});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var viewModel = Get.isRegistered<DashBoardViewModel>() ? Get.find<DashBoardViewModel>() : Get.put(DashBoardViewModel());

  @override
  Widget build(BuildContext context) {
    log(id ?? '');
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
            actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))],
          ),
          /*bottomNavigationBar: SizedBox(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 50),
              child: Center(
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonText: MyStrings.submit,
                ),
              ),
            ),
          ),*/
          drawer: const CommonDrawer(),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: Dimens.standard_16, right: Dimens.dp_16, top: Dimens.dp_30),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 29, mainAxisSpacing: 29, childAspectRatio: 3.5 / 3.5),
                    itemCount: viewModel.dashboard.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        label: viewModel.dashboard[index].label ?? "",
                        icon: viewModel.dashboard[index].icon ?? "",
                        onPressed: () {
                          if(index == 0){
                            Get.toNamed(AppRoutes.documentScreen,arguments: id);
                          }else if(index == 1){
                            Get.toNamed(AppRoutes.exteriorScreen,arguments: id);
                          }else if(index == 2){
                            Get.toNamed(AppRoutes.engineScreen,arguments: id);
                          }else if(index == 3){
                            Get.toNamed(AppRoutes.interiorScreen,arguments: id);
                          }else if(index == 4){
                            Get.toNamed(AppRoutes.testDriveScreen,arguments: id);
                          }else if(index == 5){
                            Get.toNamed(AppRoutes.featuresScreen,arguments: id);
                          }else if(index == 6){
                            Get.toNamed(AppRoutes.airConditioningScreen,arguments: id);
                          }else if(index == 7){
                            Get.toNamed(AppRoutes.specialCommentsScreen,arguments: id);
                          }
                        },
                        cardColor: viewModel.dashboard[index].isComplete! ?MyColors.blue:MyColors.lightBlue,
                        labelStyle: MyStyles.cardTitleStyleBlue,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 17,bottom: 30),
                child: Center(
                  child: CustomElevatedButton(
                    onPressed: () {},
                    buttonText: MyStrings.submit,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
