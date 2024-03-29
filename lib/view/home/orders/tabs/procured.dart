import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
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
                        const Text(
                          MyStrings.dealWon,
                          style: MyStyles.whiteTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  button: CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.procuredBill);
                    },
                    buttonStyle: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                        backgroundColor:
                            MyColors.kPrimaryColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(color: MyColors.kPrimaryColor))),
                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                    buttonText: MyStrings.viewBill,
                    textStyle: MyStyles.primary14500,
                  ), showButton: true,
                );
              }),
        ],
      ),
    );
  }
}
