import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/dimens.dart';

class LiveCarsListScreen extends StatelessWidget {
  const LiveCarsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Image.network('https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 213,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0.00, -0.00),
                            end: const Alignment(0, 1),
                            colors: [Colors.black.withOpacity(0), Colors.black],
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 26,
                        top: 185,
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: MyColors.white,
                              size: 14,
                            ),
                            Text(
                              'Kozhikode',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 296,
                        top: 8,
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                          child: const Icon(
                            Icons.heart_broken,
                            color: MyColors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 152,
                        top: 201.56,
                        child: SizedBox(
                          width: 41,
                          height: 4.56,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 4.56,
                                  height: 4.56,
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 9.11,
                                top: 0,
                                child: Container(
                                  width: 4.56,
                                  height: 4.56,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFB4B4B4),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18.22,
                                top: 0,
                                child: Container(
                                  width: 4.56,
                                  height: 4.56,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFB4B4B4),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 27.33,
                                top: 0,
                                child: Container(
                                  width: 4.56,
                                  height: 4.56,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFB4B4B4),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 36.44,
                                top: 0,
                                child: Container(
                                  width: 4.56,
                                  height: 4.56,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFB4B4B4),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 37,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment(2.00, 0.00),
                        begin: Alignment(-1, 0),
                        colors: [Color(0xFF1B69B8), Color(0x0036454F)],
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(MyStrings.highestBid, style: MyStyles.whiteTitleStyle),
                        Text('₹6,50,000', textAlign: TextAlign.center, style: MyStyles.white16700),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '2016 Duster\n', style: MyStyles.subTitleBlackStyle),
                            WidgetSpan(child: SizedBox(height: 25)),
                            TextSpan(text: '110 PS RXZ 4X2 AMT', style: MyStyles.black16700),
                          ],
                        ),
                      ),
                      Text('Rating 4.5', style: MyStyles.green14500),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Flood Affected',
                          style: TextStyle(
                            color: Color(0xFFEF3A3A),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Rusted',
                          style: TextStyle(
                            color: Color(0xFFEF3A3A),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: const BoxDecoration(color: MyColors.lightBlue),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Diesel', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('|', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('99.8k KM', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('|', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('2nd Owner', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('|', style: MyStyles.regular12),
                            SizedBox(width: 6),
                            Text('Automatic', style: MyStyles.regular12),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.copy,
                        color: MyColors.black,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('ID:73423642 ', style: MyStyles.subtitle12400),
                    ],
                  ),
                  const Text(
                    'Bid ends in',
                    style: MyStyles.orange12500,
                  ),
                  const Text('09min 06sec', style: MyStyles.orange14700),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButton(
                          buttonWidth: Dimens.buttonWidth,
                          buttonHeight: Dimens.defHeight,
                          textColor: MyColors.kPrimaryColor,
                          buttonStyle: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: MyColors.kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {},
                          buttonText: MyStrings.autoBid),
                      CustomElevatedButton(buttonWidth: Dimens.buttonWidth, buttonHeight: Dimens.defHeight, onPressed: () {}, buttonText: MyStrings.bid),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
