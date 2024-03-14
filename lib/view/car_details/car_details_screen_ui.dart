import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: SafeArea(
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
      ),
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
