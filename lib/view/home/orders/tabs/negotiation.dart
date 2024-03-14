import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/view/home/orders/orders_screen.dart';
import 'package:evaluator_app/view_model/home/orders/orders_view_model.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Negotiation extends StatefulWidget {
  const Negotiation({super.key});

  @override
  State<Negotiation> createState() => _NegotiationState();
}

class _NegotiationState extends State<Negotiation> {
  OrderScreenViewModel orderScreenViewModel =
      Get.isRegistered<OrderScreenViewModel>()
          ? Get.find<OrderScreenViewModel>()
          : Get.put(OrderScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 33,
            margin: EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: orderScreenViewModel.negotiationOrdersCategory.length,
              itemBuilder: (context, index){
                return Obx(
                  () {
                    return GestureDetector(
                      onTap: (){
                        orderScreenViewModel.negotiationOrdersCategory.forEach((element) {element["isClick"].value = false;});
                        orderScreenViewModel.negotiationOrdersCategory[index]["isClick"].value = true;
                        orderScreenViewModel.isNegotiation.value = !orderScreenViewModel.isNegotiation.value;
                      },
                      child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    margin: EdgeInsets.only(right: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                      color: MyColors.kPrimaryColor.withOpacity((orderScreenViewModel.negotiationOrdersCategory[index]["isClick"].value)?1:0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColors.kPrimaryColor)
                                    ),
                                    child: Text(
                      orderScreenViewModel.negotiationOrdersCategory[index]["title"],
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (orderScreenViewModel.negotiationOrdersCategory[index]["isClick"].value)?Colors.white:MyColors.kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                                    ),
                                  ),
                    );
                  }
                );
              }),
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
                  dealStatus: Obx(
                    () {
                      if(orderScreenViewModel.isNegotiation.value){
                        return Container(
                        // width: double.infinity,
                        height: 25,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-1.00, 0.00),
                            end: Alignment(1, 0),
                            colors: [Color(0xFFEF3B3B), Color(0x0036454F)],
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/timer.svg",
                              width: 18,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "29min 59sec",
                              style: TextStyle(
                                color: MyColors.white,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      );
                      }
                      return Container(
                              // width: double.infinity,
                              height: 25,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: MyColors.warning,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/deal_lost.svg", width: 18,),
                                  const SizedBox(width: 3,),
                                  Text("Deal Lost",
                                                            style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 16,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                          ),),
                                ],
                              ),
                            );
                      
                    }
                  ),
                  button: Obx(
                    () {
                      if(orderScreenViewModel.isNegotiation.value){
                        return CustomElevatedButton(
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
                      );
                      }
                      return CustomElevatedButton(
                                    onPressed: () {},
                                    buttonStyle: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(2),
                                        backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide(color: MyColors.kPrimaryColor))),
                                    buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                                    buttonText: "View details",
                                    textStyle: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 2,
                                    ),
                                  );
                    }
                  ),
                );
              }),
        ],
      ),
    );
  }
}
