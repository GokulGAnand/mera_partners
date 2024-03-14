import 'package:evaluator_app/utils/colors.dart';
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
          const SizedBox(height: 12,),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:22,
              mainAxisSpacing: 18,
              mainAxisExtent: 272,
              ), 
              itemBuilder: (context, index){
                return CustomOrderContainer(
                  button: CustomElevatedButton(
                                    onPressed: () {},
                                    buttonStyle: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(2),
                                        backgroundColor: Color(0XFF1CB975),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide.none)),
                                    buttonColor: Color(0XFF1CB975),
                                    buttonText: "Completed",
                                    textStyle: TextStyle(
                                      color: MyColors.white,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 2,
                                    ),
                                  ),
                );
              }),
        ],
      ),
    );
  }
}