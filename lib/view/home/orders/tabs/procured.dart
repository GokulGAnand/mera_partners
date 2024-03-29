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
                  dealStatus: "deal won",
                  buttonStatus: "view details",
                  buttonText: MyStrings.viewBill,
                  showButton: true,
                );
              }),
        ],
      ),
    );
  }
}
