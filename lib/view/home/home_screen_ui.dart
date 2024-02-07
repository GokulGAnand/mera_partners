import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/home/home_screen_view_model.dart';
import 'package:evaluator_app/widgets/custom_app_bar.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/images.dart';
import '../../utils/globals.dart' as globals;

/// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var viewModel = Get.isRegistered<HomeScreenViewModel>() ? Get.find<HomeScreenViewModel>() : Get.put(HomeScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(
          title: MyStrings.keraCarsEvaluator,
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
        drawer: Drawer(
          backgroundColor: MyColors.white,
          width: MediaQuery.of(context).size.width * 0.77,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 29, 0, 21),
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
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimens.standard_12,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          MyStrings.accountSettings,
                          style: MyStyles.greyStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: MyColors.grey,
                          title: const Text(
                            MyStrings.userDetails,
                            style: MyStyles.blackTitleStyle,
                          ),
                          children: <Widget>[
                            ListTile(
                              leading: SvgPicture.asset(
                                MyImages.mobile,
                                width: 16.25,
                                height: 16.25,
                              ),
                              title: Text(
                                globals.contactNo != null ? globals.contactNo.toString() : "",
                                style: MyStyles.greyMediumStyle,
                              ),
                            ),
                            const Divider(
                              color: MyColors.transparent1,
                            ),
                            ListTile(
                              leading: SvgPicture.asset(
                                MyImages.mail,
                                width: 16.25,
                                height: 16.25,
                              ),
                              title: Text(
                                globals.email != null ? globals.email ?? "" : "",
                                style: MyStyles.greyMediumStyle,
                              ),
                            ),
                            const Divider(color: MyColors.transparent1),
                            ListTile(
                              leading: SvgPicture.asset(
                                MyImages.location,
                                width: 16.25,
                                height: 16.25,
                              ),
                              title: Text(
                                globals.city != null ? globals.city ?? "" : "",
                                style: MyStyles.greyMediumStyle,
                              ),
                            ),
                            const Divider(color: MyColors.transparent1),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Text(
                        MyStrings.changePassword,
                        style: MyStyles.blackTitleStyle,
                      ),
                      trailing: SvgPicture.asset(
                        MyImages.arrowRight,
                        width: Dimens.standard_24,
                        height: Dimens.standard_24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        MyImages.logout,
                        width: 19,
                        height: 19,
                      ),
                      title: const Text(
                        MyStrings.signOut,
                        style: MyStyles.blackTitleStyle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
                          Get.toNamed(AppRoutes.pendingEvaluationScreen);
                        }
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
