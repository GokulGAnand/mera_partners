import 'package:evaluator_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomOrderContainer extends StatelessWidget {
  const CustomOrderContainer({
    required this.button,
    this.dealStatus,
    super.key});
  
  final Widget button;
  final Widget? dealStatus;

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        width: double.infinity,
                      height: 107,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                              fit: BoxFit.fill)),
                              child: (dealStatus!=null)?dealStatus
                            :const SizedBox(),
                                          ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Text("Final: ₹19,99,999",
                          style: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),),
                          const SizedBox(height: 12,),
                          SizedBox(
                                  height: 40,
                                  child: button,
                                ),
                        ],
                      ),
                    ),
                    ],
                  ),
                );
  }
}