import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/home/account/account_view_model.dart';
import 'package:mera_partners/widgets/custom_appbar.dart';
import 'package:mera_partners/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

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
      appBar: const CustomAppBar(
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
                contentPadding: const EdgeInsets.all(0),
                minLeadingWidth: 0,
                leading: const CircleAvatar(
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
                      const Text(
                        MyStrings.customerSupport,
                        style: MyStyles.selectedTabBarTitleStyle,
                      )
                    ],
                  ),
                ),
              ),
              const Text(
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
                    const Text(
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
                              color: (globals.documentStatus?.toUpperCase() != DocumentStatus.VERIFIED.name)?MyColors.yellow :MyColors.green1,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            (globals.documentStatus?.toUpperCase() != DocumentStatus.VERIFIED.name)? MyStrings.pending :MyStrings.completed,
                            textAlign: TextAlign.center,
                            style: (globals.documentStatus != DocumentStatus.VERIFIED.name)? MyStyles.black12500 :MyStyles.white12500
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
                    const Text(
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
                    const Text(
                      MyStrings.privacyPolicy,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    SvgPicture.asset(MySvg.arrowRight)
                  ],
                ),
              ), const SizedBox(height: 12,),
              InkWell(
                onTap: (){
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      MyStrings.deleteAccount,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    SvgPicture.asset(MySvg.arrowRight)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () async{
                  showDialog(
                    context: context, 
                  builder: (context){
                    return CustomDialog(
                      title: MyStrings.logOutDesc,
                      okFun: () async{
                        bool removeVal = await SharedPrefManager.instance.removeStringAsync(Constants.phoneNum);
                        if(removeVal){
                          Get.offAllNamed(AppRoutes.loginScreen);
                        }
                      },
                      cancelFun: (){
                        Get.back();
                      },
                    );
                  });
                  
                },
                child: Row(
                  children: [
                    SvgPicture.asset(MySvg.logout),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      MyStrings.logOut,
                      style: MyStyles.subTitleBlackStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                  text: const TextSpan(children: [
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
