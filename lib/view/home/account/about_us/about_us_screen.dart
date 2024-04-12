import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: MyStrings.aboutUs),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'About MeraCars\n\n',
                      style: MyStyles.grey14500,
                    ),
                    TextSpan(
                      text:
                          'MeraCars, a venture under the umbrella of Teamtach Media Private Limited, is revolutionizing the way second-hand cars are bought and sold. With our cutting-edge app, we have streamlined the process of bidding for pre-owned vehicles, catering specifically to both established and emerging car dealers.\n\n',
                      style: MyStyles.subtitle12400,
                    ),
                    // TextSpan(
                    //   text: 'Why do we use it?\n\n',
                    //   style: MyStyles.grey14500,
                    // ),
                    TextSpan(
                      text:'At MeraCars, we understand the challenges faced by dealers in sourcing quality used cars at competitive prices. Our platform offers a solution that brings transparency, efficiency, and convenience to the bidding process. Through our intuitive app, dealers can access a vast inventory of pre-owned vehicles, submit bids, and secure deals seamlessly, all from the palm of their hand.',
                      style: MyStyles.subtitle12400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
