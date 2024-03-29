import 'dart:convert';
import 'dart:developer';

import 'package:evaluator_app/model/response/car_details/report_response.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/service/exception_error_util.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:evaluator_app/widgets/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

class CarDetailsScreenViewModel extends GetxController {

  RxInt pageIndex = 0.obs;
  var id = Get.arguments ?? '';

  ///page 1
  String carStatus = "";
  //""
  //bid won
  //bid closed
  //car sold 

  List<String> imageList = [
    MyStrings.exterior,
    MyStrings.interior,
    MyStrings.engine,
    MyStrings.damage
  ];

  late ScrollController scrollController;
  RxBool showSliverAppBarTitle = false.obs;

  void scrollListener() {
    scrollController = ScrollController()
    ..addListener(() {
        showSliverAppBarTitle.value = isSliverAppBarExpanded? true: false ;
    });
  }

  bool get isSliverAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (600 - kToolbarHeight);
  }

  ///page 2
  final GlobalKey<State<StatefulWidget>> documentKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> exteriorKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> interiorElectricalKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> engineKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> acKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> testDriveKey = GlobalKey();

  RxInt inspectionIndex = 0.obs;
  Future scrollItem() async{
    BuildContext? context;
    if(inspectionIndex.value==0){
      context = documentKey.currentContext;
    } else if(inspectionIndex.value==1){
      context = exteriorKey.currentContext;
    } else if(inspectionIndex.value==2){
      context = interiorElectricalKey.currentContext;
    } else if(inspectionIndex.value==3){
      context = engineKey.currentContext;
    } else if(inspectionIndex.value==4){
      context = acKey.currentContext;
    } else if(inspectionIndex.value==5){
      context = testDriveKey.currentContext;
    }
    await Scrollable.ensureVisible(context!, duration: const Duration(milliseconds: 800));
  }

  // List<Map<String, dynamic>> rating = [
  //   {"title": MyStrings.documents, "rating": 0.0},
  //   {"title": MyStrings.exterior, "rating": 4.5},
  //   {"title": MyStrings.interiorAndElectrical, "rating": 3.0},
  //   {"title": MyStrings.engine, "rating": 1.5},
  //   {"title": MyStrings.ac, "rating": 3.2},
  //   {"title": MyStrings.testDrive, "rating": 2.4}
  // ];

  late TabController exteriorTabController;
  late TabController interiorElectricalTabController;
  late TabController engineTabController;
  late TabController acTabController;
  late TabController testDriveTabController;

  RxBool exteriorShowMore = false.obs;
  RxBool interiorShowMore = false.obs;
  RxBool engineShowMore = false.obs;
  RxBool acShowMore = false.obs;
  RxBool testDriveShowMore = false.obs;

  RxBool playVideo = false.obs;

  Rxn<VideoPlayerController> videoController = Rxn<VideoPlayerController>();

  @override
  void onInit() {
    scrollListener();
    // videoController.value = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://bucketkeracars.s3.ap-south-1.amazonaws.com/startVideo-1710486615054-a5a565fa-745c-45bf-abd0-703cf2957f51827885497507968836.mp4'))
    //   ..initialize().then((_) {});
    getReport();
    super.onInit();
  }

  List<String> goodListData = ["good", "normal", 
  "condition ok", "no blowby", "front rh power window working", 
  "rear rh power window working", "front lh power window working", 
  "rear lh power window working", "all windows working"];

  List<String> yellowListData = [
    "scratch", "dent", "fade", "colour mismatch", "repainted", "moderated", "chipped", "foggy",
    "minor sound", "tappet noise", "timing noise", "silencer noise", "turbo & whistling noise", 
    "injector leakage", "white smoke", "black smoke", "weak", "terminal corroded", "manifold", "blowby on idle",
    "oil spillage on idle", "noisy", "leakage from tappet cover oil", "leakage from side cover oil", "low oil", "speedometer not working",
    "warning light", "rattling sound", "dirty seat cover", "front rh power window stuck", "rear rh power window stuck", "front lh power window stuck",
    "rear lh power window stuck", "rat damage", "hard", "abnormal noise", "modified horn", "cooling low", "weak compression ac"
  ];

  List<String> redListData = ["rusted", "replaced", "cracked", "welded", "clamped", "repaired", "critical sound", 
  "damaged", "weak compression", "air filter box damaged", "blue smoke", "fluid leakage", "back compression", "shift hard-gear", 
  "not engaging-gear", "noisy", "jittering", "dirty oil", "leakage-turbo", "ac vent grill broken", "front rh power window not working", "rear rh power window not working",
  "front lh power window not working", "rear lh power window not working", "ecm malfunction", "fuel pump not working", "wiring damage", "electric not working", "hydraulic not working",
  "weak breaks", "gear not engaged", "drum scratch", "alloy wheel missing", "needs replacement", "deployed", "not satisfactory",
  "abs ebd sensor damaged", "abs ebd module damaged"];

  var ratingList = <Item>[].obs;
  var vehicleDetails = <Master>[].obs;
  var documents = <Master>[].obs;
  var exterior = <Master>[].obs;
  // var exteriorImages = <Master>[].obs;
  // var interiorImages = <Master>[].obs;
  var airCondition = <Master>[].obs;
  var engine = <Master>[].obs;
  // var engineImages = <Master>[].obs;
  var testDrive = <Master>[].obs;
  var features = <Master>[].obs;
  // var allImages = <Master>[].obs;
  var interiorAndElectrical = <Master>[].obs;
  var reportResponse = ReportResponse().obs;
  // List<DashBoardClass> dashboard = [];
  List<String> imageUrls = [];

  //other parts
  var exteriorOtherParts = <Master>[].obs;
  var interiorAndElectricalOtherParts = <Master>[].obs;
  var engineOtherParts = <Master>[].obs;
  var airConditionOtherParts = <Master>[].obs;
  var testDriveOtherParts = <Master>[].obs;

  void separateListData() {
    for(int i=0; i<exterior.length; i++){
      if(goodListData.contains(exterior[i].value.toString().toLowerCase())){
        exteriorOtherParts.add(exterior[i]);
      }
      if(exterior[i].listValue != null){
        for(int j=0; j<exterior[i].listValue!.length; j++){
          if(goodListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exteriorOtherParts.add(exterior[i]);
          }
        }
      }
    }
    for(int i=0; i<interiorAndElectrical.length; i++){
      if(goodListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
      }
      if(interiorAndElectrical[i].listValue != null){
        for(int j=0; j<interiorAndElectrical[i].listValue!.length; j++){
          if(goodListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
          }
        }
      }
    }
    for(int i=0; i<engine.length; i++){
      if(goodListData.contains(engine[i].value.toString().toLowerCase())){
        engineOtherParts.add(engine[i]);
      }
      if(engine[i].listValue != null){
        for(int j=0; j<engine[i].listValue!.length; j++){
          if(goodListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engineOtherParts.add(engine[i]);
          }
        }
      }
    }
    for(int i=0; i<airCondition.length; i++){
      if(goodListData.contains(airCondition[i].value.toString().toLowerCase())){
        airConditionOtherParts.add(airCondition[i]);
      }
      if(airCondition[i].listValue != null){
        for(int j=0; j<airCondition[i].listValue!.length; j++){
          if(goodListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airConditionOtherParts.add(airCondition[i]);
          }
        }
      }
    }
    for(int i=0; i<testDrive.length; i++){
      if(goodListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDriveOtherParts.add(testDrive[i]);
      }
      if(testDrive[i].listValue != null){
        for(int j=0; j<testDrive[i].listValue!.length; j++){
          if(goodListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDriveOtherParts.add(testDrive[i]);
          }
        }
      }
    }
    log("exterior other parts: ${exteriorOtherParts}");
    log("interior other parts: ${interiorAndElectricalOtherParts}");
    log("engine other parts: ${engineOtherParts}");
    log("air other parts: ${airConditionOtherParts}");
    log("test other parts: ${testDriveOtherParts}");
  }


   List<String> extractUrls(Map<String, dynamic> mainObject) {
    List<String> urls = [];

    mainObject.forEach((key, value) {
      if (value is Map<String, dynamic> && value.containsKey('url') && value['url'] != null) {
        urls.add(value['url']);
      }
    });
    imageUrls = urls;
    return urls;
  }

  void getReport() async {
    // ProgressBar.instance.showProgressbar(Get.context!);
    try {
      log(Uri.parse(EndPoints.baseUrl + EndPoints.evaluation + '/' + EndPoints.report + '$id').toString());
      var response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.evaluation + '/' + EndPoints.report + '$id'), 
      headers: globals.headers
      );
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        reportResponse.value = ReportResponse.fromJson(jsonDecode(response.body));
        if (reportResponse.value.data != null) {
          ratingList.value = [
            Item(title: MyStrings.documents, rating: 0.0),
            Item(title: MyStrings.exterior, rating: reportResponse.value.data!.allCarInfo!.exteriorStar?.toDouble() ?? 0),
            Item(title: MyStrings.interiorAndElectrical, rating: reportResponse.value.data!.allCarInfo!.interiorAndElectricalStar?.toDouble() ?? 0),
            Item(title: MyStrings.engine, rating: reportResponse.value.data!.allCarInfo!.engineStar?.toDouble() ?? 0),
            // Item(title: MyStrings.aC, rating: reportResponse.value.data!.allCarInfo!.acStar?.toDouble() ?? 0),
            Item(title: MyStrings.ac, rating: 3.2),
            Item(title: MyStrings.testDrive, rating: reportResponse.value.data!.allCarInfo!.testDriveStar?.toDouble() ?? 0),
          ];
          // vehicleDetails.value = [
          //   Master(title: MyStrings.registrationNumber, value: reportResponse.value.data!.regNumber ?? ''),
          //   Master(title: MyStrings.registrationDate, value: reportResponse.value.data!.regDate ?? ''),
          //   Master(title: MyStrings.ownershipNumber, value: reportResponse.value.data!.allCarInfo?.ownershipNumber ?? ''),
          //   Master(title: MyStrings.fuelType, value: reportResponse.value.data!.allCarInfo?.fuelType ?? ''),
          //   Master(title: MyStrings.transmission, value: reportResponse.value.data!.allCarInfo!.transmissionManual ?? ''),
          //   Master(title: MyStrings.bodyType, value: reportResponse.value.data!.bodyType ?? ''),
          //   Master(title: MyStrings.color, value: reportResponse.value.data!.color ?? ''),
          //   Master(title: MyStrings.kilometer, value: reportResponse.value.data!.odometerReading.toString()),
          //   Master(title: MyStrings.chassisNumber, value: reportResponse.value.data!.chasisNumber ?? ''),
          //   Master(title: MyStrings.specialComments, value: reportResponse.value.data!.allCarInfo?.specialComments ?? ''),
          // ];
          documents.value = [
            Master(title: MyStrings.rc, value: reportResponse.value.data!.rcAvailability ?? ''),
            Master(title: MyStrings.insurance, value: reportResponse.value.data!.insurance ?? ''),
            Master(title: MyStrings.form35, value: reportResponse.value.data!.form35 ?? ''),
          ];
          // features.value = [
          //   Master(title: MyStrings.keyLessEntry, value: reportResponse.value.data!.allCarInfo!.keylessEntry?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.stereoImage, value: reportResponse.value.data!.allCarInfo!.stereoBrand ?? ''),
          //   Master(title: MyStrings.stereoBrand, value: reportResponse.value.data!.allCarInfo!.stereoBrand ?? ''),
          //   Master(title: MyStrings.rearParkingSensor, value: reportResponse.value.data!.allCarInfo!.rearParkingSensor ?? ''),
          //   Master(title: MyStrings.fogLamp, value: reportResponse.value.data!.allCarInfo!.fogLamps ?? ''),
          //   Master(title: MyStrings.sunroof, value: reportResponse.value.data!.allCarInfo!.sunroof?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.gpsNavigation, value: reportResponse.value.data!.allCarInfo!.gpsNavigation ?? ''),
          //   Master(title: MyStrings.alloyWheels, value: reportResponse.value.data!.allCarInfo!.alloyWheels?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.airBag, value: reportResponse.value.data!.allCarInfo!.airbag?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.seatBelt, value: reportResponse.value.data!.allCarInfo!.seatBelt ?? ''),
          //   Master(title: MyStrings.absEbd, value: reportResponse.value.data!.allCarInfo!.absEbd?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.gloveBox, value: reportResponse.value.data!.allCarInfo!.gloveBox?.condition?.join(',') ?? ''),
          //   Master(title: MyStrings.interiorModifications, value: reportResponse.value.data!.allCarInfo!.interiorView?.condition?.join(',') ?? ''),
          // ];
          testDrive.value = [
            Master(title: MyStrings.steering, value: reportResponse.value.data!.allCarInfo!.steeringSystem ?? ''),
            Master(title: MyStrings.steeringWheel, listValue: reportResponse.value.data!.allCarInfo!.steeringWheel),
            Master(title: MyStrings.steeringAdjustment, value: reportResponse.value.data!.allCarInfo!.steeringAdjustment ?? ''),
            Master(title: MyStrings.steeringMountedAudio, value: reportResponse.value.data!.allCarInfo!.steeringMountedAudioControl ?? ''),
            Master(title: MyStrings.cruiseControl, value: reportResponse.value.data!.allCarInfo!.cruiseControl ?? ''),
            Master(title: MyStrings.seatAdjustment, value: reportResponse.value.data!.allCarInfo!.seatAdjustment ?? ''),
            Master(title: MyStrings.suspensionSystem, listValue: reportResponse.value.data!.allCarInfo!.suspension),
            Master(title: MyStrings.brakes, value: reportResponse.value.data!.allCarInfo!.brakes ?? ''),
            Master(title: MyStrings.clutchSystem, value: reportResponse.value.data!.allCarInfo!.clutchSystem ?? ''),
            Master(title: MyStrings.transmissionAutomatic, listValue: reportResponse.value.data!.allCarInfo!.transmissionAutomatic),
            Master(title: MyStrings.vehicleHorn, listValue: reportResponse.value.data!.allCarInfo!.vehicleHorn),
          ];
          engine.value = [
            Master(title: MyStrings.engineSound, value: reportResponse.value.data!.allCarInfo!.engineSound ?? ''),
            Master(title: MyStrings.engine, listValue: reportResponse.value.data!.allCarInfo?.engine?.condition),
            Master(title: MyStrings.smoke, value: reportResponse.value.data!.allCarInfo!.exhaustSmoke ?? ''),
            Master(title: MyStrings.battery, listValue: reportResponse.value.data!.allCarInfo!.battery?.condition),
            Master(title: MyStrings.radiator, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
            Master(title: MyStrings.startingMotor, value: reportResponse.value.data!.allCarInfo!.startingMotor ?? ''),
            Master(title: MyStrings.coolant, value: reportResponse.value.data!.allCarInfo!.coolant ?? ''),
            Master(title: MyStrings.blowByBackCompression, listValue: reportResponse.value.data!.allCarInfo!.blowBy?.condition),
            Master(title: MyStrings.silencer, value: reportResponse.value.data!.allCarInfo!.silencer ?? ''),
            Master(title: MyStrings.clutchOperations, listValue: reportResponse.value.data!.allCarInfo!.clutch?.condition),
            Master(title: MyStrings.gearbox, listValue: reportResponse.value.data!.allCarInfo!.gearBox?.condition),
            Master(title: MyStrings.engineOil, listValue: reportResponse.value.data!.allCarInfo!.engineOil?.condition),
            Master(title: MyStrings.turboCharger, listValue: reportResponse.value.data!.allCarInfo!.turboCharger?.condition),
            Master(title: MyStrings.gearboxLeakage, value: reportResponse.value.data!.allCarInfo!.gearBoxLeakage ?? ''),
            Master(title: MyStrings.engineMount, listValue: reportResponse.value.data!.allCarInfo!.mount?.condition),
            Master(title: MyStrings.sump, listValue: reportResponse.value.data!.allCarInfo!.sump?.condition),
            Master(title: MyStrings.comments, value: reportResponse.value.data!.allCarInfo!.engineComment ?? ''),
          ];
          interiorAndElectrical.value = [
            Master(title: MyStrings.clusterPanel, listValue: reportResponse.value.data!.allCarInfo!.clusterPanel?.condition),
            Master(title: MyStrings.warningLight, value: reportResponse.value.data!.allCarInfo!.warningDetails ?? ''),
            Master(title: MyStrings.dashboardImage, value: reportResponse.value.data!.allCarInfo!.dashboardCondition ?? ''),
            Master(title: MyStrings.frontSeatImage, listValue: reportResponse.value.data!.allCarInfo!.frontSeatImage?.condition),
            Master(title: MyStrings.rearSeatImage, listValue: reportResponse.value.data!.allCarInfo!.rearSeatImage?.condition),
            Master(title: MyStrings.insideRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.interiorView?.condition),
            Master(title: MyStrings.pushButtonOnOff, value: reportResponse.value.data!.allCarInfo!.pushButton ?? ''),
            Master(title: MyStrings.dashboardSwitches, value: reportResponse.value.data!.allCarInfo!.dashboardSwitch ?? ''),
            Master(title: MyStrings.powerWindowAndWindowLock, listValue: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock?.condition),
            Master(title: MyStrings.handBrake, listValue: reportResponse.value.data!.allCarInfo!.handBreak),
            Master(title: MyStrings.carElectrical, listValue: reportResponse.value.data!.allCarInfo!.carElectrical?.condition),
            Master(title: MyStrings.secondKey, value: reportResponse.value.data!.allCarInfo!.secondKey ?? ''),
            Master(title: MyStrings.platform, listValue: reportResponse.value.data!.allCarInfo!.platformImage?.condition),
          ];
          airCondition.value = [
            Master(title: MyStrings.acWorking, value: reportResponse.value.data!.allCarInfo!.acWorking ?? ''),
            Master(title: MyStrings.cooling, listValue: reportResponse.value.data!.allCarInfo!.airCooling),
            Master(title: MyStrings.heater, value: reportResponse.value.data!.allCarInfo!.heater ?? ''),
            Master(title: MyStrings.climateControl, value: reportResponse.value.data!.allCarInfo!.climateControl ?? ''),
            Master(title: MyStrings.acCondenserCompressor, listValue: reportResponse.value.data!.allCarInfo!.acCondensor),
            Master(title: MyStrings.acFilterDamaged, value: reportResponse.value.data!.allCarInfo!.acFilterDamaged ?? ''),
            Master(title: MyStrings.acBlowerGrill, value: reportResponse.value.data!.allCarInfo!.acBlowerGrill ?? ''),
            Master(title: MyStrings.rearDefogger, value: reportResponse.value.data!.allCarInfo!.rearDefogger ?? ''),
          ];
          exterior.value = [
            Master(title: MyStrings.frontImage, listValue: reportResponse.value.data!.allCarInfo?.front?.condition),
            Master(title: MyStrings.frontLeftImage, listValue: reportResponse.value.data!.allCarInfo?.frontLeft?.condition),
            Master(title: MyStrings.frontRightImage, listValue: reportResponse.value.data!.allCarInfo?.frontRight?.condition),
            Master(title: MyStrings.leftImage, listValue: reportResponse.value.data!.allCarInfo?.leftImage?.condition),
            Master(title: MyStrings.rightImage, listValue: reportResponse.value.data!.allCarInfo?.rightImage?.condition),
            Master(title: MyStrings.rearLeftImage, listValue: reportResponse.value.data!.allCarInfo?.rearLeft?.condition),
            Master(title: MyStrings.rearImage, listValue: reportResponse.value.data!.allCarInfo?.rear?.condition),
            Master(title: MyStrings.rearRight, listValue: reportResponse.value.data!.allCarInfo?.rearRight?.condition),
            Master(title: MyStrings.roofImage, listValue: reportResponse.value.data!.allCarInfo?.roof?.condition),
            Master(title: MyStrings.frontWindShieldWiper, listValue: reportResponse.value.data!.allCarInfo?.frontWindShield?.condition),
            Master(title: MyStrings.rearWindShield, listValue: reportResponse.value.data!.allCarInfo?.rearWindShield?.condition),
            Master(title: MyStrings.doorGlassLH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassLeft?.condition),
            Master(title: MyStrings.doorGlassRH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassRight?.condition),
            Master(title: MyStrings.quarterGlass, listValue: reportResponse.value.data!.allCarInfo?.quarterGlass?.condition),
            Master(title: MyStrings.headlightsLH, listValue: reportResponse.value.data!.allCarInfo?.headLightLeft?.condition),
            Master(title: MyStrings.headlightsRH, listValue: reportResponse.value.data!.allCarInfo?.headLightRight?.condition),
            Master(title: MyStrings.headlightSupport, listValue: reportResponse.value.data!.allCarInfo?.headLightSupport?.condition),
            Master(title: MyStrings.frontBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperFront?.condition),
            Master(title: MyStrings.rearBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperRear?.condition),
            Master(title: MyStrings.frontGrill, listValue: reportResponse.value.data!.allCarInfo?.grill?.condition),
            Master(title: MyStrings.bonnetPatti, listValue: reportResponse.value.data!.allCarInfo?.bonnetPatti?.condition),
            Master(title: MyStrings.upperCrossMember, listValue: reportResponse.value.data!.allCarInfo?.upperCrossMember?.condition),
            Master(title: MyStrings.lowerCrossMember, listValue: reportResponse.value.data!.allCarInfo?.lowerCrossMember?.condition),
            Master(title: MyStrings.apronLH, listValue: reportResponse.value.data!.allCarInfo?.apronLeft?.condition),
            Master(title: MyStrings.apronRH, listValue: reportResponse.value.data!.allCarInfo?.apronRight?.condition),
            Master(title: MyStrings.cowlTop, listValue: reportResponse.value.data!.allCarInfo?.cowlTop?.condition),
            Master(title: MyStrings.chassisExtension, listValue: reportResponse.value.data!.allCarInfo?.chassisExtension?.condition),
            Master(title: MyStrings.tyreFrontRHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreRight?.condition),
            Master(title: MyStrings.tyreFrontLHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreLeft?.condition),
            Master(title: MyStrings.tyreRearRHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreRight?.condition),
            Master(title: MyStrings.tyreRearLHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreLeft?.condition),
            Master(title: MyStrings.lhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderLeft?.condition),
            Master(title: MyStrings.rhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderRight?.condition),
            Master(title: MyStrings.lhQuarterPanel, listValue: reportResponse.value.data!.allCarInfo?.quarterPanelLeft?.condition),
            Master(title: MyStrings.frontLHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontLeft?.condition),
            Master(title: MyStrings.frontRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontRight?.condition),
            Master(title: MyStrings.rearRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorRearRight?.condition),
            Master(title: MyStrings.lhaPillar, listValue: reportResponse.value.data!.allCarInfo?.leftApillar?.condition),
            Master(title: MyStrings.rhaPillar, listValue: reportResponse.value.data!.allCarInfo?.rightApillar?.condition),
            Master(title: MyStrings.lhbPillar, listValue: reportResponse.value.data!.allCarInfo?.leftBpillar?.condition),
            Master(title: MyStrings.rhbPillar, listValue: reportResponse.value.data!.allCarInfo?.rightBpillar?.condition),
            Master(title: MyStrings.lhcPillar, listValue: reportResponse.value.data!.allCarInfo?.leftCpillar?.condition),
            Master(title: MyStrings.rhcPillar, listValue: reportResponse.value.data!.allCarInfo?.rightCpillar?.condition),
            Master(title: MyStrings.lhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderLeft?.condition),
            Master(title: MyStrings.rhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderRight?.condition),
            Master(title: MyStrings.tailLightLh, listValue: reportResponse.value.data!.allCarInfo?.tailLightLeft?.condition),
            Master(title: MyStrings.tailLightRh, listValue: reportResponse.value.data!.allCarInfo?.tailLightRight?.condition),
            Master(title: MyStrings.rearWiper, listValue: reportResponse.value.data!.allCarInfo?.rearWiper?.condition),
            Master(title: MyStrings.boot, listValue: reportResponse.value.data!.allCarInfo?.boot?.condition),
            Master(title: MyStrings.dickyDoor, listValue: reportResponse.value.data!.allCarInfo?.dickyDoor?.condition),
            Master(title: MyStrings.spareWheel, listValue: reportResponse.value.data!.allCarInfo?.spareWheel?.condition),
            Master(title: MyStrings.jackAndTool, value: reportResponse.value.data!.allCarInfo?.jackAndTool),
            Master(title: MyStrings.lhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorLeft?.condition),
            Master(title: MyStrings.rhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorRight?.condition),
            Master(title: MyStrings.fuelLid, listValue: reportResponse.value.data!.allCarInfo?.fuelLid?.condition),
            Master(title: MyStrings.firewall, listValue: reportResponse.value.data!.allCarInfo?.firewall?.condition),
            Master(title: MyStrings.fullBodyRepaint, value: reportResponse.value.data!.allCarInfo?.fullBodyRepaint ?? ''),
            Master(title: MyStrings.missingParts, value: reportResponse.value.data!.allCarInfo!.missingParts ?? ''),
          ];
          // extractUrls(reportResponse.value.data!.allCarInfo!.toJson());
          if(reportResponse.value.data!.allCarInfo!.startVideo!.url != null){
            videoController.value = VideoPlayerController.networkUrl(Uri.parse(
            reportResponse.value.data!.allCarInfo!.startVideo!.url!))
            ..initialize().then((_) {});
          }
          separateListData();
          update();
          refresh();
          notifyChildrens();
        }
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }  
}

class Item {
  Item({
    required this.title,
    required this.rating,
  });

  String title;
  double rating;
}

class Master {
  Master({
    required this.title,
    this.value,
    this.listValue,
  });

  String title;
  String? value;
  List<String>? listValue;
}
