import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class LiveCarsListScreen extends StatelessWidget {
  const LiveCarsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: MyStrings.live),
      body: SafeArea(
          child: ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Positioned(
                      //   left: 205.50,
                      //   top: 402,
                      //   child: SizedBox(
                      //     width: double.maxFinite,
                      //     height: 19,
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         SizedBox(
                      //           width: 15,
                      //           height: 15,
                      //           child: Stack(
                      //             children: [
                      //               Positioned(
                      //                 left: 0,
                      //                 top: 0,
                      //                 child: Container(
                      //                   width: 15,
                      //                   height: 15,
                      //                   decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(width: 4),
                      //         const Text.rich(
                      //           TextSpan(
                      //             children: [
                      //               TextSpan(
                      //                 text: 'FMV  ',
                      //                 style: TextStyle(
                      //                   color: Color(0xFF4D535A),
                      //                   fontSize: 14,
                      //                   fontFamily: 'DM Sans',
                      //                   fontWeight: FontWeight.w400,
                      //                   height: 0.09,
                      //                 ),
                      //               ),
                      //               TextSpan(
                      //                 text: '₹8,99,999',
                      //                 style: TextStyle(
                      //                   color: Color(0xFF4D535A),
                      //                   fontSize: 14,
                      //                   fontFamily: 'DM Sans',
                      //                   fontWeight: FontWeight.w700,
                      //                   height: 0,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                            Icon(Icons.location_on_outlined,color: MyColors.white,size: 14,),
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
                      // const Positioned(
                      //   left: 12,
                      //   top: 257,
                      //   child: Text.rich(
                      //     TextSpan(
                      //       children: [
                      //         TextSpan(
                      //           text: '2016 Duster\n',
                      //           style: TextStyle(
                      //             color: Color(0xFF202831),
                      //             fontSize: 14,
                      //             fontFamily: 'DM Sans',
                      //             fontWeight: FontWeight.w400,
                      //             height: 0.09,
                      //           ),
                      //         ),
                      //         TextSpan(
                      //           text: '110 PS RXZ 4X2 AMT',
                      //           style: TextStyle(
                      //             color: Color(0xFF202831),
                      //             fontSize: 16,
                      //             fontFamily: 'DM Sans',
                      //             fontWeight: FontWeight.w700,
                      //             height: 0,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        left: 12,
                        top: 192,
                        child: SizedBox(
                          width: 12,
                          height: 12,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 251,
                        top: 278,
                        child: Container(
                          width: 80,
                          height: 18,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Rating 4.5',
                                  style: TextStyle(
                                    color: Color(0xFF138600),
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 66,
                                top: 2,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 385,
                        child: SizedBox(
                          width: 109,
                          height: 36,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 1,
                                top: 0,
                                child: Text(
                                  'Bid ends in',
                                  style: TextStyle(
                                    color: Color(0xFFFF7A00),
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 18,
                                top: 18,
                                child: Text(
                                  '09min 06sec',
                                  style: TextStyle(
                                    color: Color(0xFFFF7A00),
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 19,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 296,
                        top: 8,
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 304,
                        top: 16,
                        child: Container(
                          width: 23,
                          height: 23,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 243,
                        top: 381,
                        child: Container(
                          width: 88,
                          height: 17,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 18,
                                top: 1,
                                child: Text(
                                  'ID:73423642 ',
                                  style: TextStyle(
                                    color: Color(0xFF4D535A),
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 17,
                                          height: 17,
                                          decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 213,
                        child: Container(
                          width: 343,
                          height: 37,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 343,
                                  height: 37,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      end: Alignment(1.00, 0.00),
                                      begin: Alignment(-1, 0),
                                      colors: [Color(0xFF1B69B8), Color(0x0036454F)],
                                    ),),
                                  /*clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(1.00, 0.00),
                                      end: Alignment(-1, 0),
                                      colors: [Color(0xFF1B69B8), Color(0x0036454F)],
                                    ),
                                  ),*/
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(width: 343, height: 37),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 8,
                                child: Text(
                                  'Highest bid',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 110,
                                top: 8,
                                child: Text(
                                  '₹6,50,000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 437,
                        child: Container(
                          width: 319,
                          height: 48,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 48,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFE9F2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF1B69B8),
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Autobid',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF1B69B8),
                                                fontSize: 16,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.08,
                                                letterSpacing: 0.10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 48,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1B69B8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Bid',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.08,
                                                letterSpacing: 0.10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 309,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: Color(0xFFE9F2FA)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diesel',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '99.8k KM',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '2nd Owner',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Automatic',
                                style: TextStyle(
                                  color: Color(0xFF4D535A),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 347,
                        child: Container(
                          width: 195,
                          height: 18,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 108,
                                  height: 18,
                                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 18,
                                                top: 0,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 120,
                                top: 0,
                                child: Container(
                                  width: 63,
                                  height: 18,
                                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 18,
                                                top: 0,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 195,
                                top: 1,
                                child: Container(child: Stack(children: [

                                    ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 152,
                        top: 201.56,
                        child: Container(
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
                                  decoration: ShapeDecoration(
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
                                  decoration: ShapeDecoration(
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
                                  decoration: ShapeDecoration(
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
                                  decoration: ShapeDecoration(
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
                                  decoration: ShapeDecoration(
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
                  SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '2016 Duster\n',
                              style: TextStyle(
                                color: Color(0xFF202831),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                            WidgetSpan(
                                child: SizedBox(height: 25)),
                            TextSpan(
                              text: '110 PS RXZ 4X2 AMT',
                              style: TextStyle(
                                color: Color(0xFF202831),
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },),
      ),
    );
  }
}
