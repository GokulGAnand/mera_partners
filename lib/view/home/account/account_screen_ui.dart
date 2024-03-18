import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Account",
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
                  'MeraUser',
                  style: MyStyles.pageTitleStyle,
                ),
                subtitle: Text(
                  'ID: MU3546',
                  style: MyStyles.grey2_12400,
                ),
              ),
              Divider(
                color: MyColors.subTitleColor.withOpacity(0.25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  children: [
                    SvgPicture.asset(MySvg.call),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Customer Support',
                      style: MyStyles.selectedTabBarTitleStyle,
                    )
                  ],
                ),
              ),
              Text(
                'Account Settings',
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
                      'Document verification',
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          color: MyColors.green1,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Completed',
                        textAlign: TextAlign.center,
                        style: MyStyles.white12500
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
                      'About Us',
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
                      'Privacy Policy',
                      style: MyStyles.subTitleBlackStyle,
                    ),
                    SvgPicture.asset(MySvg.arrowRight)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SvgPicture.asset(MySvg.logout),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'LogOut',
                    style: MyStyles.subTitleBlackStyle,
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Mera Partners',
                  style: MyStyles.grey16400
                ),
                TextSpan(
                  text: ' v0.1',
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
