import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LikedCars extends StatelessWidget {
  const LikedCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 18,
                mainAxisExtent: 315,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: MyColors.subTitleColor.withOpacity(0.15),
                            blurRadius: 15.0)
                      ]),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 107,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            width: double.infinity,
                            height: 107,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  MyColors.black3.withOpacity(0),
                                  MyColors.black3.withOpacity(0.7)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  MySvg.liked,
                                  width: 18,
                                )),
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
                                  color: MyColors.green1,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Live",
                                style: MyStyles.white12500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "2016 Duster",
                              style: MyStyles.black12400,
                            ),
                            Text(
                              "110 PS RXZ 4X2 AMT",
                              style: MyStyles.black14700,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.copy_rounded,
                                    size: 16,
                                  ),
                                  Text(
                                    "ID:73423642 ",
                                    style: MyStyles.subtitle12400,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              MyStrings.highestBid,
                              style: MyStyles.primary12500,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text("₹6,50,000", style: MyStyles.primary16500),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 40,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.carDetailsScreen);
                                },
                                buttonStyle: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(2),
                                    backgroundColor:
                                        MyColors.kPrimaryColor.withOpacity(0.1),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: BorderSide(
                                            color: MyColors.kPrimaryColor))),
                                buttonColor:
                                    MyColors.kPrimaryColor.withOpacity(0.3),
                                buttonText: MyStrings.viewDetail,
                                textStyle: MyStyles.primary14500,
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
