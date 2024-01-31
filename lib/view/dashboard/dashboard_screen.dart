import 'package:evaluator_app/view_model/dashboard/dashboard_view_model.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../widgets/custom_app_bar.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  var viewModel = Get.isRegistered<DashBoardViewModel>()
      ? Get.find<DashBoardViewModel>()
      : Get.put(DashBoardViewModel());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
   // add appbar here
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
                  // title: Text(
                  //   viewModel.validateUserResponse != null
                  //       ? viewModel
                  //               .validateUserResponse!.data!.first.fullname ??
                  //           ""
                  //       : "",
                  //   style: const TextStyle(
                  //       color: MyColors.blueDark,
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w700,
                  //       letterSpacing: 0.24),
                  // ),
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
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
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
                              // title: Text(
                              //   viewModel.validateUserResponse != null
                              //       ? viewModel.validateUserResponse!.data!
                              //           .first.contactNo
                              //           .toString()
                              //       : "",
                              //   style: MyStyles.greyMediumStyle,
                              // ),
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
                              // title: Text(
                              //   viewModel.validateUserResponse != null
                              //       ? viewModel.validateUserResponse!.data!
                              //               .first.email ??
                              //           ""
                              //       : "",
                              //   style: MyStyles.greyMediumStyle,
                              // ),
                            ),
                            const Divider(color: MyColors.transparent1),
                            ListTile(
                              leading: SvgPicture.asset(
                                MyImages.location,
                                width: 16.25,
                                height: 16.25,
                              ),
                              // title: Text(
                              //   viewModel.validateUserResponse != null
                              //       ? viewModel.validateUserResponse!.data!
                              //               .first.city ??
                              //           ""
                              //       : "",
                              //   style: MyStyles.greyMediumStyle,
                              // ),
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
        body:

            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 29,
                  mainAxisSpacing: 29,
                  childAspectRatio: 3.5 / 3.8),
              itemCount: viewModel.dashboard.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomCard(
                  label: viewModel.dashboard[index].label ?? "",
                  icon: viewModel.dashboard[index].icon ?? "",
                  onPressed: () {},
                );
              },
            )

      ),
    );
  }
}
