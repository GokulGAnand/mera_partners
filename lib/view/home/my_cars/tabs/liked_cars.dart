import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class LikedCars extends StatelessWidget {
  const LikedCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12,),
        Expanded(
          child: GridView.builder(
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:22,
              mainAxisSpacing: 18,
              mainAxisExtent: 315,
              ), 
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.subTitleColor.withOpacity(0.15),
                        blurRadius: 15.0
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                          height: 107,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                  fit: BoxFit.fill)),
                                              ),
                          Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset("assets/svg/liked.svg", width: 18,)
                      ),
                    )
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 17,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyColors.green,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Live",
                          style: TextStyle(
                                      color: MyColors.white,
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                    ),),
                          ),
                          const SizedBox(height: 8,),
                          Text("2016 Duster",
                          style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                    ),),
                          Text("110 PS RXZ 4X2 AMT",
                          style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.copy_rounded, size: 16,),
                                Text("ID:73423642 ",
                                style: TextStyle(
                                            color: MyColors.subTitleColor,
                                            fontSize: 12,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w400,
                                          ),),
                              ],
                            ),
                          ),
                          Text("Highest Bid",
                          style: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 1.5
                                    ),),
                          Text("₹6,50,000",
                          style: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                    ),),
                          const SizedBox(height: 8,),
                          SizedBox(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    onPressed: () {},
                                    buttonStyle: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(2),
                                        backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide(color: MyColors.kPrimaryColor))),
                                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                                    buttonText: "View detail",
                                    textStyle: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 2,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}