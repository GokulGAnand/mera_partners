import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/home/home_screen_view_model.dart';
import 'package:evaluator_app/view_model/pending_evaluation/pending_evaluation_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:evaluator_app/widgets/custom_app_bar.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/images.dart';
import '../../utils/globals.dart' as globals;
import '../../utils/methods.dart';

/// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var viewModel = Get.isRegistered<HomeScreenViewModel>() ? Get.find<HomeScreenViewModel>() : Get.put(HomeScreenViewModel());

  /*Widget _buildTelevisionSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 36),
      decoration: BoxDecoration(
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            color: MyColors.black900.withOpacity(0.11),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11),
          CustomAppBar1(
            height: 25,
            leadingWidth: 45,
            leading: IconButton(
              icon: SvgPicture.asset(MyImages.menu),
              color: MyColors.black0,
              iconSize: 28,
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: MyStrings.keraCarsEvaluator,
                    style: MyStyles.cardTitleStyle,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            actions: [
              Padding(
                padding: Dimens.padding16,
                child: SvgPicture.asset(
                  MyImages.notification,
                  width: Dimens.standard_24,
                  height: Dimens.standard_24,
                ),
              ),
            ],
          ),
          SizedBox(height: 42),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: ListTile(
            leading: SizedBox(
              width: Dimens.standard_41,
              height: Dimens.standard_41,
              child: SvgPicture.asset(
                MyImages.profile,
              ),
            ),
            title: Text(
              globals.userName != null ? globals.userName ?? "" : "",
              style: const TextStyle(color: MyColors.blueDark, fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.24),
            ),
            subtitle: Text(globals.city != null ? globals.city ?? "" : "", style: MyStyles.locationStyle),
          ),
        ),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Methods.showLogOutConfirmDialog(context);
        },
        child: Scaffold(
          key: _key,
          appBar: CustomAppBar(
            title: MyStrings.meraCarsEvaluator,
            leading: IconButton(
              icon: SvgPicture.asset(MyImages.menu),
              color: MyColors.black0,
              iconSize: 28,
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: Dimens.padding16,
                    child: SvgPicture.asset(
                      MyImages.notification,
                      width: Dimens.standard_24,
                      height: Dimens.standard_24,
                    ),
                  ),
                ],
              )
            ],
            bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * .1),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: ListTile(
                    leading: SizedBox(
                      width: Dimens.standard_41,
                      height: Dimens.standard_41,
                      child: SvgPicture.asset(
                        MyImages.profile,
                      ),
                    ),
                    title: Text(
                      globals.userName != null ? globals.userName ?? "" : "",
                      style: const TextStyle(color: MyColors.blueDark, fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.24),
                    ),
                    subtitle: Text(globals.city != null ? globals.city ?? "" : "", style: MyStyles.locationStyle),
                  ),
                )),
          ),
          drawer: const CommonDrawer(),
          body: Padding(
            padding: Dimens.padding16,
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(2.0, 0, 0, 20),
                      child: Text(
                        MyStrings.categories,
                        style: MyStyles.bodyTitleStyle,
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 29, mainAxisSpacing: 29, childAspectRatio: 3.5 / 3.8),
                    itemCount: viewModel.homeList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        label: viewModel.homeList[index].label ?? "",
                        icon: viewModel.homeList[index].icon ?? "",
                        cardColor: MyColors.blue,
                        onPressed: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.newEvaluationScreen);
                          } else if (index == 1) {
                            if (Get.isRegistered<PendingEvaluationViewModel>()) {
                              Get.delete<PendingEvaluationViewModel>();
                            }
                            Get.toNamed(AppRoutes.pendingEvaluationScreen);
                          }else if(index == 2){
                            Get.toNamed(AppRoutes.completedEvaluationScreen);
                          }
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
