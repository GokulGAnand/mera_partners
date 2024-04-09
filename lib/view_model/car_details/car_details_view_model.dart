import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/model/response/car_details/report_response.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;

class CarDetailsScreenViewModel extends GetxController {

  RxInt pageIndex = 0.obs;
  var id = Get.arguments ?? '';

  ///page 1
  String carStatus = "";
  //""
  //bid won
  //bid closed
  //car sold 

  Rx<PageController> pageSliderController = PageController(initialPage: 0, viewportFraction: 1).obs;
  var activePage = 0.obs;
  // Timer? carouselTimer;

  List<Map<String, dynamic>> imageList = [];

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

  var sliderImage = <String>[].obs;
  var criticalIssue = <String>[].obs;
  var ratingList = <Item>[].obs;
  // var vehicleDetails = <Master>[].obs;
  var documents = <Master>[].obs;
  var otherInformation = <Master>[].obs;
  var regAndFitness = <Master>[].obs;
  var exterior = <Master>[].obs;
  var exteriorImages = <Master>[].obs;
  var interiorImages = <Master>[].obs;
  var airCondition = <Master>[].obs;
  var engine = <Master>[].obs;
  var engineImages = <Master>[].obs;
  var damageImages = <Master>[].obs;
  var testDrive = <Master>[].obs;
  // var features = <Master>[].obs;
  // var allImages = <Master>[].obs;
  var interiorAndElectrical = <Master>[].obs;
  var reportResponse = ReportResponse().obs;
  // List<DashBoardClass> dashboard = [];
  // List<String> imageUrls = [];

  //issue
  var exteriorIssue = <Master>[].obs;
  var interiorAndElectricalIssue = <Master>[].obs;
  var engineIssue = <Master>[].obs;
  var airConditionIssue = <Master>[].obs;
  var testDriveIssue = <Master>[].obs;

  //other parts
  var exteriorOtherParts = <Master>[].obs;
  var interiorAndElectricalOtherParts = <Master>[].obs;
  var engineOtherParts = <Master>[].obs;
  var airConditionOtherParts = <Master>[].obs;
  var testDriveOtherParts = <Master>[].obs;

  void separateListData() {
      if(redListData.contains(reportResponse.value.data!.allCarInfo!.carCondition.toString().toLowerCase())){
        criticalIssue.add(reportResponse.value.data!.allCarInfo!.carCondition.toString().toLowerCase());
      }
      if(redListData.contains(reportResponse.value.data!.allCarInfo!.specialComments.toString().toLowerCase())){
        criticalIssue.add(reportResponse.value.data!.allCarInfo!.specialComments.toString().toLowerCase());
      }
    for(int i=0; i<exterior.length; i++){
      if(goodListData.contains(exterior[i].value.toString().toLowerCase())){
        exteriorOtherParts.add(exterior[i]);
      }
      if(redListData.contains(exterior[i].value.toString().toLowerCase())){
        exterior[i].color = MyColors.warning;
        exteriorIssue.add(exterior[i]);
      }
      if(yellowListData.contains(exterior[i].value.toString().toLowerCase())){
        exterior[i].color = MyColors.yellow;
        exteriorIssue.add(exterior[i]);
      }
      if(exterior[i].listValue != null){
        for(int j=0; j<exterior[i].listValue!.length; j++){
          if(goodListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exteriorOtherParts.add(exterior[i]);
          }
          if(redListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exterior[i].color = MyColors.warning;
            exteriorIssue.add(exterior[i]);
          }
          if(yellowListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exterior[i].color = MyColors.yellow;
            exteriorIssue.add(exterior[i]);
          }
          if(exterior[i].listValue![j].isEmpty){
            exterior[i].listValue!.removeAt(j);
          }
        }
      }
    }
    for(int i=0; i<interiorAndElectrical.length; i++){
      if(goodListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
      }
      if(redListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectrical[i].color = MyColors.warning;
        interiorAndElectricalIssue.add(interiorAndElectrical[i]);
      }
      if(yellowListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectrical[i].color = MyColors.yellow;
        interiorAndElectricalIssue.add(interiorAndElectrical[i]);
      }
      if(interiorAndElectrical[i].listValue != null){
        for(int j=0; j<interiorAndElectrical[i].listValue!.length; j++){
          if(goodListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
          }
          if(redListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectrical[i].color = MyColors.warning;
            interiorAndElectricalIssue.add(interiorAndElectrical[i]);
          }
          if(yellowListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectrical[i].color = MyColors.yellow;
            interiorAndElectricalIssue.add(interiorAndElectrical[i]);
          }
          if(interiorAndElectrical[i].listValue![j].isEmpty){
            interiorAndElectrical[i].listValue!.removeAt(j);
          }
        }
      }
    }
    for(int i=0; i<engine.length; i++){
      if(goodListData.contains(engine[i].value.toString().toLowerCase())){
        engineOtherParts.add(engine[i]);
      }
      if(redListData.contains(engine[i].value.toString().toLowerCase())){
        engine[i].color = MyColors.warning;
        engineIssue.add(engine[i]);
      }
      if(yellowListData.contains(engine[i].value.toString().toLowerCase())){
        engine[i].color = MyColors.yellow;
        engineIssue.add(engine[i]);
      }
      if(engine[i].listValue != null){
        for(int j=0; j<engine[i].listValue!.length; j++){
          if(goodListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engineOtherParts.add(engine[i]);
          }
          if(redListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engine[i].color = MyColors.warning;
            engineIssue.add(engine[i]);
          }
          if(yellowListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engine[i].color = MyColors.yellow;
            engineIssue.add(engine[i]);
          }
          if(engine[i].listValue![j].isEmpty){
            engine[i].listValue!.removeAt(j);
          }
        }
      }
    }
    for(int i=0; i<airCondition.length; i++){
      if(goodListData.contains(airCondition[i].value.toString().toLowerCase())){
        airConditionOtherParts.add(airCondition[i]);
      }
      if(redListData.contains(airCondition[i].value.toString().toLowerCase())){
        airCondition[i].color = MyColors.warning;
        airConditionIssue.add(airCondition[i]);
      }
      if(yellowListData.contains(airCondition[i].value.toString().toLowerCase())){
        airCondition[i].color = MyColors.yellow;
        airConditionIssue.add(airCondition[i]);
      }
      if(airCondition[i].listValue != null){
        for(int j=0; j<airCondition[i].listValue!.length; j++){
          if(goodListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airConditionOtherParts.add(airCondition[i]);
          }
          if(redListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airCondition[i].color = MyColors.warning;
            airConditionIssue.add(airCondition[i]);
          }
          if(yellowListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airCondition[i].color = MyColors.yellow;
            airConditionIssue.add(airCondition[i]);
          }
          if(airCondition[i].listValue![j].isEmpty){
            airCondition[i].listValue!.removeAt(j);
          }
        }
      }
    }
    for(int i=0; i<testDrive.length; i++){
      if(goodListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDriveOtherParts.add(testDrive[i]);
      }
      if(redListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDrive[i].color = MyColors.warning;
        testDriveIssue.add(testDrive[i]);
      }
      if(yellowListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDrive[i].color = MyColors.yellow;
        testDriveIssue.add(testDrive[i]);
      }
      if(testDrive[i].listValue != null){
        for(int j=0; j<testDrive[i].listValue!.length; j++){
          if(goodListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDriveOtherParts.add(testDrive[i]);
          }
          if(redListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDrive[i].color = MyColors.warning;
            testDriveIssue.add(testDrive[i]);
          }
          if(yellowListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDrive[i].color = MyColors.yellow;
            testDriveIssue.add(testDrive[i]);
          }
           if(testDrive[i].listValue![j].isEmpty){
            testDrive[i].listValue!.removeAt(j);
          }
        }
      }
    }
    log("exterior other parts: ${exteriorOtherParts}");
    log("interior other parts: ${interiorAndElectricalOtherParts}");
    log("engine other parts: ${engineOtherParts}");
    log("air other parts: ${airConditionOtherParts}");
    log("test other parts: ${testDriveOtherParts}");

    log("exterior issue: ${exteriorIssue}");
    log("interior issue: ${interiorAndElectricalIssue}");
    log("engine issue: ${engineIssue}");
    log("air issue: ${airConditionIssue}");
    log("test issue: ${testDriveIssue}");
  }


   void addImageList() {
    exteriorImages.value = [
      if(reportResponse.value.data!.allCarInfo!.front != null) Master(title: MyStrings.frontImage, value: reportResponse.value.data!.allCarInfo!.front!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.frontLeft != null) Master(title: MyStrings.frontLeftImage, value: reportResponse.value.data!.allCarInfo!.frontLeft!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.frontRight != null) Master(title: MyStrings.frontRightImage, value: reportResponse.value.data!.allCarInfo!.frontRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.leftImage != null) Master(title: MyStrings.leftImage, value: reportResponse.value.data!.allCarInfo!.leftImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rightImage != null) Master(title: MyStrings.rightImage, value: reportResponse.value.data!.allCarInfo!.rightImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearLeft != null) Master(title: MyStrings.rearLeftImage, value: reportResponse.value.data!.allCarInfo!.rearLeft!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rear != null) Master(title: MyStrings.rearImage, value: reportResponse.value.data!.allCarInfo!.rear!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearRight != null) Master(title: MyStrings.rearRight, value: reportResponse.value.data!.allCarInfo!.rearRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.roof != null) Master(title: MyStrings.roofImage, value: reportResponse.value.data!.allCarInfo!.roof!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.bumperFront != null) Master(title: MyStrings.frontBumper, value: reportResponse.value.data!.allCarInfo!.bumperFront!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.apronLeft != null) Master(title: MyStrings.apronLH, value: reportResponse.value.data!.allCarInfo!.apronLeft!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.apronRight != null) Master(title: MyStrings.apronRH, value: reportResponse.value.data!.allCarInfo!.apronRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.frontTyreRight != null) Master(title: MyStrings.tyreFrontRHS, value: reportResponse.value.data!.allCarInfo!.frontTyreRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.frontTyreLeft != null) Master(title: MyStrings.tyreFrontLHS, value: reportResponse.value.data!.allCarInfo!.frontTyreLeft!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearTyreRight != null) Master(title: MyStrings.tyreRearRHS, value: reportResponse.value.data!.allCarInfo!.rearTyreRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearTyreLeft != null) Master(title: MyStrings.tyreRearLHS, value: reportResponse.value.data!.allCarInfo!.rearTyreLeft!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.doorFrontRight != null) Master(title: MyStrings.frontRHDoor, value: reportResponse.value.data!.allCarInfo!.doorFrontRight!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.boot != null) Master(title: MyStrings.boot, value: reportResponse.value.data!.allCarInfo!.boot!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.spareWheel != null) Master(title: MyStrings.spareWheel, value: reportResponse.value.data!.allCarInfo!.spareWheel!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.fuelLid != null) Master(title: MyStrings.fuelLid, value: reportResponse.value.data!.allCarInfo!.fuelLid!.url ?? ''),
    ];
    interiorImages.value = [
      if(reportResponse.value.data!.allCarInfo!.clusterPanel != null) Master(title: MyStrings.clusterPanel, value: reportResponse.value.data!.allCarInfo!.clusterPanel!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.dashboardImage != null) Master(title: MyStrings.dashboardImage, value: reportResponse.value.data!.allCarInfo!.dashboardImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.frontSeatImage != null) Master(title: MyStrings.frontSeatImage, value: reportResponse.value.data!.allCarInfo!.frontSeatImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearSeatImage != null) Master(title: MyStrings.rearSeatImage, value: reportResponse.value.data!.allCarInfo!.rearSeatImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.rearViewMirror != null) Master(title: MyStrings.insideRearViewMirror, value: reportResponse.value.data!.allCarInfo!.rearViewMirror!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.interiorView != null) Master(title: MyStrings.interiorViewFromBootDashboard, value: reportResponse.value.data!.allCarInfo!.interiorView!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.powerWindowDriverImage != null) Master(title: MyStrings.powerWindowDriverImage, value: reportResponse.value.data!.allCarInfo!.powerWindowDriverImage!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.pushWindowDriverImage != null) Master(title: MyStrings.pushWindowDriverImage, value: reportResponse.value.data!.allCarInfo!.pushWindowDriverImage!.url ?? ''),
    ];
    engineImages.value = [
      if(reportResponse.value.data!.allCarInfo!.engineCompartment != null) Master(title: MyStrings.engineCompartmentImage, value: reportResponse.value.data!.allCarInfo!.engineCompartment!.url ?? '')
    ];
    
    Map<String, dynamic> mainObject = reportResponse.value.data!.allCarInfo!.toJson();
    mainObject.forEach((key, value) {
      if (value is Map<String, dynamic> && value.containsKey('url') && value['url'] != null && value.containsValue('damaged')) {
        damageImages.add(value['url']);
      }
    });
    if(exteriorImages.isNotEmpty) imageList.add({"title":MyStrings.exterior, "imageList": exteriorImages});
    if(interiorImages.isNotEmpty) imageList.add({"title":MyStrings.interior, "imageList": interiorImages});
    if(engineImages.isNotEmpty) imageList.add({"title":MyStrings.engine, "imageList": engineImages});
    if(damageImages.isNotEmpty) imageList.add({"title":MyStrings.damage, "imageList": damageImages});
  }

  void getReport() async {
    // ProgressBar.instance.showProgressbar(Get.context!);
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}/${EndPoints.report}$id').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.evaluation}/${EndPoints.report}$id'),
      headers: globals.headers
      );
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body);
        reportResponse.value = ReportResponse.fromJson(jsonDecode(response.body));
        if (reportResponse.value.data != null) {
          sliderImage.value = [
            reportResponse.value.data!.allCarInfo!.frontLeft!.url ?? '',
            reportResponse.value.data!.allCarInfo!.front!.url ?? '',
            reportResponse.value.data!.allCarInfo!.frontRight!.url ?? '',
            reportResponse.value.data!.allCarInfo!.rear!.url ?? '',
            reportResponse.value.data!.allCarInfo!.engineCompartment!.url ?? '',
          ];
          ratingList.value = [
            Item(title: MyStrings.documents, rating: 0.0),
            Item(title: MyStrings.exterior, rating: reportResponse.value.data!.allCarInfo!.exteriorStar?.toDouble() ?? 0),
            Item(title: MyStrings.interiorAndElectrical, rating: reportResponse.value.data!.allCarInfo!.interiorAndElectricalStar?.toDouble() ?? 0),
            Item(title: MyStrings.engine, rating: reportResponse.value.data!.allCarInfo!.engineStar?.toDouble() ?? 0),
            // Item(title: MyStrings.aC, rating: reportResponse.value.data!.allCarInfo!.acStar?.toDouble() ?? 0),
            Item(title: MyStrings.ac, rating: 0.0),
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
            Master(title: MyStrings.rcAvailability, value: reportResponse.value.data!.rcAvailability ?? ''),
            Master(title: MyStrings.rcMismatch, value: reportResponse.value.data!.rcMismatch ?? ''),
            Master(title: MyStrings.nocIssued, value: reportResponse.value.data!.loanNoc ?? ''),
            Master(title: MyStrings.insurance, value: reportResponse.value.data!.insurance ?? ''),
            Master(title: MyStrings.ncb, value: reportResponse.value.data!.ncb ?? ''),
            Master(title: MyStrings.underHypothecation, value: reportResponse.value.data!.hypothecation ?? ''),
            Master(title: MyStrings.loanClosed, value: reportResponse.value.data!.loanStatus ?? ''),
            Master(title: MyStrings.form35, value: reportResponse.value.data!.form35 ?? ''),
          ];
          otherInformation.value = [
            Master(title: MyStrings.duplicateKey, value: reportResponse.value.data!.duplicateKey ?? ''),
            Master(title: MyStrings.chasisNumberEmbossing, value: reportResponse.value.data!.chasisNumber ?? ''),
          ];
          regAndFitness.value = [
            Master(title: MyStrings.manufacturingDate, value: reportResponse.value.data!.monthAndYearOfManufacture ?? ''),
            Master(title: MyStrings.regDate, value: reportResponse.value.data!.regDate ?? ''),
            Master(title: MyStrings.rto, value: reportResponse.value.data!.rto ?? ''),
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
            Master(title: MyStrings.engine, listValue: reportResponse.value.data!.allCarInfo?.engine?.condition, remarks: reportResponse.value.data!.allCarInfo!.engine?.remarks),
            Master(title: MyStrings.smoke, value: reportResponse.value.data!.allCarInfo!.exhaustSmoke ?? ''),
            Master(title: MyStrings.battery, listValue: reportResponse.value.data!.allCarInfo!.battery?.condition, remarks: reportResponse.value.data!.allCarInfo!.battery?.remarks),
            Master(title: MyStrings.radiator, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
            Master(title: MyStrings.startingMotor, value: reportResponse.value.data!.allCarInfo!.startingMotor ?? ''),
            Master(title: MyStrings.coolant, value: reportResponse.value.data!.allCarInfo!.coolant ?? ''),
            Master(title: MyStrings.blowByBackCompression, listValue: reportResponse.value.data!.allCarInfo!.blowBy?.condition, remarks: reportResponse.value.data!.allCarInfo!.blowBy?.remarks),
            Master(title: MyStrings.silencer, value: reportResponse.value.data!.allCarInfo!.silencer ?? ''),
            Master(title: MyStrings.clutchOperations, listValue: reportResponse.value.data!.allCarInfo!.clutch?.condition, remarks: reportResponse.value.data!.allCarInfo!.clutch?.remarks),
            Master(title: MyStrings.gearbox, listValue: reportResponse.value.data!.allCarInfo!.gearBox?.condition, remarks: reportResponse.value.data!.allCarInfo!.gearBox?.remarks),
            Master(title: MyStrings.engineOil, listValue: reportResponse.value.data!.allCarInfo!.engineOil?.condition, remarks: reportResponse.value.data!.allCarInfo!.engineOil?.remarks),
            Master(title: MyStrings.turboCharger, listValue: reportResponse.value.data!.allCarInfo!.turboCharger?.condition, remarks: reportResponse.value.data!.allCarInfo!.turboCharger?.remarks),
            Master(title: MyStrings.gearboxLeakage, value: reportResponse.value.data!.allCarInfo!.gearBoxLeakage ?? ''),
            Master(title: MyStrings.engineMount, listValue: reportResponse.value.data!.allCarInfo!.mount?.condition, remarks: reportResponse.value.data!.allCarInfo!.mount?.remarks),
            Master(title: MyStrings.sump, listValue: reportResponse.value.data!.allCarInfo!.sump?.condition, remarks: reportResponse.value.data!.allCarInfo!.sump?.remarks),
            Master(title: MyStrings.comments, value: reportResponse.value.data!.allCarInfo!.engineComment ?? ''),
          ];
          interiorAndElectrical.value = [
            Master(title: MyStrings.clusterPanel, listValue: reportResponse.value.data!.allCarInfo!.clusterPanel?.condition, remarks: reportResponse.value.data!.allCarInfo!.clusterPanel?.remarks),
            Master(title: MyStrings.warningLight, value: reportResponse.value.data!.allCarInfo!.warningDetails ?? ''),
            Master(title: MyStrings.dashboardImage, value: reportResponse.value.data!.allCarInfo!.dashboardCondition ?? ''),
            Master(title: MyStrings.frontSeatImage, listValue: reportResponse.value.data!.allCarInfo!.frontSeatImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontSeatImage?.remarks),
            Master(title: MyStrings.rearSeatImage, listValue: reportResponse.value.data!.allCarInfo!.rearSeatImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.rearSeatImage?.remarks),
            Master(title: MyStrings.insideRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.interiorView?.condition, remarks: reportResponse.value.data!.allCarInfo!.interiorView?.remarks),
            Master(title: MyStrings.pushButtonOnOff, value: reportResponse.value.data!.allCarInfo!.pushButton ?? ''),
            Master(title: MyStrings.dashboardSwitches, value: reportResponse.value.data!.allCarInfo!.dashboardSwitch ?? ''),
            Master(title: MyStrings.powerWindowAndWindowLock, listValue: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock?.condition, remarks: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock?.remarks),
            Master(title: MyStrings.handBrake, listValue: reportResponse.value.data!.allCarInfo!.handBreak),
            Master(title: MyStrings.carElectrical, listValue: reportResponse.value.data!.allCarInfo!.carElectrical?.condition, remarks: reportResponse.value.data!.allCarInfo!.carElectrical?.remarks),
            Master(title: MyStrings.secondKey, value: reportResponse.value.data!.allCarInfo!.secondKey ?? ''),
            Master(title: MyStrings.platform, listValue: reportResponse.value.data!.allCarInfo!.platformImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.platformImage?.remarks),
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
            Master(title: MyStrings.frontImage, listValue: reportResponse.value.data!.allCarInfo?.front?.condition, remarks: reportResponse.value.data!.allCarInfo!.front?.remarks),
            Master(title: MyStrings.frontLeftImage, listValue: reportResponse.value.data!.allCarInfo?.frontLeft?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontLeft?.remarks),
            Master(title: MyStrings.frontRightImage, listValue: reportResponse.value.data!.allCarInfo?.frontRight?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontRight?.remarks),
            Master(title: MyStrings.leftImage, listValue: reportResponse.value.data!.allCarInfo?.leftImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.leftImage?.remarks),
            Master(title: MyStrings.rightImage, listValue: reportResponse.value.data!.allCarInfo?.rightImage?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearLeftImage, listValue: reportResponse.value.data!.allCarInfo?.rearLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearImage, listValue: reportResponse.value.data!.allCarInfo?.rear?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearRight, listValue: reportResponse.value.data!.allCarInfo?.rearRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.roofImage, listValue: reportResponse.value.data!.allCarInfo?.roof?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.frontWindShieldWiper, listValue: reportResponse.value.data!.allCarInfo?.frontWindShield?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearWindShield, listValue: reportResponse.value.data!.allCarInfo?.rearWindShield?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.doorGlassLH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.doorGlassRH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.quarterGlass, listValue: reportResponse.value.data!.allCarInfo?.quarterGlass?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.headlightsLH, listValue: reportResponse.value.data!.allCarInfo?.headLightLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.headlightsRH, listValue: reportResponse.value.data!.allCarInfo?.headLightRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.headlightSupport, listValue: reportResponse.value.data!.allCarInfo?.headLightSupport?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.frontBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperFront?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperRear?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.frontGrill, listValue: reportResponse.value.data!.allCarInfo?.grill?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.bonnetPatti, listValue: reportResponse.value.data!.allCarInfo?.bonnetPatti?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.upperCrossMember, listValue: reportResponse.value.data!.allCarInfo?.upperCrossMember?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lowerCrossMember, listValue: reportResponse.value.data!.allCarInfo?.lowerCrossMember?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.apronLH, listValue: reportResponse.value.data!.allCarInfo?.apronLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.apronRH, listValue: reportResponse.value.data!.allCarInfo?.apronRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.cowlTop, listValue: reportResponse.value.data!.allCarInfo?.cowlTop?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.chassisExtension, listValue: reportResponse.value.data!.allCarInfo?.chassisExtension?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tyreFrontRHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tyreFrontLHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tyreRearRHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tyreRearLHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhQuarterPanel, listValue: reportResponse.value.data!.allCarInfo?.quarterPanelLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.frontLHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.frontRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorRearRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhaPillar, listValue: reportResponse.value.data!.allCarInfo?.leftApillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhaPillar, listValue: reportResponse.value.data!.allCarInfo?.rightApillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhbPillar, listValue: reportResponse.value.data!.allCarInfo?.leftBpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhbPillar, listValue: reportResponse.value.data!.allCarInfo?.rightBpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhcPillar, listValue: reportResponse.value.data!.allCarInfo?.leftCpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhcPillar, listValue: reportResponse.value.data!.allCarInfo?.rightCpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.lhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tailLightLh, listValue: reportResponse.value.data!.allCarInfo?.tailLightLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.tailLightRh, listValue: reportResponse.value.data!.allCarInfo?.tailLightRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rearWiper, listValue: reportResponse.value.data!.allCarInfo?.rearWiper?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.boot, listValue: reportResponse.value.data!.allCarInfo?.boot?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.dickyDoor, listValue: reportResponse.value.data!.allCarInfo?.dickyDoor?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.spareWheel, listValue: reportResponse.value.data!.allCarInfo?.spareWheel?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.jackAndTool, value: reportResponse.value.data!.allCarInfo?.jackAndTool),
            Master(title: MyStrings.lhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.rhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.fuelLid, listValue: reportResponse.value.data!.allCarInfo?.fuelLid?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
            Master(title: MyStrings.firewall, listValue: reportResponse.value.data!.allCarInfo?.firewall?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks),
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
          addImageList();
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
    this.color,
    this.remarks,
  });

  String title;
  String? value;
  String? remarks;
  List<String>? listValue;
  Color? color;
}
