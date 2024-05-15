import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final double bottomSheetHeight = screenHeight * 0.44;

    return Container(
      height: 210,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimens.standard_20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.07,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyColors.grey,
              ),
            ),
          ),
          SizedBox(height: Dimens.standard_20),
          const Text(
            MyStrings.customerSupport,
            textAlign: TextAlign.center,
            style: MyStyles.black18700,
          ),
          const SizedBox(height: 15,),
          InkWell(
              onTap: (){
                _lauchCalllog();
              },
              child: helpDetails(MySvg.call, MyStrings.callUs, "+91 99999 99999")),
          Divider(color: MyColors.black.withOpacity(0.11),),
          InkWell(
              onTap: (){
                _launchEmail();
              },
              child: helpDetails(MySvg.mail, MyStrings.mailUs, "support@meracars.com")),
        ],
      ),
    );
  }

  Widget helpDetails(String svg, String title, String data){
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(svg, color: MyColors.kPrimaryColor,),
                    const SizedBox(width: 8,),
                    Text(title,
                    style: MyStyles.primary16700,),
                  ],
                ),
                Text(data,
                style: MyStyles.black16500,)
              ],
            ),
          );
  }
  _lauchCalllog() async {
    const phoneNumber = '+91 9999999999';
    const url = 'tel:$phoneNumber';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    const email = 'support@meracars.com';
    const url = 'mailto:$email';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}