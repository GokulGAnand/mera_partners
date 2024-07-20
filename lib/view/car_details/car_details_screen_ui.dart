import 'dart:developer';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/constants.dart';
import 'package:mera_partners/utils/dimens.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view/car_details/custom_tab/autoscale_tabbar_view.dart';
import 'package:mera_partners/view_model/car_details/car_details_view_model.dart';
import 'package:mera_partners/view_model/home/live/live_cars_list_view_model.dart';
import 'package:mera_partners/view_model/home/otb/otb_view_model.dart';
import 'package:mera_partners/widgets/custom_bid_bottom_sheet.dart';
import 'package:mera_partners/widgets/custom_button.dart';
import 'package:mera_partners/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:mera_partners/widgets/otb_bottom_sheet.dart';
import 'package:mera_partners/widgets/quote_price_bottom_sheet.dart';
import 'package:video_player/video_player.dart';
import '../../widgets/custom_toast.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class Item{
  final String title;
  final String value;

  Item({required this.title,required this.value});
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with TickerProviderStateMixin {
  CarDetailsScreenViewModel carDetailsScreenViewModel =
      Get.isRegistered<CarDetailsScreenViewModel>()
          ? Get.find<CarDetailsScreenViewModel>()
          : Get.put(CarDetailsScreenViewModel());

  LiveCarsListViewModel liveCarListViewModel = 
      Get.isRegistered<LiveCarsListViewModel>() 
          ? Get.find<LiveCarsListViewModel>() : 
          Get.put(LiveCarsListViewModel());

  @override
  void initState() {
    // carDetailsScreenViewModel.exteriorTabController =
    //     TabController(length: (carDetailsScreenViewModel.exteriorIssue.isEmpty)?1:2, vsync: this);
    // carDetailsScreenViewModel.interiorElectricalTabController =
    //     TabController(length: (carDetailsScreenViewModel.interiorAndElectricalIssue.isEmpty)?1:2, vsync: this);
    // carDetailsScreenViewModel.engineTabController =
    //     TabController(length: (carDetailsScreenViewModel.engineIssue.isEmpty)?1:2, vsync: this);
    // carDetailsScreenViewModel.acTabController =
    //     TabController(length: (carDetailsScreenViewModel.airConditionIssue.isEmpty)?1:2, vsync: this);
    // carDetailsScreenViewModel.testDriveTabController =
    //     TabController(length: (carDetailsScreenViewModel.testDriveIssue.isEmpty)?1:2, vsync: this);
    carDetailsScreenViewModel.scrollListener();
    carDetailsScreenViewModel.getReport();
    carDetailsScreenViewModel.getCarDetails();
    carDetailsScreenViewModel.getLikedCarData();
    var duration = DateTime.now().difference(DateTime.parse(DateTime.now().toString()));
    carDetailsScreenViewModel.endTime?.value = DateTime.now().millisecondsSinceEpoch + Duration(seconds: duration.inSeconds).inMilliseconds;
    carDetailsScreenViewModel.timerController = CountdownTimerController(endTime: carDetailsScreenViewModel.endTime?.value ?? 0, onEnd: carDetailsScreenViewModel.onEnd).obs;
    super.initState();
  }

  @override
  void dispose() {
    if(carDetailsScreenViewModel.videoController.value != null){
      carDetailsScreenViewModel.videoController.value!.pause();
    }
    carDetailsScreenViewModel.timerController?.value.dispose();
    super.dispose();
  }

  Widget page1() {
    return Obx(
      () {
        return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CustomSlider(
                      sliderImage: carDetailsScreenViewModel.sliderImage, 
                      pageSliderController: carDetailsScreenViewModel.pageSliderController, 
                      activePage: carDetailsScreenViewModel.activePage,
                      height: 256,),
                    (carDetailsScreenViewModel.carStatus.value != "")?Container(
                      width: double.infinity,
                      height: 258,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: MyColors.black3.withOpacity(0.7),),
                      child: Image.asset((((carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner != null) && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!)) || carDetailsScreenViewModel.carStatus.value.toLowerCase() == "deal_lost")?MyImages.bidClosed
                      // :(carDetailsScreenViewModel.carStatus.value == "bid closed")?MyImages.bidClosed
                      :MyImages.bidWon),
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
                Obx(() => Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: (carDetailsScreenViewModel.carStatus.value.toLowerCase() == "bid won")?MyColors.green4
                        :(carDetailsScreenViewModel.carStatus.value.toLowerCase() == "bid closed")? MyColors.grey4
                        :(carDetailsScreenViewModel.carStatus.value.toLowerCase() == "car sold")? MyColors.yellow
                        :null,
                    gradient: (carDetailsScreenViewModel.carStatus.value != "")?null
                        :LinearGradient(
                      end: const Alignment(2.00, 0.00),
                      begin: const Alignment(-1, 0),
                      colors: [
                        carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                            ? MyColors.kPrimaryColor
                            :carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() != MyStrings.live.toLowerCase()
                            ? MyColors.black
                            : (globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!))
                            ? MyColors.green
                            : (globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].leaderBoard != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && carDetailsScreenViewModel.carDetailsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                            ? MyColors.red
                            : MyColors.kPrimaryColor,
                        MyColors.black5],
                    ),
                  ),
                  child: Obx(() => Row(
                    children: [
                      Text(
                        (carDetailsScreenViewModel.carStatus.value == "bid won")
                            ? MyStrings.bidWon
                            :(carDetailsScreenViewModel.carStatus.value == "bid closed")
                            ? MyStrings.bidClosed
                            :(carDetailsScreenViewModel.carStatus.value == "car sold")
                            ? MyStrings.carSold
                            :carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                            ? MyStrings.closingPrice
                            :carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() != MyStrings.live.toLowerCase()
                            ? MyStrings.scheduledBid
                            : globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!)
                            ? MyStrings.youAreLeading
                            : globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].leaderBoard != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                            ? MyStrings.youAreLoosing
                            :MyStrings.highestBid,

                        // (carDetailsScreenViewModel.carStatus == "bid won") ? MyStrings.bidWon
                        // :(carDetailsScreenViewModel.carStatus == "bid closed")? MyStrings.bidClosed
                        // :(carDetailsScreenViewModel.carStatus == "car sold")? MyStrings.carSold
                        // :MyStrings.highestBid,
                        textAlign: TextAlign.center,
                        style: (carDetailsScreenViewModel.carStatus.value == "bid closed")? MyStyles.pageTitleStyle
                            :(carDetailsScreenViewModel.carStatus.value == "car sold")? MyStyles.pageTitleStyle
                            :MyStyles.whiteTitleStyle,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.live.name && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!)
                          ? Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                        child: SvgPicture.asset(MySvg.arrowUp, width: 14,),
                      )
                          :globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.live.name && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].leaderBoard != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                          ? Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                        child: SvgPicture.asset(MySvg.arrowDown, width: 14,),
                      )
                          :const SizedBox(),
                      Obx(() => 
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.live.toLowerCase() ||
                            carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                            ?'₹'
                            : "",
                                style: MyStyles.white16700.copyWith(fontFamily: 'Rupee')),
                            TextSpan(
                                text: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.live.toLowerCase() ||
                            carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                            ?globals.documentStatus == DocumentStatus.VERIFIED.name ?
                        Constants.numberFormat.format(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name ? (carDetailsScreenViewModel.carDetailsResponse.value.data?[0].realValue ?? 0) : (carDetailsScreenViewModel.carDetailsResponse.value.data?[0].highestBid ?? 0))
                            :(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].highestBid != null)
                            ?'${carDetailsScreenViewModel.carDetailsResponse.value.data?[0].highestBid!.toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}'
                            :'${(0).toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}'
                            : "",
                            
                                style: MyStyles.white16700,),
                          ],
                        ),
                      ),
                      )
                    ],
                  ),)
                ),),
                Container(
                  color: MyColors.white,
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Row(
                          children: [
                            Text(
                              carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.monthAndYearOfManufacture?.substring((carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.monthAndYearOfManufacture?.length ?? 0) - 4) ?? '',
                              style: MyStyles.selectedTabBarTitleStyle,
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.model.toString(),
                              style: MyStyles.selectedTabBarTitleStyle,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.variant.toString(),
                          style: MyStyles.black16700,
                        ),
                        trailing: InkWell(
                          onTap: () async{
                            carDetailsScreenViewModel.isLike.value = !carDetailsScreenViewModel.isLike.value;
                            await carDetailsScreenViewModel.updateLikedCar(carDetailsScreenViewModel.isLike.value);

                          },
                          child: SvgPicture.asset(
                            (carDetailsScreenViewModel.isLike.value == false)?MySvg.like:MySvg.liked,
                            width: 23,
                          ),
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
                                if(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.fuelType != null)...[
                                  Text(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.fuelType!.capitalize.toString(), style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                ],
                                if(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo?.odometerReading != null)...[
                                  const Text('|', style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                  Text('${Constants.numberFormatter.format(double.parse(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo?.odometerReading.toString() ?? '0'))} KM', style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                ],
                                if(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.ownershipNumber != null)...[
                                  const Text('|', style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                  Text('${carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.ownershipNumber!.capitalize} Owner'.toString(), style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                ],
                                if(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.transmission != null)...[
                                  const Text('|', style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                  Text(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.transmission!.capitalize.toString(), style: MyStyles.regular12),
                                  const SizedBox(width: 6),
                                ],
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
                                  for (var element in carDetailsScreenViewModel.imageList) {element["isClick"].value = false;}
                                  carDetailsScreenViewModel.imageList[index]["isClick"].value = true;
                                  Get.toNamed(AppRoutes.galleryScreen,
                                      arguments:
                                          carDetailsScreenViewModel.imageList);
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
                                          ClipRRect(
                                            // as per the design
                                            borderRadius: BorderRadius.circular(8),
                                            child: SizedBox(
                                              width: 58,
                                              height: 58,
                                              child: Image.network(carDetailsScreenViewModel.imageList[index]["images"][0].image, fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return SvgPicture.asset(MyImages.loadingCar);
                                              }, frameBuilder:
                                                  (context, child, frame, wasSynchronouslyLoaded) {
                                                return child;
                                              }, loadingBuilder: (context, child, loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return SvgPicture.asset(MyImages.loadingCar);
                                                }
                                              }),
                                            ),
                                          ),
                                          (carDetailsScreenViewModel.imageList[index]["title"]== MyStrings.damage)
                                              ? Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor: MyColors.red2,
                                                    child: Text(
                                                      '${carDetailsScreenViewModel.imageList[index]["images"].length}',
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
                                        carDetailsScreenViewModel.imageList[index]["title"],
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
                                const TextSpan(
                                  text: "${MyStrings.fairValue}  ",
                                  style: MyStyles.subTitleGreayStyle,
                                ),
                                TextSpan(
                                  text: "₹",
                                  style: MyStyles.grey14700.copyWith(fontFamily: 'Rupee'),
                                ),
                                TextSpan(
                                  text: globals.documentStatus == DocumentStatus.VERIFIED.name ? 
                                  Constants.numberFormat.format(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo?.realValue ?? 0)
                                  :(carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.realValue != null)
                                  ?'${carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.realValue!.toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}'
                                  :'${(0).toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}',
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
                (carDetailsScreenViewModel.criticalIssue.isEmpty)?
                const SizedBox()
                :Container(
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
                      (carDetailsScreenViewModel.criticalIssue.isEmpty)?
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("No Critical Issue", style: MyStyles.subtitle12400,),
                      )
                      :Wrap(
                        children: [
                          for (int i = 0; i < carDetailsScreenViewModel.criticalIssue.length; i++) ...[
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
                                    carDetailsScreenViewModel.criticalIssue[i].capitalize ?? '',
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
                        carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.specialComments ?? '',
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
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              MyStrings.documents,
              style: MyStyles.black12700,
            ),
            const SizedBox(height: 4.0,),
            Obx(
              () {
                return showListData(carDetailsScreenViewModel.documents);
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: List.generate(MediaQuery.of(context).size.width~/5, (index) => Expanded(
                child: Container(
                  color: index%2==0?Colors.transparent
                  :MyColors.grey2,
                  height: 2,
                ),
                )),
              ),
            ),
            const Text(
              MyStrings.otherInformation,
              style: MyStyles.black12700,
            ),
            const SizedBox(height: 4.0,),
            Obx(
              () {
                return showListData(carDetailsScreenViewModel.otherInformation);
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: List.generate(MediaQuery.of(context).size.width~/5, (index) => Expanded(
                child: Container(
                  color: index%2==0?Colors.transparent
                  :MyColors.grey2,
                  height: 2,
                ),
                )),
              ),
            ),
            const Text(
              MyStrings.regAndFitness,
              style: MyStyles.black12700,
            ),
            const SizedBox(height: 4.0,),
            Obx(
              () {
                return showListData(carDetailsScreenViewModel.regAndFitness);
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
            carDetailsScreenViewModel.exteriorIssue,
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
            carDetailsScreenViewModel.interiorAndElectricalIssue,
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
            carDetailsScreenViewModel.engineIssue,
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
            carDetailsScreenViewModel.airConditionIssue,
            carDetailsScreenViewModel.airConditionOtherParts,
            carDetailsScreenViewModel.acShowMore, () {
          carDetailsScreenViewModel.acShowMore.value =
              !carDetailsScreenViewModel.acShowMore.value;
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: inspectionReportTabBar(
            carDetailsScreenViewModel.featureKey,
            carDetailsScreenViewModel.featureTabController,
            850,
            MyStrings.feature,
            carDetailsScreenViewModel.featureIssue,
            carDetailsScreenViewModel.featureOtherParts,
            carDetailsScreenViewModel.featureShowMore, () {
          carDetailsScreenViewModel.featureShowMore.value =
              !carDetailsScreenViewModel.featureShowMore.value;
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: inspectionReportTabBar(
            carDetailsScreenViewModel.testDriveKey,
            carDetailsScreenViewModel.testDriveTabController,
            850,
            MyStrings.testDrive,
            carDetailsScreenViewModel.testDriveIssue,
            carDetailsScreenViewModel.testDriveOtherParts,
            carDetailsScreenViewModel.testDriveShowMore, () {
          carDetailsScreenViewModel.testDriveShowMore.value =
              !carDetailsScreenViewModel.testDriveShowMore.value;
        }),
      ),
    ];
  }

  Widget showListData(List<Master> list){
    return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                      children: [
                      Expanded(
                        child: Text(
                          list[index].title,
                          textAlign: TextAlign.left,
                          style: MyStyles.black12400,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          list[index].value!,
                          textAlign: TextAlign.left,
                          style: _getValueStyle(Item(title: list[index].title, value: list[index].value??""))
                        ),
                      ),
                      ],
                      ),
                    );
                });
  }

  Widget sliverAppBarTitle() {
    return Container(
      width: double.infinity,
      height: 136,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: const Alignment(-1, 0),
            end: const Alignment(2.00, 0.00),
            colors: <Color>[
              carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name?
              MyColors.kPrimaryColor
              :carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() != MyStrings.live.toLowerCase()
                                  ? MyColors.black
                                  : (globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!))
                                  ? MyColors.green
                                  : (globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].leaderBoard != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) &&
                                  carDetailsScreenViewModel.carDetailsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId))
                                  ? MyColors.red
                                  : MyColors.kPrimaryColor,
              MyColors.black5]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.model.toString(),
            style: MyStyles.white14500,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.variant.toString(),
            style: MyStyles.white16700,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.live.name && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!)
                  ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(MySvg.arrowUp,),
                  )
                  :globals.uniqueUserId != null && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.live.name && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].winner != null && !carDetailsScreenViewModel.carDetailsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && carDetailsScreenViewModel.carDetailsResponse.value.data?[0].leaderBoard != null && carDetailsScreenViewModel.carDetailsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId)
                  ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(MySvg.arrowDown,),
                  )
                  :const SizedBox(),
              RichText(
              text: TextSpan(
                children: <TextSpan>[
                   TextSpan(
                      text: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.live.toLowerCase() ||
                carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                        ?'₹'
                : "",
                      style: MyStyles.titleStyle.copyWith(fontFamily: 'Rupee')),

                   TextSpan(text: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.live.toLowerCase() ||
                carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                        ?globals.documentStatus == DocumentStatus.VERIFIED.name ?
                Constants.numberFormat.format(carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid ?? 0)
                                  :(carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid != null)
                                  ?'${carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid!.toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}'
                                  :'${(0).toString().replaceAllMapped(RegExp(r'\d'), (match) => "*").replaceAll('.', ',')}'
                : carDetailsScreenViewModel.carDetailsResponse.value.data![0].status!.toLowerCase() == MyStrings.scheduled.toLowerCase()|| carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
                       ? MyStrings.scheduledBid
                :"",
                   style: MyStyles.titleStyle,),
                ],
              ),
            ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheetWidget() {
    return Obx(
      () {
        return Container(
          width: double.infinity,
          height: (carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.scheduled.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name )
          ?65
          :(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() )
          ?142
          :111,
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => CountdownTimer(
                    controller: carDetailsScreenViewModel.timerController?.value,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return const Text(MyStrings.paused);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if(time.min != 0 && carDetailsScreenViewModel.timerController?.value != null)
                                Icon(
                                  Icons.timer_sharp,
                                  color: carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.scheduled.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name ? MyColors.kPrimaryColor : (time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red,
                                  size: 14,
                                ),
                              Text((time.hours != null && time.days != null) ? '${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : time.hours != null ? '${time.hours ?? 0}h ${time.min ?? 0}min ${time.sec ?? 0}sec' : '${time.min ?? 0}min ${time.sec ?? 0}sec',style: TextStyle(
                                color: carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.scheduled.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name ? MyColors.kPrimaryColor : (time.hours != null && time.hours != 0) ? MyColors.green2 : (time.min ?? 0) <= 2 ? MyColors.red2 : (time.min ?? 0) >= 10 ? MyColors.green2 : (time.min ?? 0) < 10 ? MyColors.orange : MyColors.red,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ))
                            ],
                          ),
                        ],
                      );
                    },
                  ),),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase())
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: CustomElevatedButton(
                            buttonHeight: Dimens.defHeight,
                            onPressed: (){
                              showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return OTBBottomSheet(
                                            timerController: carDetailsScreenViewModel.carDetailsResponse.value.data![0].otbEndTime != null ? CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].otbEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: 0).obs,
                                            otbPrice: carDetailsScreenViewModel.reportResponse.value.data?.allCarInfo?.realValue?.toInt() ?? 0,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Get.find<OTBCarsListViewModel>().buyOTBCar(carDetailsScreenViewModel.reportResponse.value.data!.sId ?? '', carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.realValue ?? 0);
                                            },
                                          );
                                        });
                            },
                            buttonText: MyStrings.oneTouchBuy),
                      ),
                      const SizedBox(height: 12,),
                    InkWell(onTap: () {
                      carDetailsScreenViewModel.quotePriceController.value.clear();
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context, builder: (context) {
                        return QuotePriceBottomSheet(
                          timerController: carDetailsScreenViewModel.carDetailsResponse.value.data![0].otbEndTime != null ? CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].otbEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : CountdownTimerController(endTime: 0).obs,
                          otbStartTime:DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].bidStartTime ?? DateTime.now().toString()),
                          otbEndTime:DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].bidEndTime ?? DateTime.now().toString()),
                          otbPrice: RxInt(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].realValue ?? 0),
                          amountController: carDetailsScreenViewModel.quotePriceController,
                          minQuotePrice: RxNum(Constants.calculateMinQuote(carDetailsScreenViewModel.carDetailsResponse.value.data?[0].realValue ?? 0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            carDetailsScreenViewModel.quotePrice(carDetailsScreenViewModel.id, int.tryParse(carDetailsScreenViewModel.quotePriceController.value.text) ?? 0);
                          },
                        );
                      },);
                    }, child: const Text(MyStrings.quotePrice, style: MyStyles.primary16500,)),
                  ],
                ),
              (carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() != MyStrings.live.toLowerCase() )?
              const SizedBox()
              :Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 47,
                      child: CustomElevatedButton(
                        onPressed: () {
                          liveCarListViewModel.autoBidController.value.clear();
                            showModalBottomSheet(
                                isScrollControlled: true,
                                enableDrag: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Obx(() => CustomBidBottomSheet(
                                    timerController: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status?.toLowerCase() == CarStatus.scheduled.name
                                        ?carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime != null ?
                                    CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : null
                                        : carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime != null ?
                                    CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : null,
                                    bidStartTime: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime ?? DateTime.now().toString()),
                                    bidEndTime: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime ?? DateTime.now().toString()),
                                    amountController: liveCarListViewModel.autoBidController,
                                    isAutoBid: true,
                                    bidValue: RxInt(carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid!.toInt()),
                                    stepRate: carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 99999
                                        ? RxInt(2000)
                                        : (carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! >= 100000 && carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 299999)
                                        ? RxInt(4000)
                                        : (carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! >= 300000 && carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 499999)
                                        ? RxInt(7000)
                                        : RxInt(10000),
                                    onAutoBidPressed: () {
                                      try {
                                        if(globals.uniqueUserId != null && liveCarListViewModel.liveCarsResponse.value.data?[0].winner != null && liveCarListViewModel.liveCarsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && liveCarListViewModel.liveCarsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.autoBidLimit != null && (int.tryParse(liveCarListViewModel.autoBidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                          CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(liveCarListViewModel.liveCarsResponse.value.data![0].leaderBoard![0].autoBidLimit ?? 0).toString());
                                        }else{
                                          liveCarListViewModel.placeAutoBid(liveCarListViewModel.autoBidController.value.text, carDetailsScreenViewModel.reportResponse.value.data!.sId);
                                          Navigator.of(context).pop();
                                        }
                                      } catch (e) {
                                        log(e.toString());
                                      }
                                    },
                                  ),);
                                });
                        },
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
                        onPressed: () {
                          liveCarListViewModel.bidController.value.clear();
                            showModalBottomSheet(
                                enableDrag: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Obx(() => CustomBidBottomSheet(
                                    timerController: carDetailsScreenViewModel.carDetailsResponse.value.data![0].status?.toLowerCase() == CarStatus.scheduled.name
                                        ?carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime != null ?
                                    CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : null
                                        : carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime != null ?
                                    CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},).obs : null,
                                    bidStartTime: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidStartTime ?? DateTime.now().toString()),
                                    bidEndTime: DateTime.parse(carDetailsScreenViewModel.carDetailsResponse.value.data![0].bidEndTime ?? DateTime.now().toString()),
                                    amountController: liveCarListViewModel.bidController,
                                    bidValue: RxInt(carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid?.toInt() ?? 0),
                                    stepRate: carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 99999
                                        ? RxInt(2000)
                                        : (carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! >= 100000 && carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 299999)
                                        ? RxInt(4000)
                                        : (carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! >= 300000 && carDetailsScreenViewModel.carDetailsResponse.value.data![0].highestBid! <= 499999)
                                        ? RxInt(7000)
                                        : RxInt(10000),
                                    onBidPressed: () {
                                      try {
                                        if(globals.uniqueUserId != null && liveCarListViewModel.liveCarsResponse.value.data?[0].winner != null && liveCarListViewModel.liveCarsResponse.value.data![0].winner!.contains(globals.uniqueUserId!) && liveCarListViewModel.liveCarsResponse.value.data![0].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.autoBidLimit != null && (int.tryParse(liveCarListViewModel.bidController.value.text) ?? 0) <= element.autoBidLimit!)){
                                          CustomToast.instance.showMsg(MyStrings.vAutoBidLimit+(liveCarListViewModel.liveCarsResponse.value.data![0].leaderBoard![0].autoBidLimit ?? 0).toString());
                                        }else{
                                          liveCarListViewModel.placeBid(liveCarListViewModel.bidController.value.text, carDetailsScreenViewModel.reportResponse.value.data?.sId);
                                          Navigator.of(context).pop();
                                        }
                                      } catch (e) {
                                        log(e.toString());
                                      }
                                    },
                                  ),);
                                });
                        },
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
    );
  }

  Widget inspectionReport() {
    return Container(
      color: MyColors.lightBlue1,
      padding: const EdgeInsets.only(top: 7.0, left: 15.0, right: 15.0),
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
                height: 70,
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
                    height: 70,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: carDetailsScreenViewModel.ratingList.length,
                        itemBuilder: (context, index) {
                          if(index == 4) {
                            return const SizedBox.shrink();
                          }
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
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: (carDetailsScreenViewModel.inspectionIndex.value == index)?MyColors.blue2:Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)
                                    )
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
                                      (index == 0 || index == 4 || index == 5)
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
      RxList<Master> issueList,
      RxList<Master> otherPartsList,
      RxBool showMore,
      Function()? onTap) {
    return Container(
      key: scrollGlobalKey,
      // height: height,
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
          (title.toLowerCase() == Inspection.engine.name)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        carDetailsScreenViewModel.reportResponse.value.data!.allCarInfo!.engineComment ?? '',
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
            tabs: (issueList.isNotEmpty)?[
              Tab(text: "View ${(issueList.isEmpty)?'':issueList.length} Issues"),
              const Tab(text: "Good Parts"),
            ]
            :[
              const Tab(text: "Good Parts"),
            ],
          ),
          AutoScaleTabBarView(
            controller: tabController,
            onTap: onTap!,
            listLength: issueList.length,
            showMore: showMore,
            children: (issueList.isNotEmpty)?
            [
              viewIssue(issueList, showMore, onTap,title, isExterior: (title.toLowerCase() == Inspection.exterior.name)?true:false),
              // Text("view"),
              otherIssue(otherPartsList),
            ]
            :[
              otherIssue(otherPartsList),
            ],
          ),
        ],
      ),
    );
  }

  Widget viewIssue(RxList<Master> list, RxBool showMore, Function()? onTap,String title, {bool isExterior = false}) {
    const notAvailableValues = { "","NO", "No","no", "Nil", "Nill","nil",};
    return (list.isEmpty)?
    const SizedBox()
    :Column(
      children: [
        ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length, //length+1
              itemBuilder: (context, index) {
                return Obx((){
                  if (index < 2 || (showMore.value == true && index != list.length)) {
                    String issueSubTitle = list[index].listValue?.map((item) => item.capitalize.toString()).join(',')??'';
                    return Container(
                    width: double.infinity,
                    // height: 142,
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
                                        backgroundColor: list[index].color,
                                        child: SvgPicture.asset(
                                          MySvg.carCrash,
                                          color: list[index].color == MyColors.yellow ? Colors.black:null,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(child: Text(
                                        list[index].title.capitalize.toString(),
                                        style: MyStyles.black12500,
                                      ),)
                                    ],
                                  ),
                                  if(list[index].listValue != null || list[index].value != null) Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: list[index].listValue?.length ?? (list[index].value != null ? 1 : 0),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: ((list[index].listValue?.any((item) => item.length >= 20)) ?? list[index].value!.length >= 20) ? 1 : 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: ((list[index].listValue?.any((item) => item.length >= 10)) ?? list[index].value!.length >= 10) ? 40 : 30,
                                      ),
                                        itemBuilder: (context, i){
                                          return Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(right: 6),
                                            decoration: BoxDecoration(
                                              color: list[index].color,
                                              borderRadius: BorderRadius.circular(4)
                                            ),
                                            child: Text(
                                              list[index].listValue?[i].capitalize.toString() ?? list[index].value ?? '',
                                              style: list[index].color == MyColors.warning ? MyStyles.white12500 : MyStyles.black12500,
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            if(list[index].image != null && (list[index].image!.startsWith("http") || list[index].image!.startsWith("https"))) Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.imageViewScreen, arguments:
                                  {"title": title,
                                    "image_title" : list[index].title,
                                    "image" : list[index].image!,
                                    "subtitle" : issueSubTitle
                                  },
                                  );
                                },
                                child: SizedBox(
                                  width: 75,
                                  height: 68,
                                  child: Image.network(list[index].image!, fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return SvgPicture.asset(MyImages.loadingCar);
                                      }, frameBuilder:
                                          (context, child, frame, wasSynchronouslyLoaded) {
                                        return child;
                                      }, loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return SvgPicture.asset(MyImages.loadingCar);
                                        }
                                      }),
                                ),
                              )
                            )
                          ],
                        ),
                        if(list[index].remarks != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            list[index].remarks!.capitalize.toString(),
                            style: MyStyles.black12400,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
                });
        }),
        (!isExterior || notAvailableValues.contains(carDetailsScreenViewModel.notAvailable))?
        const SizedBox()
        :Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            minLeadingWidth: 0,
                            horizontalTitleGap: 8,
                            title: const Text(
                              MyStrings.missingParts,
                              style: MyStyles.black12700,
                            ),
                            subtitle: Text(
                              carDetailsScreenViewModel.notAvailable,
                              style: MyStyles.black12400,
                            ),
                          ),
                        ],
                      ),
                    )
      ],
    );
  }

  Widget otherIssue(RxList<Master> otherPartsList) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
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
    return Obx(() => Scaffold(
      backgroundColor: MyColors.lightBlue1,
      body: SafeArea(
        child: Obx(
                () {
              if(carDetailsScreenViewModel.reportResponse.value.data == null || carDetailsScreenViewModel.carDetailsResponse.value.data == null){
                return const Center(child: CircularProgressIndicator(color: MyColors.kPrimaryColor,));
              }
              carDetailsScreenViewModel.exteriorTabController =
                  TabController(length: (carDetailsScreenViewModel.exteriorIssue.isEmpty)?1:2, vsync: this);
              carDetailsScreenViewModel.interiorElectricalTabController =
                  TabController(length: (carDetailsScreenViewModel.interiorAndElectricalIssue.isEmpty)?1:2, vsync: this);
              carDetailsScreenViewModel.engineTabController =
                  TabController(length: (carDetailsScreenViewModel.engineIssue.isEmpty)?1:2, vsync: this);
              carDetailsScreenViewModel.acTabController =
                  TabController(length: (carDetailsScreenViewModel.airConditionIssue.isEmpty)?1:2, vsync: this);
              carDetailsScreenViewModel.featureTabController =
                  TabController(length: (carDetailsScreenViewModel.featureIssue.isEmpty)?1:2, vsync: this);
              carDetailsScreenViewModel.testDriveTabController =
                  TabController(length: (carDetailsScreenViewModel.testDriveIssue.isEmpty)?1:2, vsync: this);
              return CustomScrollView(
                  controller: carDetailsScreenViewModel.scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      expandedHeight:  (carDetailsScreenViewModel.criticalIssue.isEmpty)?541:725,
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
      bottomSheet:
      carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.scheduled.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.live.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status?.toLowerCase() == MyStrings.otb.toLowerCase() || carDetailsScreenViewModel.carDetailsResponse.value.data?[0].status == CarStatus.OTB_SCHEDULED.name
          ? bottomSheetWidget()
          : const SizedBox(),
    ),);
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

TextStyle _getValueStyle(Item item) {
  switch (item.title) {
    case "RC Availability":
      return (item.value == "Original" || item.value == "Photocopy")
          ? MyStyles.green_12500
          : MyStyles.warningRed_12500;
    case "Insurance":
      return (item.value == "Not Applicable") ? MyStyles.warningRed_12500 : MyStyles.green_12500;
    case "RC Mismatch":
    case "Under Hypothecation":
      return (item.value == "Yes") ? MyStyles.warningRed_12500 : MyStyles.green_12500;
    case "No Claim Bonus":
    case "Loan NOC Issued":
    case "Loan Closed":
    case "Form 35":
    case "Duplicate Key":
      return (item.value == "No") ? MyStyles.warningRed_12500 : MyStyles.green_12500;
    default:
      return MyStyles.black12400;
  }
}
