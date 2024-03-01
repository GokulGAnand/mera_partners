import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/dashboard/dashboard_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      child: Obx(() => PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Get.toNamed(AppRoutes.pendingEvaluationScreen);
        },
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
                                  return Obx(
                                    () {
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
                                        cardColor: viewModel.dashboard[index].isComplete!.value ?MyColors.blue:MyColors.lightBlue,
                                        labelStyle: viewModel.dashboard[index].isComplete!.value ? MyStyles.cardTitleStyle: MyStyles.cardTitleStyleBlue,
                                      );
                                    }
                                  );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 17, top: 17,bottom: 30),
                    child: Center(
                      child: CustomElevatedButton(
                        onPressed: viewModel.isEvaluated.value ?() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Container(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    color: MyColors.blue,
                                    child: const Center(child: Text(
                                      MyStrings.ratingTitle
                                    )),
                                  ),
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: EdgeInsets.zero,
                                  titleTextStyle: MyStyles.ratingTitleStyle,
                                  titlePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide.none
                                  ),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                            shrinkWrap:true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            viewModel.ratingList[index].title
                                                        ),
                                                        RatingBar.builder(
                                                          initialRating: viewModel.ratingList[index].rating,
                                                          minRating: 1,
                                                          direction: Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                                                          itemBuilder: (context, _) => const Icon(
                                                            Icons.star,
                                                            color: MyColors.yellow,
                                                          ),
                                                          onRatingUpdate: (rating) {
                                                            viewModel.ratingList[index].rating = rating;
                                                          },
                                                        ),

                                                      ],
                                                    ),
                                                    const Divider()
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: viewModel.ratingList.length,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomElevatedButton(
                                              buttonWidth: MediaQuery.of(context).size.width * 0.8,
                                              onPressed: () {
                                              viewModel.addRating();
                                            }, buttonText: MyStrings.submit,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                          );
                        }:null,
                        buttonText: MyStrings.submit,
                      ),
                    ),
                  ),
                ],
              )),
      ),
      ),
    );
  }
}
