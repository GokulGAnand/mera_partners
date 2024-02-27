import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      initiallyExpanded: true,
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
                  onTap: () {
                    showDialog(context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: MyStrings.logoutConfirmMsg,
                            okFun: () {
                              Get.offAllNamed(AppRoutes.loginScreen);
                            },
                            cancelFun: () {
                              Navigator.pop(context);
                            },
                          );
                        },);
                  },
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
    );
  }
}
