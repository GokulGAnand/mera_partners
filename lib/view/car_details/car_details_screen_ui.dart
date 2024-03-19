import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/car_details/car_details_view_model.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with TickerProviderStateMixin {
  CarDetailsScreenViewModel carDetailsScreenViewModel =
      Get.isRegistered<CarDetailsScreenViewModel>()
          ? Get.find<CarDetailsScreenViewModel>()
          : Get.put(CarDetailsScreenViewModel());

  @override
  void initState() {
    carDetailsScreenViewModel.exteriorTabController =
        TabController(length: 2, vsync: this);
    carDetailsScreenViewModel.interiorElectricalTabController =
        TabController(length: 2, vsync: this);
    carDetailsScreenViewModel.engineTabController =
        TabController(length: 2, vsync: this);
    carDetailsScreenViewModel.acTabController =
        TabController(length: 2, vsync: this);
    carDetailsScreenViewModel.testDriveTabController =
        TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    carDetailsScreenViewModel.videoController.pause();
    super.dispose();
  }

  Widget page1() {
    return SingleChildScrollView(
      controller: carDetailsScreenViewModel.page1ScrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 258,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                  left: 12,
                  top: 12,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(MySvg.arrowBack))),
              Positioned(
                left: 12,
                bottom: 12,
                child: Row(
                  children: [
                    SvgPicture.asset(MySvg.distance),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('Kozhikode', style: MyStyles.white11400)
                  ],
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 37,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment(2.00, 0.00),
                begin: Alignment(-1, 0),
                colors: [MyColors.kPrimaryColor, MyColors.black5],
              ),
            ),
            child: Row(
              children: [
                Text(
                  MyStrings.highestBid,
                  textAlign: TextAlign.center,
                  style: MyStyles.whiteTitleStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '₹6,50,000',
                  textAlign: TextAlign.center,
                  style: MyStyles.white16700,
                )
              ],
            ),
          ),
          Container(
            color: MyColors.white,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    '2016 Duster',
                    style: MyStyles.selectedTabBarTitleStyle,
                  ),
                  subtitle: Text(
                    '110 PS RXZ 4X2 AMT',
                    style: MyStyles.black16700,
                  ),
                  trailing: SvgPicture.asset(
                    MySvg.liked,
                    width: 23,
                  ),
                ),
                // const SizedBox(height: 8,),
                Container(
                  height: 20,
                  color: MyColors.lightBlue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 4; i++) ...[
                            Text(
                              'Diesel',
                              style: MyStyles.regular12,
                            ),
                            (i != 3)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: VerticalDivider(
                                      width: 15,
                                      color: MyColors.subTitleColor,
                                      thickness: 1,
                                    ),
                                  )
                                : const SizedBox(),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carDetailsScreenViewModel.imageList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.galleryScreen);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    SizedBox(
                                      width: 62,
                                      height: 62,
                                    ),
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                              fit: BoxFit.fill)),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: MyColors.red2,
                                        child: Text(
                                          '99+',
                                          style: MyStyles.white8700,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  carDetailsScreenViewModel.imageList[index],
                                  style: MyStyles.black12400,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SvgPicture.asset(MySvg.carTag),
                    const SizedBox(
                      width: 8,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: MyStrings.fmv,
                            style: MyStyles.subTitleGreayStyle,
                          ),
                          TextSpan(
                            text: '  ₹8,92,000',
                            style: MyStyles.grey14700,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: MyColors.white,
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
            margin: EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.criticalIssue,
                  style: MyStyles.black14700,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    for (int i = 0; i < 4; i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, top: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(MySvg.warning),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Flood Affected",
                              style: MyStyles.red2_12700,
                            )
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Front left door is fully damaged due to a major \naccident,customer says they will fix',
                  style: MyStyles.black12400,
                )
              ],
            ),
          ),
          inspectionReport(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.documents,
                  style: MyStyles.black12700,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "RC Availability",
                        textAlign: TextAlign.left,
                        style: MyStyles.black12400,
                      ),
                    ),
                    Expanded(
                      child: Text("Yes. Original",
                          textAlign: TextAlign.left,
                          style: MyStyles.black12400),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget page2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            carDetailsScreenViewModel.pageIndex.value = 0;
          },
          child: Container(
            width: double.infinity,
            height: 134,
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1, 0),
                  end: Alignment(2.00, 0.00),
                  colors: <Color>[MyColors.kPrimaryColor, MyColors.black5]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2016 Duster",
                  style: MyStyles.white14500,
                ),
                const SizedBox(height: 3,),
                Text(
                  "110 PS RXZ 4X2 AMT",
                  style: MyStyles.white16700,
                ),
                const SizedBox(height: 12,),
                Text(
                  "₹19,99,999",
                  style: MyStyles.titleStyle,
                )
              ],
            ),
          ),
        ),
        inspectionReport(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  key: carDetailsScreenViewModel.documentKey,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyStrings.documents,
                        style: MyStyles.black12700,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "RC Availability",
                              textAlign: TextAlign.left,
                              style: MyStyles.black12400,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Yes. Original",
                              textAlign: TextAlign.left,
                              style: MyStyles.black12400,
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
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: inspectionReportTabBar(
                          carDetailsScreenViewModel.exteriorKey,
                          carDetailsScreenViewModel.exteriorTabController,
                          850,
                          MyStrings.exterior,
                          carDetailsScreenViewModel.exteriorShowMore, () {
                        carDetailsScreenViewModel.exteriorShowMore.value =
                            !carDetailsScreenViewModel.exteriorShowMore.value;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: inspectionReportTabBar(
                          carDetailsScreenViewModel.interiorElectricalKey,
                          carDetailsScreenViewModel
                              .interiorElectricalTabController,
                          850,
                          MyStrings.interiorAndElectrical,
                          carDetailsScreenViewModel.interiorShowMore, () {
                        carDetailsScreenViewModel.interiorShowMore.value =
                            !carDetailsScreenViewModel.interiorShowMore.value;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: inspectionReportTabBar(
                          carDetailsScreenViewModel.engineKey,
                          carDetailsScreenViewModel.engineTabController,
                          850,
                          MyStrings.engine,
                          carDetailsScreenViewModel.engineShowMore, () {
                        carDetailsScreenViewModel.engineShowMore.value =
                            !carDetailsScreenViewModel.engineShowMore.value;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: inspectionReportTabBar(
                          carDetailsScreenViewModel.acKey,
                          carDetailsScreenViewModel.acTabController,
                          850,
                          MyStrings.ac,
                          carDetailsScreenViewModel.acShowMore, () {
                        carDetailsScreenViewModel.acShowMore.value =
                            !carDetailsScreenViewModel.acShowMore.value;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: inspectionReportTabBar(
                          carDetailsScreenViewModel.testDriveKey,
                          carDetailsScreenViewModel.testDriveTabController,
                          850,
                          MyStrings.testDrive,
                          carDetailsScreenViewModel.testDriveShowMore, () {
                        carDetailsScreenViewModel.testDriveShowMore.value =
                            !carDetailsScreenViewModel.testDriveShowMore.value;
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 111.0),
          child: Obx(() {
            if (carDetailsScreenViewModel.pageIndex.value == 0) {
              return page1();
            }
            return page2();
          }),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 111,
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  MySvg.timer,
                  width: 18,
                  color: MyColors.green2,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "24min 06sec",
                  style: MyStyles.green2_14700,
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
                    height: 47,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(2),
                          backgroundColor:
                              MyColors.kPrimaryColor.withOpacity(0.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(color: MyColors.kPrimaryColor))),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.autoBid,
                      textStyle: MyStyles.primary16500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 47,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(2),
                          backgroundColor: MyColors.kPrimaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(color: MyColors.kPrimaryColor))),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.bid,
                      textStyle: MyStyles.whiteTitleStyle,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget inspectionReport() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.inspectionReport,
            style: MyStyles.black12700,
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 66,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  // boxShadow:
                ),
              ),
              Container(
                width: 92,
                height: 66,
                decoration: BoxDecoration(
                    color: MyColors.blue2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
              ),
              SizedBox(
                height: 66,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: carDetailsScreenViewModel.rating.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if (carDetailsScreenViewModel.pageIndex.value == 1) {
                            await carDetailsScreenViewModel.scrollItem(index);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                carDetailsScreenViewModel.rating[index]
                                    ["title"],
                                style: MyStyles.black12500,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              (index == 0)
                                  ? const SizedBox()
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      margin: EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: (carDetailsScreenViewModel
                                                          .rating[index]
                                                      ["rating"] >=
                                                  4.0)
                                              ? MyColors.green1
                                              : (carDetailsScreenViewModel
                                                              .rating[index]
                                                          ["rating"] >=
                                                      2.5)
                                                  ? MyColors.yellow
                                                  : MyColors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        children: [
                                          Text(
                                            carDetailsScreenViewModel
                                                .rating[index]["rating"]
                                                .toString(),
                                            style: MyStyles.white11500,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SvgPicture.asset(
                                              MySvg.star)
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget inspectionReportTabBar(
      GlobalKey<State<StatefulWidget>> scrollGlobalKey,
      TabController tabController,
      double height,
      String title,
      RxBool showMore,
      Function()? onTap) {
    return Container(
      key: scrollGlobalKey,
      height: height,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              title,
              style: MyStyles.black14700,
            ),
          ),
          (title.toLowerCase() == "engine")
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          (carDetailsScreenViewModel
                                  .videoController.value.isInitialized)
                              ? AspectRatio(
                                  aspectRatio: carDetailsScreenViewModel
                                      .videoController.value.aspectRatio,
                                  child: VideoPlayer(carDetailsScreenViewModel
                                      .videoController),
                                )
                              : Container(),
                          Obx(() {
                            return InkWell(
                                onTap: () {
                                  if (carDetailsScreenViewModel
                                          .playVideo.value ==
                                      false) {
                                    carDetailsScreenViewModel.videoController
                                        .play();
                                    carDetailsScreenViewModel.playVideo.value =
                                        true;
                                  } else {
                                    carDetailsScreenViewModel.videoController
                                        .pause();
                                    carDetailsScreenViewModel.playVideo.value =
                                        false;
                                  }
                                },
                                child: Icon(
                                  (carDetailsScreenViewModel.playVideo.value ==
                                          false)
                                      ? Icons.play_arrow_rounded
                                      : Icons.pause_rounded,
                                  size: 50,
                                  color: Colors.white,
                                ));
                          })
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The engine\'s seamless power delivery and responsive throttle make for an exhilarating driving ',
                        style: MyStyles.black12400,
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          TabBar(
            controller: tabController,
            labelStyle: MyStyles.selectedTabBarTitleStyle,
            labelColor: MyColors.black,
            unselectedLabelStyle: MyStyles.selectedTabBarTitleStyle,
            unselectedLabelColor: MyColors.grey.withOpacity(0.5),
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
                viewIssue(showMore, onTap),
                otherIssue(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget viewIssue(RxBool showMore, Function()? onTap) {
    return Obx(() {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ((showMore.value == false) ? 4 : 4) + 1, //length+1
          itemBuilder: (context, index) {
            if (index < 2 || (showMore.value == true && index != 4)) {
              return Container(
                width: double.infinity,
                height: 142,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: MyColors.containerBG,
                    borderRadius: BorderRadius.circular(6)),
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
                                      MySvg.carCrash,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Front Left Door",
                                    style: MyStyles.black12500,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6))),
                                          buttonColor: MyColors.warning,
                                          buttonText: MyStrings.damaged,
                                          textStyle: MyStyles.white12500),
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
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                        buttonColor: MyColors.warning,
                                        buttonText: MyStrings.repaired,
                                        textStyle: MyStyles.white12500,
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
                      height: 8,
                    ),
                    Text(
                      "Front left door is fully damaged due to a major accident,customer says they will fix",
                      style: MyStyles.black12400,
                    ),
                  ],
                ),
              );
            }
            if (index == 4) {
              return Obx(() {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 8,
                        leading: CircleAvatar(
                          backgroundColor: MyColors.black3,
                          radius: 14,
                          child: Text(
                            MyStrings.na,
                            textAlign: TextAlign.center,
                            style: MyStyles.white8700,
                          ),
                        ),
                        title: Text(
                          MyStrings.notAvailable,
                          style: MyStyles.black12500,
                        ),
                        subtitle: Text(
                          'Sunroof,Airbag, etc...',
                          style: MyStyles.black12400,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text(
                                (showMore.value == false)
                                    ? '${4 - 2} ${MyStrings.otherIssues}'
                                    : MyStrings.viewLessIssues,
                                textAlign: TextAlign.center,
                                style: MyStyles.red3_12700,
                              ),
                              Icon(
                                (showMore.value == false)
                                    ? Icons.arrow_drop_down_rounded
                                    : Icons.arrow_drop_up_rounded,
                                size: 25,
                                color: MyColors.red3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
            }
            return const SizedBox();
          });
    });
  }

  Widget otherIssue() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "Power Windows",
          style: MyStyles.black12400,
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: MyColors.green1,
                child: SvgPicture.asset(
                  MySvg.noCrash,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Text(
                "All Working",
                textAlign: TextAlign.start,
                style: MyStyles.black12500,
              ))
            ],
          ),
        )
      ],
    );
  }
}
