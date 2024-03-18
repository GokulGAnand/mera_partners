import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Procured extends StatelessWidget {
  const Procured({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 272,
              ),
              itemBuilder: (context, index) {
                return CustomOrderContainer(
                  dealStatus: Container(
                    // width: double.infinity,
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: MyColors.green3,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          MySvg.dealWon,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Deal Won",
                          style: MyStyles.whiteTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  button: CustomElevatedButton(
                    onPressed: () {},
                    buttonStyle: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2),
                        backgroundColor:
                            MyColors.kPrimaryColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(color: MyColors.kPrimaryColor))),
                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                    buttonText: "View bill",
                    textStyle: MyStyles.primary14500,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
