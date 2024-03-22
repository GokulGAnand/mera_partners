import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';

class RcTransfer extends StatelessWidget {
  const RcTransfer({super.key});

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
                  button: CustomElevatedButton(
                    onPressed: () {},
                    buttonStyle: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                        backgroundColor: MyColors.green3,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide.none)),
                    buttonColor: MyColors.green3,
                    buttonText: MyStrings.completed,
                    textStyle: MyStyles.white14500,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
