import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/car_details/car_details_view_model.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

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
    carDetailsScreenViewModel.videoController.value!.pause();
    super.dispose();
  }

  Widget page1() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 258,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontLeft-1710562433850-IMG_20240315_104745.jpg"),
                          fit: BoxFit.fill)),
                ),
                (carDetailsScreenViewModel.carStatus != "")?Container(
                  width: double.infinity,
                  height: 258,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: MyColors.black3.withOpacity(0.7),),
                  child: Image.asset((carDetailsScreenViewModel.carStatus == "bid won")?MyImages.bidWon
                  :(carDetailsScreenViewModel.carStatus == "bid closed")?MyImages.bidClosed
                  :MyImages.carSold),
                ): const SizedBox(),
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
                      Text(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.vehicleLocation.toString(), style: MyStyles.white11400)
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 37,
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: (carDetailsScreenViewModel.carStatus == "bid won")?MyColors.green4
                :(carDetailsScreenViewModel.carStatus == "bid closed")? MyColors.grey4
                :(carDetailsScreenViewModel.carStatus == "car sold")? MyColors.yellow
                :null,
                gradient: (carDetailsScreenViewModel.carStatus != "")?null
                :const LinearGradient(
                  end: Alignment(2.00, 0.00),
                  begin: Alignment(-1, 0),
                  colors: [MyColors.kPrimaryColor, MyColors.black5],
                ),
              ),
              child: Row(
                children: [
                  Text(
                    (carDetailsScreenViewModel.carStatus == "bid won") ? MyStrings.bidWon 
                    :(carDetailsScreenViewModel.carStatus == "bid closed")? MyStrings.bidClosed
                    :(carDetailsScreenViewModel.carStatus == "car sold")? MyStrings.carSold
                    :MyStrings.highestBid,
                    textAlign: TextAlign.center,
                    style: (carDetailsScreenViewModel.carStatus == "bid closed")? MyStyles.pageTitleStyle
                    :(carDetailsScreenViewModel.carStatus == "car sold")? MyStyles.pageTitleStyle
                    :MyStyles.whiteTitleStyle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    (carDetailsScreenViewModel.carStatus == "")? '₹${carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.highestBid.toString()}': '',
                    textAlign: TextAlign.center,
                    style: MyStyles.white16700,
                  )
                ],
              ),
            ),
            Container(
              color: MyColors.white,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.model.toString(),
                      style: MyStyles.selectedTabBarTitleStyle,
                    ),
                    subtitle: Text(
                      carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.variant.toString(),
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
                    padding: const EdgeInsets.symmetric(
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
                              const Text(
                                'Diesel',
                                style: MyStyles.regular12,
                              ),
                              (i != 3)
                                  ? const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 4.0),
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
                            onTap: () {
                              Get.toNamed(AppRoutes.galleryScreen,
                                  arguments:
                                      carDetailsScreenViewModel.imageList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      const SizedBox(
                                        width: 62,
                                        height: 62,
                                      ),
                                      Container(
                                        width: 58,
                                        height: 58,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontLeft-1710562433850-IMG_20240315_104745.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                      (index ==
                                              carDetailsScreenViewModel
                                                      .imageList.length -
                                                  1)
                                          ? const Positioned(
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
                                          : const SizedBox()
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
                      const Text.rich(
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
              height: 12,
              width: double.infinity,
              color: MyColors.lightBlue1,
            ),
            Container(
              width: double.infinity,
              color: MyColors.white,
              padding:
                  const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
              margin: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
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
                              const Text(
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
                  const Text(
                    'Front left door is fully damaged due to a major \naccident,customer says they will fix',
                    style: MyStyles.black12400,
                  )
                ],
              ),
            ),
            // inspectionReport(),
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(10),
            //   margin: const EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(8)),
            //   child: const Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         MyStrings.documents,
            //         style: MyStyles.black12700,
            //       ),
            //       Row(
            //         children: [
            //           Expanded(
            //             child: Text(
            //               "RC Availability",
            //               textAlign: TextAlign.left,
            //               style: MyStyles.black12400,
            //             ),
            //           ),
            //           Expanded(
            //             child: Text("Yes. Original",
            //                 textAlign: TextAlign.left,
            //                 style: MyStyles.black12400),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 50,
            // ),
          ],
        );
  }

  List<Widget> page2() {
    return <Widget>[
      const SizedBox(
        height: 10,
      ),
      Container(
        key: carDetailsScreenViewModel.documentKey,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MyStrings.documents,
              style: MyStyles.black12700,
            ),
            const SizedBox(height: 4.0,),
            Obx(
              () {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: carDetailsScreenViewModel.documents.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                      children: [
                      Expanded(
                        child: Text(
                          carDetailsScreenViewModel.documents[index].title,
                          textAlign: TextAlign.left,
                          style: MyStyles.black12400,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          carDetailsScreenViewModel.documents[index].value!,
                          textAlign: TextAlign.left,
                          style: MyStyles.black12400,
                        ),
                      ),
                                        ],
                                      ),
                    );
                });
              }
            ),
            
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: inspectionReportTabBar(
            carDetailsScreenViewModel.exteriorKey,
            carDetailsScreenViewModel.exteriorTabController,
            850,
            MyStrings.exterior,
            carDetailsScreenViewModel.exteriorOtherParts,
            carDetailsScreenViewModel.exteriorShowMore, () {
          carDetailsScreenViewModel.exteriorShowMore.value =
              !carDetailsScreenViewModel.exteriorShowMore.value;
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: inspectionReportTabBar(
            carDetailsScreenViewModel.interiorElectricalKey,
            carDetailsScreenViewModel.interiorElectricalTabController,
            850,
            MyStrings.interiorAndElectrical,
            carDetailsScreenViewModel.interiorAndElectricalOtherParts,
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
            carDetailsScreenViewModel.engineOtherParts,
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
            carDetailsScreenViewModel.airConditionOtherParts,
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
            carDetailsScreenViewModel.testDriveOtherParts,
            carDetailsScreenViewModel.testDriveShowMore, () {
          carDetailsScreenViewModel.testDriveShowMore.value =
              !carDetailsScreenViewModel.testDriveShowMore.value;
        }),
      ),
    ];
  }

  Widget sliverAppBarTitle() {
    return Container(
      width: double.infinity,
      height: 134,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(2.00, 0.00),
            colors: <Color>[MyColors.kPrimaryColor, MyColors.black5]),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "2016 Duster",
            style: MyStyles.white14500,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "110 PS RXZ 4X2 AMT",
            style: MyStyles.white16700,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "₹19,99,999",
            style: MyStyles.titleStyle,
          )
        ],
      ),
    );
  }

  Widget bottomSheetWidget() {
    return Container(
      width: double.infinity,
      height: 111,
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                MySvg.timer,
                width: 18,
                // ignore: deprecated_member_use
                color: MyColors.green2,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
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
                        padding: const EdgeInsets.all(2),
                        backgroundColor:
                            MyColors.kPrimaryColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                                color: MyColors.kPrimaryColor))),
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
                        padding: const EdgeInsets.all(2),
                        backgroundColor: MyColors.kPrimaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                                color: MyColors.kPrimaryColor))),
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
    );
  }

  Widget inspectionReport() {
    return Container(
      color: MyColors.lightBlue1,
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
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
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  // boxShadow:
                ),
              ),
              // Container(
              //   width: 92,
              //   height: 66,
              //   decoration: const BoxDecoration(
              //       color: MyColors.blue2,
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(8),
              //           bottomLeft: Radius.circular(8))),
              // ),
              Obx(
                () {
                  return SizedBox(
                    height: 66,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: carDetailsScreenViewModel.ratingList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () {
                              return InkWell(
                                onTap: () async {
                                  // if (carDetailsScreenViewModel.pageIndex.value == 1) {
                                  carDetailsScreenViewModel.inspectionIndex.value = index;
                                  await carDetailsScreenViewModel.scrollItem();
                                  // }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: (carDetailsScreenViewModel.inspectionIndex.value == index)?MyColors.blue2:Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        carDetailsScreenViewModel.ratingList[index].title,
                                        style: MyStyles.black12500,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      (index == 0)
                                          ? const SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 4),
                                              margin: const EdgeInsets.only(top: 4),
                                              decoration: BoxDecoration(
                                                  color: (carDetailsScreenViewModel
                                                                  .ratingList[index].rating >=
                                                          4.0)
                                                      ? MyColors.green1
                                                      : (carDetailsScreenViewModel
                                                                          .ratingList[index].rating >=
                                                                  2.5 &&
                                                              carDetailsScreenViewModel
                                                                          .ratingList[index].rating <=
                                                                  3.5)
                                                          ? MyColors.yellow
                                                          : MyColors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    carDetailsScreenViewModel
                                                        .ratingList[index].rating
                                                        .toString(),
                                                    style: MyStyles.white11500,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  SvgPicture.asset(MySvg.star)
                                                ],
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              );
                            }
                          );
                        }),
                  );
                }
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
      RxList<Master> otherPartsList,
      RxBool showMore,
      Function()? onTap) {
    return Container(
      key: scrollGlobalKey,
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
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
                      Obx(
                        () {
                          if(carDetailsScreenViewModel.videoController.value == null){
                            return const SizedBox();
                          }
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              AspectRatio(
                                      // aspectRatio: carDetailsScreenViewModel
                                      //     .videoController.value!.value.aspectRatio,
                                      aspectRatio: 16/9,
                                      child: VideoPlayer(carDetailsScreenViewModel
                                          .videoController.value!),
                                    ),
                              InkWell(
                                    onTap: () {
                                      if (carDetailsScreenViewModel
                                              .playVideo.value ==
                                          false) {
                                        carDetailsScreenViewModel.videoController.value!
                                            .play();
                                        carDetailsScreenViewModel.playVideo.value =
                                            true;
                                      } else {
                                        carDetailsScreenViewModel.videoController.value!
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
                                    ))
                            ],
                          );
                        }
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
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
                otherIssue(otherPartsList),
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
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ((showMore.value == false) ? 4 : 4) + 1, //length+1
          itemBuilder: (context, index) {
            if (index < 2 || (showMore.value == true && index != 4)) {
              return Container(
                width: double.infinity,
                height: 142,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.only(top: 10),
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
                                  const Text(
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
                                              padding: const EdgeInsets.all(2),
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
                                            padding: const EdgeInsets.all(2),
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
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontLeft-1710562433850-IMG_20240315_104745.jpg"),
                                  fit: BoxFit.fill)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
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
                      const ListTile(
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

  Widget otherIssue(RxList<Master> otherPartsList) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: otherPartsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14),
            child: Row(
              children: [
               Expanded(
                    child: Text(
                  otherPartsList[index].title,
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
                        otherPartsList[index].value!.capitalize.toString(),
                        textAlign: TextAlign.start,
                        style: MyStyles.black12500,
                      ))
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBlue1,
      body: SafeArea(
        child: Obx(
          () {
            if(carDetailsScreenViewModel.reportResponse.value.data == null){
              return Center(child: CircularProgressIndicator(color: MyColors.kPrimaryColor,));
            }
            return CustomScrollView(
                controller: carDetailsScreenViewModel.scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 725,
                    toolbarHeight: 134,
                    scrolledUnderElevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      expandedTitleScale: 1,
                      titlePadding: const EdgeInsets.all(0),
                      title: Obx(() {
                        if (carDetailsScreenViewModel.showSliverAppBarTitle.value) {
                          return sliverAppBarTitle();
                        }
                        return const SizedBox();
                      }),
                      background: page1(),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 120.0,
                      maxHeight: 120.0,
                      child: inspectionReport(),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate.fixed(<Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 120),
                      child: Column(
                        children: page2(),
                      ),
                    )
                  ])),
                ]);
          }
        ),
      ),
      bottomSheet: bottomSheetWidget(),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
