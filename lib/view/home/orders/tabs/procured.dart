import 'package:evaluator_app/utils/colors.dart';
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
                  dealStatus: Container(
                              // width: double.infinity,
                              height: 25,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color(0XFF1CB975),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/deal_won.svg", width: 18,),
                                  const SizedBox(width: 3,),
                                  Text("Deal Won",
                                                            style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                          ),),
                                ],
                              ),
                            ),
                  button: CustomElevatedButton(
                                    onPressed: () {},
                                    buttonStyle: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(2),
                                        backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide(color: MyColors.kPrimaryColor))),
                                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                                    buttonText: "View bill",
                                    textStyle: TextStyle(
                                      color: MyColors.kPrimaryColor,
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