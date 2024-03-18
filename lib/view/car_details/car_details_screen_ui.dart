import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> rating = [
    {"title": "Document", "rating": 1.0},
    {"title": "Exterior", "rating": 4.5},
    {"title": "Interior & Electrical", "rating": 3.0},
    {"title": "Engine", "rating": 1.5}
  ];
  late TabController tabController;

  bool playVideo = false;

  late VideoPlayerController videoController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    videoController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    videoController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Container(
        width: 343,
        height: 501,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 343,
                height: 501,
                child: Stack(
                  children: [
                    Positioned(
                      left: 205.50,
                      top: 402,
                      child: Container(
                        width: 123,
                        height: 19,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'FMV  ',
                                    style: TextStyle(
                                      color: Color(0xFF4D535A),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '₹8,99,999',
                                    style: TextStyle(
                                      color: Color(0xFF4D535A),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 343,
                        height: 213,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.black.withOpacity(0), Colors.black],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 26,
                      top: 191,
                      child: Text(
                        'Kozhikode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 257,
                      child: Text.rich(
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
                    ),
                    Positioned(
                      left: 12,
                      top: 192,
                      child: Container(
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
                            Positioned(
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
                                child: Column(
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
                      child: Container(
                        width: 109,
                        height: 36,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 0,
                              child: Text(
                                'Bid ends in',
                                style: TextStyle(
                                  color: Color(0xFFFF7A00),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
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
                                    begin: Alignment(1.00, 0.00),
                                    end: Alignment(-1, 0),
                                    colors: [Colors.black, Colors.black.withOpacity(0)],
                                  ),
                                ),
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
                                'Scheduled bid',
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
      ),
      /*body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 134,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin:  Alignment(0.00, 0.00),
                    end:  Alignment(1, 0),
                    colors: <Color>[MyColors.kPrimaryColor, MyColors.white]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2016 Duster",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    "110 PS RXZ 4X2 AMT",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    "₹19,99,999",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 22,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "INSPECTION REPORT",
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 66,
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      // boxShadow:
                    ),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: rating.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  rating[index]["title"],
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: (rating[index]["rating"] >= 4.5)
                                          ? MyColors.green1
                                          : (rating[index]["rating"] >= 3.0)
                                              ? MyColors.yellow
                                              : MyColors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Text(
                                        rating[index]["rating"].toString(),
                                        style: TextStyle(
                                          color: MyColors.white,
                                          fontSize: 11,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      SvgPicture.asset("assets/svg/star.svg")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Documents",
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 2,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "RC Availability",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Yes. Original",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 400,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exterior",
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 2,
                            ),
                          ),
                          TabBar(
                            controller: tabController,
                            labelStyle: MyStyles.selectedTabBarTitleStyle,
                            labelColor: MyColors.black,
                            unselectedLabelStyle:
                                MyStyles.selectedTabBarTitleStyle,
                            unselectedLabelColor:
                                MyColors.grey.withOpacity(0.5),
                            indicatorColor: MyColors.kPrimaryColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 4,
                            dividerColor: MyColors.grey.withOpacity(0.25),
                            dividerHeight: 2,
                            tabs: const [
                              Tab(text: "View 7 Issues"),
                              Tab(text: "Other Parts"),
                            ],
                          ),
                          Flexible(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Center(child: viewIssue()),
                                Center(child: otherIssue()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        (videoController.value.isInitialized)
                                      ? AspectRatio(
                                          aspectRatio: videoController.value.aspectRatio,
                                          child: VideoPlayer(videoController),
                                        )
                                      : Container(),
                          InkWell(
                            onTap: (){
                              if(playVideo == false){
                                videoController.play();
                                playVideo = true;
                              } else {
                                videoController.pause();
                                playVideo = false;
                              }
                              setState(() {});
                            },
                            child: Icon((playVideo == false)?Icons.play_arrow_rounded:Icons.pause_rounded, size: 50, color: Colors.white,))
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),*/
    );
  }

  Widget viewIssue() {
    return Container(
      width: double.infinity,
      height: 142,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: MyColors.containerBG, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: MyColors.warning,
                          child: SvgPicture.asset(
                            "assets/svg/car_crash.svg",
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Front Left Door",
                          style: TextStyle(
                            color: MyColors.black,
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: CustomElevatedButton(
                              onPressed: () {},
                              buttonStyle: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(2),
                                  backgroundColor: MyColors.warning,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              buttonColor: MyColors.warning,
                              buttonText: "Damaged",
                              textStyle: TextStyle(
                                color: MyColors.white,
                                fontSize: 12,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: CustomElevatedButton(
                              onPressed: () {},
                              buttonStyle: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(2),
                                  backgroundColor: MyColors.warning,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              buttonColor: MyColors.warning,
                              buttonText: "Repaired",
                              textStyle: TextStyle(
                                color: MyColors.white,
                                fontSize: 12,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 75,
                height: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.fill)),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Front left door is fully damaged due to a major accident,customer says they will fix",
            style: TextStyle(
              color: MyColors.black,
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              // height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget otherIssue() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "Power Windows",
          style: TextStyle(
            color: MyColors.black,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            // height: 2,
          ),
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: MyColors.green1,
                child: SvgPicture.asset(
                  "assets/svg/no_crash.svg",
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Text(
                "All Working",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  // height: 2,
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
