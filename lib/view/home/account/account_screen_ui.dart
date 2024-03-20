import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/shared_pref_manager.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/home/account/account_view_model.dart';
import 'package:evaluator_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountScreenViewModel accountScreenViewModel =
      Get.isRegistered<AccountScreenViewModel>()
          ? Get.find<AccountScreenViewModel>()
          : Get.put(AccountScreenViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.account,
        appBarHeight: 105,
        showBackIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 0,
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: MyColors.white,
                  backgroundImage: AssetImage(MyImages.profile),
                ),
                title: Text(
                  globals.userName.toString(),
                  style: MyStyles.pageTitleStyle,
                ),
                subtitle: Text(
                  'ID: ${globals.userId.toString()}',
                  style: MyStyles.grey2_12400,
                ),
              ),
              Divider(
                color: MyColors.subTitleColor.withOpacity(0.25),
              ),
              InkWell(
                onTap: () async{
                  await accountScreenViewModel.launchCaller();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(MySvg.call),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        MyStrings.customerSupport,
                        style: MyStyles.selectedTabBarTitleStyle,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                MyStrings.accountSettings,
                style: MyStyles.grey2_14500,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(MySvg.documentVerify),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      MyStrings.documentVerification,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              color: (globals.isDocumentsVerified! == false)?MyColors.yellow :MyColors.green1,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            (globals.isDocumentsVerified == false)? MyStrings.pending :MyStrings.completed,
                            textAlign: TextAlign.center,
                            style: (globals.isDocumentsVerified  == false)? MyStyles.black12500 :MyStyles.white12500
                          ),
                        )
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.aboutUsScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.aboutUs,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    SvgPicture.asset(MySvg.arrowRight)
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.privacyPolicy,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    SvgPicture.asset(MySvg.arrowRight)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () async{
                  bool removeVal = await SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
                  if(removeVal){
                    Get.offAllNamed(AppRoutes.loginScreen);
                  }
                },
                child: Row(
                  children: [
                    SvgPicture.asset(MySvg.logout),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      MyStrings.logOut,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: MyStrings.meraPartners,
                  style: MyStyles.grey16400
                ),
                TextSpan(
                  text: ' ${MyStrings.version}',
                  style: MyStyles.grey16500,
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
