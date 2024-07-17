import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:mera_partners/model/response/car_details/report_response.dart';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:mera_partners/model/response/user_data/user_car_details_response.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/service/exception_error_util.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/utils/shared_pref_manager.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;
import '../../utils/constants.dart';
import '../../widgets/progressbar.dart';

class CarDetailsScreenViewModel extends GetxController {

  RxInt pageIndex = 0.obs;
  var id = Get.arguments ?? '';

  ///page 1
  var carStatus = "".obs;
  //""
  //bid won
  //bid closed
  //car sold 

  Rxn<Duration> duration = Rxn();

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.value!.inSeconds == 0) {
        timer.cancel();
      } else {
          duration.value = duration.value! - const Duration(seconds: 1);
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hour = duration.inHours.toString();
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if(duration.inHours == 0){
      return "${twoDigitMinutes}min ${twoDigitSeconds}sec";
    } else if (duration.inHours < 10){
      hour = twoDigits(duration.inHours);
      return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
    }
    return "${hour}h ${twoDigitMinutes}min ${twoDigitSeconds}sec";
  }

  String formatKmDriven(String kmDrivenString) {
    int kmDriven = int.parse(kmDrivenString);
    if(kmDriven >= 10000) {
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else if (kmDriven >= 100000){
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else if (kmDriven >= 1000){
      double result = kmDriven/1000;
      return '${result.toStringAsFixed(1)}k';
    }
    else {
      return '$kmDriven';
    }
  }

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
        scrollController.offset > ((criticalIssue.isEmpty)?380 :600 - kToolbarHeight);
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
  Rx<TextEditingController> quotePriceController = TextEditingController().obs;
  Rx<CountdownTimerController>? timerController;
  Rx<int>? endTime;

  void onEnd() {
    if (timerController!.value.isRunning) {
      timerController?.value.disposeTimer();
    }
  }

  @override
  void onInit() {
    // scrollListener();
    // videoController.value = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://bucketkeracars.s3.ap-south-1.amazonaws.com/startVideo-1710486615054-a5a565fa-745c-45bf-abd0-703cf2957f51827885497507968836.mp4'))
    //   ..initialize().then((_) {});
    // getReport();
    // getCarDetails();
    // getLikedCarData();
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
    "oil spillage on idle", "leakage from tappet cover oil", "leakage from side cover oil", "low oil", "speedometer not working",
    "warning light", "rattling sound", "dirty seat cover", "front rh power window stuck", "rear rh power window stuck", "front lh power window stuck",
    "rear lh power window stuck", "rat damage", "hard", "abnormal noise", "modified horn", "cooling low", "weak compression ac"
  ];

  List<String> redListData = ["rusted", "replaced", "cracked", "welded", "clamped", "repaired", "critical sound", 
  "damaged", "weak compression", "air filter box damaged", "blue smoke", "fluid leakage", "back compression", "shift hard-gear", 
  "not engaging-gear", "noisy", "jittering", "dirty oil", "leakage-turbo", "ac vent grill broken", "front rh power window not working", "rear rh power window not working",
  "front lh power window not working", "rear lh power window not working", "ecm malfunction", "fuel pump not working", "wiring damage", "electric not working", "hydraulic not working",
  "weak breaks", "gear not engaged", "drum scratch", "alloy wheel missing", "needs replacement", "deployed", "not satisfactory",
  "abs ebd sensor damaged", "abs ebd module damaged","flood affected", "total loss", "apron replaced", "apron repaired", "roof replaced", "car converted from commercial to private", "commercial vehicle", "fitness expired", "engine replaced"
  ];

  String notAvailable = "";
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
  var carDetailsResponse = CarListResponse().obs;
  // List<DashBoardClass> dashboard = [];
  // List<String> imageUrls = [];

  //issue
  var exteriorIssue = <Master>[].obs;
  var exteriorMajorIssue = <Master>[].obs;
  var exteriorMinorIssue = <Master>[].obs;
  var interiorAndElectricalIssue = <Master>[].obs;
  var interiorMajorIssue = <Master>[].obs;
  var interiorMinorIssue = <Master>[].obs;
  var engineIssue = <Master>[].obs;
  var engineMinorIssue = <Master>[].obs;
  var engineMajorIssue = <Master>[].obs;
  var airConditionIssue = <Master>[].obs;
  var airConditionMinorIssue = <Master>[].obs;
  var airConditionMajorIssue = <Master>[].obs;
  var testDriveIssue = <Master>[].obs;
  var testDriveMinorIssue = <Master>[].obs;
  var testDriveMajorIssue = <Master>[].obs;

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
      // if(redListData.contains(reportResponse.value.data!.allCarInfo!.specialComments.toString().toLowerCase())){
      //   criticalIssue.add(reportResponse.value.data!.allCarInfo!.specialComments.toString().toLowerCase());
      // }
    for(int i=0; i<exterior.length; i++){
      if(goodListData.contains(exterior[i].value.toString().toLowerCase())){
        exteriorOtherParts.add(exterior[i]);
      }
      if(redListData.contains(exterior[i].value.toString().toLowerCase())){
        exterior[i].color = MyColors.warning;
        // exteriorIssue.add(exterior[i]);
        exteriorMajorIssue.add(exterior[i]);
        if(exterior[i].image != null && (exterior[i].image!.isNotEmpty)){
          damageImages.add(exterior[i]);
        }
      }
      if(yellowListData.contains(exterior[i].value.toString().toLowerCase())){
        exterior[i].color = MyColors.yellow;
        exteriorMinorIssue.add(exterior[i]);
        // exteriorIssue.add(exterior[i]);
        if(exterior[i].image != null && (exterior[i].image!.isNotEmpty)){
          damageImages.add(exterior[i]);
        }
      }
      if(exterior[i].listValue != null){
        for(int j=0; j<exterior[i].listValue!.length; j++){
          if(exterior[i].listValue![j].isEmpty){
            exterior[i].listValue!.removeAt(j);
          }
        }
        for(int j=0; j<exterior[i].listValue!.length; j++){
          if(goodListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exteriorOtherParts.add(exterior[i]);
            break;
          }
          if(redListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exterior[i].color = MyColors.warning;
            exteriorMajorIssue.add(exterior[i]);
            // exteriorIssue.add(exterior[i]);
            if(exterior[i].image != null && (exterior[i].image!.isNotEmpty)){
              damageImages.add(exterior[i]);
            }
            break;
          }
          if(yellowListData.contains(exterior[i].listValue![j].toString().toLowerCase())){
            exterior[i].value = exterior[i].listValue![j];
            exterior[i].color = MyColors.yellow;
            exteriorMinorIssue.add(exterior[i]);
            // exteriorIssue.add(exterior[i]);
            if(exterior[i].image != null && (exterior[i].image!.isNotEmpty)){
              damageImages.add(exterior[i]);
            }
            break;
          }
          // if(exterior[i].listValue![j].isEmpty){
          //   exterior[i].listValue!.removeAt(j);
          // }
        }
      }
    }
    for(int i=0; i<interiorAndElectrical.length; i++){
      if(goodListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
      }
      if(redListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectrical[i].color = MyColors.warning;
        // interiorAndElectricalIssue.add(interiorAndElectrical[i]);
        interiorMajorIssue.add(interiorAndElectrical[i]);
        if(interiorAndElectrical[i].image != null && (interiorAndElectrical[i].image!.isNotEmpty)){
          damageImages.add(interiorAndElectrical[i]);
        }
      }
      if(yellowListData.contains(interiorAndElectrical[i].value.toString().toLowerCase())){
        interiorAndElectrical[i].color = MyColors.yellow;
        interiorMinorIssue.add(interiorAndElectrical[i]);
        // interiorAndElectricalIssue.add(interiorAndElectrical[i]);
        if(interiorAndElectrical[i].image != null && (interiorAndElectrical[i].image!.isNotEmpty)){
          damageImages.add(interiorAndElectrical[i]);
        }
      }
      if(interiorAndElectrical[i].listValue != null){
        for(int j=0; j<interiorAndElectrical[i].listValue!.length; j++){
          if(interiorAndElectrical[i].listValue![j].isEmpty){
            interiorAndElectrical[i].listValue!.removeAt(j);
          }
        }
        for(int j=0; j<interiorAndElectrical[i].listValue!.length; j++){
          if(goodListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectricalOtherParts.add(interiorAndElectrical[i]);
            break;
          }
          if(redListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectrical[i].color = MyColors.warning;
            // interiorAndElectricalIssue.add(interiorAndElectrical[i]);
            interiorMajorIssue.add(interiorAndElectrical[i]);
            if(interiorAndElectrical[i].image != null && (interiorAndElectrical[i].image!.isNotEmpty)){
              damageImages.add(interiorAndElectrical[i]);
            }
            break;
          }
          if(yellowListData.contains(interiorAndElectrical[i].listValue![j].toString().toLowerCase())){
            interiorAndElectrical[i].value = interiorAndElectrical[i].listValue![j];
            interiorAndElectrical[i].color = MyColors.yellow;
            // interiorAndElectricalIssue.add(interiorAndElectrical[i]);
            interiorMinorIssue.add(interiorAndElectrical[i]);
            if(interiorAndElectrical[i].image != null && (interiorAndElectrical[i].image!.isNotEmpty)){
              damageImages.add(interiorAndElectrical[i]);
            }
            break;
          }
          // if(interiorAndElectrical[i].listValue![j].isEmpty){
          //   interiorAndElectrical[i].listValue!.removeAt(j);
          // }
        }
      }
    }
    for(int i=0; i<engine.length; i++){
      if(goodListData.contains(engine[i].value.toString().toLowerCase())){
        engineOtherParts.add(engine[i]);
      }
      if(redListData.contains(engine[i].value.toString().toLowerCase())){
        engine[i].color = MyColors.warning;
        // engineIssue.add(engine[i]);
        engineMajorIssue.add(engine[i]);
        if(engine[i].image != null && (engine[i].image!.isNotEmpty)){
          damageImages.add(engine[i]);
        }
      }
      if(yellowListData.contains(engine[i].value.toString().toLowerCase())){
        engine[i].color = MyColors.yellow;
        // engineIssue.add(engine[i]);
        engineMinorIssue.add(engine[i]);
        if(engine[i].image != null && (engine[i].image!.isNotEmpty)){
          damageImages.add(engine[i]);
        }
      }
      if(engine[i].listValue != null){
        for(int j=0; j<engine[i].listValue!.length; j++){
          if(engine[i].listValue![j].isEmpty){
            engine[i].listValue!.removeAt(j);
          }
        }
        for(int j=0; j<engine[i].listValue!.length; j++){
          if(goodListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engineOtherParts.add(engine[i]);
            break;
          }
          if(redListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engine[i].color = MyColors.warning;
            // engineIssue.add(engine[i]);
            engineMajorIssue.add(engine[i]);
            if(engine[i].image != null && (engine[i].image!.isNotEmpty)){
              damageImages.add(engine[i]);
            }
            break;
          }
          if(yellowListData.contains(engine[i].listValue![j].toString().toLowerCase())){
            engine[i].value = engine[i].listValue![j];
            engine[i].color = MyColors.yellow;
            // engineIssue.add(engine[i]);
            engineMinorIssue.add(engine[i]);
            if(engine[i].image != null && (engine[i].image!.isNotEmpty)){
              damageImages.add(engine[i]);
            }
            break;
          }
          // if(engine[i].listValue![j].isEmpty){
          //   engine[i].listValue!.removeAt(j);
          // }
        }
      }
    }
    for(int i=0; i<airCondition.length; i++){
      if(goodListData.contains(airCondition[i].value.toString().toLowerCase())){
        airConditionOtherParts.add(airCondition[i]);
      }
      if(redListData.contains(airCondition[i].value.toString().toLowerCase())){
        airCondition[i].color = MyColors.warning;
        airConditionMajorIssue.add(airCondition[i]);
        // airConditionIssue.add(airCondition[i]);
        if(airCondition[i].image != null && (airCondition[i].image!.isNotEmpty)){
          damageImages.add(airCondition[i]);
        }
      }
      if(yellowListData.contains(airCondition[i].value.toString().toLowerCase())){
        airCondition[i].color = MyColors.yellow;
        airConditionMinorIssue.add(airCondition[i]);
        // airConditionIssue.add(airCondition[i]);

      }
      if(airCondition[i].listValue != null){
        for(int j=0; j<airCondition[i].listValue!.length; j++){
          if(airCondition[i].listValue![j].isEmpty){
            airCondition[i].listValue!.removeAt(j);
          }
        }
        for(int j=0; j<airCondition[i].listValue!.length; j++){
          if(goodListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airConditionOtherParts.add(airCondition[i]);
            break;
          }
          if(redListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airCondition[i].color = MyColors.warning;
            airConditionMajorIssue.add(airCondition[i]);
            // airConditionIssue.add(airCondition[i]);
            break;
          }
          if(yellowListData.contains(airCondition[i].listValue![j].toString().toLowerCase())){
            airCondition[i].value = airCondition[i].listValue![j];
            airCondition[i].color = MyColors.yellow;
            airConditionMinorIssue.add(airCondition[i]);
            // airConditionIssue.add(airCondition[i]);
            break;
          }
          // if(airCondition[i].listValue![j].isEmpty){
          //   airCondition[i].listValue!.removeAt(j);
          // }
        }
      }
    }
    for(int i=0; i<testDrive.length; i++){
      if(goodListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDriveOtherParts.add(testDrive[i]);
      }
      if(redListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDrive[i].color = MyColors.warning;
        testDriveMajorIssue.add(testDrive[i]);
        // testDriveIssue.add(testDrive[i]);
      }
      if(yellowListData.contains(testDrive[i].value.toString().toLowerCase())){
        testDrive[i].color = MyColors.yellow;
        testDriveMinorIssue.add(testDrive[i]);
        // testDriveIssue.add(testDrive[i]);
      }
      if(testDrive[i].listValue != null){
        for(int j=0; j<testDrive[i].listValue!.length; j++){
          if(testDrive[i].listValue![j].isEmpty){
            testDrive[i].listValue!.removeAt(j);
          }
        }
        for(int j=0; j<testDrive[i].listValue!.length; j++){
          if(goodListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDriveOtherParts.add(testDrive[i]);
            break;
          }
          if(redListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDrive[i].color = MyColors.warning;
            testDriveMajorIssue.add(testDrive[i]);
            // testDriveIssue.add(testDrive[i]);
            break;
          }
          if(yellowListData.contains(testDrive[i].listValue![j].toString().toLowerCase())){
            testDrive[i].value = testDrive[i].listValue![j];
            testDrive[i].color = MyColors.yellow;
            testDriveMinorIssue.add(testDrive[i]);
            // testDriveIssue.add(testDrive[i]);
            break;
          }
          //  if(testDrive[i].listValue![j].isEmpty){
          //   testDrive[i].listValue!.removeAt(j);
          // }
        }
      }
    }
    // damageImages.addAll(exteriorIssue);
    // damageImages.addAll(interiorAndElectricalIssue);
    // damageImages.addAll(engineIssue);
    // damageImages.addAll(airConditionIssue);
    // damageImages.addAll(testDriveIssue);
      exteriorIssue.addAll(exteriorMajorIssue);
      exteriorIssue.addAll(exteriorMinorIssue);
      interiorAndElectricalIssue.addAll(interiorMajorIssue);
      interiorAndElectricalIssue.addAll(interiorMinorIssue);
      engineIssue.addAll(engineMajorIssue);
      engineIssue.addAll(engineMinorIssue);
      airConditionIssue.addAll(airConditionMajorIssue);
      airConditionIssue.addAll(airConditionMinorIssue);
      testDriveIssue.addAll(testDriveMajorIssue);
      testDriveIssue.addAll(testDriveMinorIssue);
    log("exterior other parts: $exteriorOtherParts");
    log("interior other parts: $interiorAndElectricalOtherParts");
    log("engine other parts: $engineOtherParts");
    log("air other parts: $airConditionOtherParts");
    log("test other parts: $testDriveOtherParts");

    log("exterior issue: $exteriorIssue");
    log("interior issue: $interiorAndElectricalIssue");
    log("engine issue: $engineIssue");
    log("air issue: $airConditionIssue");
    log("test issue: $testDriveIssue");
  }


   void addImageList() {
    exteriorImages.value = [
      if(reportResponse.value.data!.allCarInfo!.front != null) Master(title: MyStrings.frontImage, image: reportResponse.value.data!.allCarInfo!.front?.url, listValue: reportResponse.value.data!.allCarInfo!.front?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontLeft != null) Master(title: MyStrings.frontLeftImage, image: reportResponse.value.data!.allCarInfo!.frontLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.frontLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontRight != null) Master(title: MyStrings.frontRightImage, image: reportResponse.value.data!.allCarInfo!.frontRight?.url, listValue: reportResponse.value.data!.allCarInfo!.frontRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.leftImage != null) Master(title: MyStrings.leftImage, image: reportResponse.value.data!.allCarInfo!.leftImage?.url, listValue: reportResponse.value.data!.allCarInfo!.leftImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.rightImage != null) Master(title: MyStrings.rightImage, image: reportResponse.value.data!.allCarInfo!.rightImage?.url, listValue: reportResponse.value.data!.allCarInfo!.rightImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearLeft != null) Master(title: MyStrings.rearLeftImage, image: reportResponse.value.data!.allCarInfo!.rearLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.rearLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.rear != null) Master(title: MyStrings.rearImage, image: reportResponse.value.data!.allCarInfo!.rear?.url, listValue: reportResponse.value.data!.allCarInfo!.rear?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearRight != null) Master(title: MyStrings.rearRight, image: reportResponse.value.data!.allCarInfo!.rearRight?.url, listValue: reportResponse.value.data!.allCarInfo!.rearRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.roof != null) Master(title: MyStrings.roofImage, image: reportResponse.value.data!.allCarInfo!.roof?.url, listValue: reportResponse.value.data!.allCarInfo!.roof?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontWindShield != null) Master(title: MyStrings.frontWindShieldWiper, image: reportResponse.value.data!.allCarInfo!.frontWindShield?.url, listValue: reportResponse.value.data!.allCarInfo!.frontWindShield?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearWindShield != null) Master(title: MyStrings.rearWindShield, image: reportResponse.value.data!.allCarInfo!.rearWindShield?.url, listValue: reportResponse.value.data!.allCarInfo!.rearWindShield?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorGlassLeft != null) Master(title: MyStrings.doorGlassLH, image: reportResponse.value.data!.allCarInfo!.doorGlassLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.doorGlassLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorGlassRight != null) Master(title: MyStrings.doorGlassRH, image: reportResponse.value.data!.allCarInfo!.doorGlassRight?.url, listValue: reportResponse.value.data!.allCarInfo!.doorGlassRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.quarterGlass != null) Master(title: MyStrings.quarterGlass, image: reportResponse.value.data!.allCarInfo!.quarterGlass?.url, listValue: reportResponse.value.data!.allCarInfo!.quarterGlass?.condition),
      if(reportResponse.value.data!.allCarInfo!.headLightLeft != null) Master(title: MyStrings.headlightsLH, image: reportResponse.value.data!.allCarInfo!.headLightLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.headLightLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.headLightRight != null) Master(title: MyStrings.headlightsRH, image: reportResponse.value.data!.allCarInfo!.headLightRight?.url, listValue: reportResponse.value.data!.allCarInfo!.headLightRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.headLightSupport != null) Master(title: MyStrings.headlightSupport, image: reportResponse.value.data!.allCarInfo!.headLightSupport?.url, listValue: reportResponse.value.data!.allCarInfo!.headLightSupport?.condition),
      if(reportResponse.value.data!.allCarInfo!.grill != null) Master(title: MyStrings.frontGrill, image: reportResponse.value.data!.allCarInfo!.grill?.url, listValue: reportResponse.value.data!.allCarInfo!.grill?.condition),
      if(reportResponse.value.data!.allCarInfo!.bonnetPatti != null) Master(title: MyStrings.bonnetPatti, image: reportResponse.value.data!.allCarInfo!.bonnetPatti?.url, listValue: reportResponse.value.data!.allCarInfo!.bonnetPatti?.condition),
      if(reportResponse.value.data!.allCarInfo!.upperCrossMember != null) Master(title: MyStrings.upperCrossMember, image: reportResponse.value.data!.allCarInfo!.upperCrossMember?.url, listValue: reportResponse.value.data!.allCarInfo!.upperCrossMember?.condition),
      if(reportResponse.value.data!.allCarInfo!.lowerCrossMember != null) Master(title: MyStrings.lowerCrossMember, image: reportResponse.value.data!.allCarInfo!.lowerCrossMember?.url, listValue: reportResponse.value.data!.allCarInfo!.lowerCrossMember?.condition),
      if(reportResponse.value.data!.allCarInfo!.cowlTop != null) Master(title: MyStrings.cowlTop, image: reportResponse.value.data!.allCarInfo!.cowlTop?.url, listValue: reportResponse.value.data!.allCarInfo!.cowlTop?.condition),
      if(reportResponse.value.data!.allCarInfo!.chassisExtension != null) Master(title: MyStrings.chassisExtension, image: reportResponse.value.data!.allCarInfo!.chassisExtension?.url, listValue: reportResponse.value.data!.allCarInfo!.chassisExtension?.condition),
      if(reportResponse.value.data!.allCarInfo!.fenderLeft != null) Master(title: MyStrings.lhFender, image: reportResponse.value.data!.allCarInfo!.fenderLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.fenderLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.fenderRight != null) Master(title: MyStrings.rhFender, image: reportResponse.value.data!.allCarInfo!.fenderRight?.url, listValue: reportResponse.value.data!.allCarInfo!.fenderRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.quarterPanelLeft != null) Master(title: MyStrings.lhQuarterPanel, image: reportResponse.value.data!.allCarInfo!.quarterPanelLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.quarterPanelLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.quarterPanelRight != null) Master(title: MyStrings.rhQuarterPanel, image: reportResponse.value.data!.allCarInfo!.quarterPanelRight?.url, listValue: reportResponse.value.data!.allCarInfo!.quarterPanelRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.leftApillar != null) Master(title: MyStrings.lhaPillar, image: reportResponse.value.data!.allCarInfo!.leftApillar?.url, listValue: reportResponse.value.data!.allCarInfo!.leftApillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.rightApillar != null) Master(title: MyStrings.rhaPillar, image: reportResponse.value.data!.allCarInfo!.rightApillar?.url, listValue: reportResponse.value.data!.allCarInfo!.rightApillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.leftBpillar != null) Master(title: MyStrings.lhbPillar, image: reportResponse.value.data!.allCarInfo!.leftBpillar?.url, listValue: reportResponse.value.data!.allCarInfo!.leftBpillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.rightBpillar != null) Master(title: MyStrings.rhbPillar, image: reportResponse.value.data!.allCarInfo!.rightBpillar?.url, listValue: reportResponse.value.data!.allCarInfo!.rightBpillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.leftCpillar != null) Master(title: MyStrings.lhcPillar, image: reportResponse.value.data!.allCarInfo!.leftCpillar?.url, listValue: reportResponse.value.data!.allCarInfo!.leftCpillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.rightCpillar != null) Master(title: MyStrings.rhcPillar, image: reportResponse.value.data!.allCarInfo!.rightCpillar?.url, listValue: reportResponse.value.data!.allCarInfo!.rightCpillar?.condition),
      if(reportResponse.value.data!.allCarInfo!.runnningBorderLeft != null) Master(title: MyStrings.lhRunBoard, image: reportResponse.value.data!.allCarInfo!.runnningBorderLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.runnningBorderLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.runnningBorderRight != null) Master(title: MyStrings.rhRunBoard, image: reportResponse.value.data!.allCarInfo!.runnningBorderRight?.url, listValue: reportResponse.value.data!.allCarInfo!.runnningBorderRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.tailLightLeft != null) Master(title: MyStrings.tailLightLh, image: reportResponse.value.data!.allCarInfo!.tailLightLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.tailLightLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.tailLightRight != null) Master(title: MyStrings.tailLightRh, image: reportResponse.value.data!.allCarInfo!.tailLightRight?.url, listValue: reportResponse.value.data!.allCarInfo!.tailLightRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearWiper != null) Master(title: MyStrings.rearWiper, image: reportResponse.value.data!.allCarInfo!.rearWiper?.url, listValue: reportResponse.value.data!.allCarInfo!.rearWiper?.condition),
      if(reportResponse.value.data!.allCarInfo!.bumperFront != null) Master(title: MyStrings.frontBumper, image: reportResponse.value.data!.allCarInfo!.bumperFront?.url, listValue: reportResponse.value.data!.allCarInfo!.bumperFront?.condition),
      if(reportResponse.value.data!.allCarInfo!.bumperRear != null) Master(title: MyStrings.rearBumper, image: reportResponse.value.data!.allCarInfo!.bumperRear?.url, listValue: reportResponse.value.data!.allCarInfo!.bumperRear?.condition),
      if(reportResponse.value.data!.allCarInfo!.apronLeft != null) Master(title: MyStrings.apronLH, image: reportResponse.value.data!.allCarInfo!.apronLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.apronLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.apronRight != null) Master(title: MyStrings.apronRH, image: reportResponse.value.data!.allCarInfo!.apronRight?.url, listValue: reportResponse.value.data!.allCarInfo!.apronRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontTyreRight != null) Master(title: MyStrings.tyreFrontRHS, image: reportResponse.value.data!.allCarInfo!.frontTyreRight?.url, listValue: reportResponse.value.data!.allCarInfo!.frontTyreRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontTyreLeft != null) Master(title: MyStrings.tyreFrontLHS, image: reportResponse.value.data!.allCarInfo!.frontTyreLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.frontTyreLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearTyreRight != null) Master(title: MyStrings.tyreRearRHS, image: reportResponse.value.data!.allCarInfo!.rearTyreRight?.url, listValue: reportResponse.value.data!.allCarInfo!.rearTyreRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearTyreLeft != null) Master(title: MyStrings.tyreRearLHS, image: reportResponse.value.data!.allCarInfo!.rearTyreLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.rearTyreLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorFrontRight != null) Master(title: MyStrings.frontRHDoor, image: reportResponse.value.data!.allCarInfo!.doorFrontRight?.url, listValue: reportResponse.value.data!.allCarInfo!.doorFrontRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.boot != null) Master(title: MyStrings.boot, image: reportResponse.value.data!.allCarInfo!.boot?.url, listValue: reportResponse.value.data!.allCarInfo!.boot?.condition),
      if(reportResponse.value.data!.allCarInfo!.spareWheel != null) Master(title: MyStrings.spareWheel, image: reportResponse.value.data!.allCarInfo!.spareWheel?.url, listValue: reportResponse.value.data!.allCarInfo!.spareWheel?.condition),
      if(reportResponse.value.data!.allCarInfo!.fuelLid != null) Master(title: MyStrings.fuelLid, image: reportResponse.value.data!.allCarInfo!.fuelLid?.url, listValue: reportResponse.value.data!.allCarInfo!.fuelLid?.condition),
      if(reportResponse.value.data!.allCarInfo!.firewall != null) Master(title: MyStrings.firewall, image: reportResponse.value.data!.allCarInfo!.firewall?.url, listValue: reportResponse.value.data!.allCarInfo!.firewall?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorFrontLeft != null) Master(title: MyStrings.frontLHDoor, image: reportResponse.value.data!.allCarInfo!.doorFrontLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.doorFrontLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorFrontRight != null) Master(title: MyStrings.frontRHDoor, image: reportResponse.value.data!.allCarInfo!.doorFrontRight?.url, listValue: reportResponse.value.data!.allCarInfo!.doorFrontRight?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorRearLeft != null) Master(title: MyStrings.rearLHDoor, image: reportResponse.value.data!.allCarInfo!.doorRearLeft?.url, listValue: reportResponse.value.data!.allCarInfo!.doorRearLeft?.condition),
      if(reportResponse.value.data!.allCarInfo!.doorFrontRight != null) Master(title: MyStrings.rearRHDoor, image: reportResponse.value.data!.allCarInfo!.doorRearRight?.url, listValue: reportResponse.value.data!.allCarInfo!.doorRearRight?.condition),
    ];
    interiorImages.value = [
      if(reportResponse.value.data!.allCarInfo!.clusterPanel != null) Master(title: MyStrings.clusterPanel, image: reportResponse.value.data!.allCarInfo!.clusterPanel?.url, listValue: reportResponse.value.data!.allCarInfo!.clusterPanel?.condition),
      if(reportResponse.value.data!.allCarInfo!.carElectrical != null) Master(title: MyStrings.carElectrical, image: reportResponse.value.data!.allCarInfo!.carElectrical?.url, listValue: reportResponse.value.data!.allCarInfo!.carElectrical?.condition),
      if(reportResponse.value.data!.allCarInfo!.cngKitImage != null) Master(title: MyStrings.cngLpgKitImage, image: reportResponse.value.data!.allCarInfo!.cngKitImage?.url, listValue: reportResponse.value.data!.allCarInfo!.cngKitImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.platformImage != null) Master(title: MyStrings.platform, image: reportResponse.value.data!.allCarInfo!.platformImage?.url, listValue: reportResponse.value.data!.allCarInfo!.platformImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.dashboardImage != null) Master(title: MyStrings.dashboardImage, image: reportResponse.value.data!.allCarInfo!.dashboardImage?.url, listValue: reportResponse.value.data!.allCarInfo!.dashboardImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.frontSeatImage != null) Master(title: MyStrings.frontSeatImage, image: reportResponse.value.data!.allCarInfo!.frontSeatImage?.url, listValue: reportResponse.value.data!.allCarInfo!.frontSeatImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearSeatImage != null) Master(title: MyStrings.rearSeatImage, image: reportResponse.value.data!.allCarInfo!.rearSeatImage?.url, listValue: reportResponse.value.data!.allCarInfo!.rearSeatImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.rearViewMirror != null) Master(title: MyStrings.insideRearViewMirror, image: reportResponse.value.data!.allCarInfo!.rearViewMirror!.url ?? ''),
      if(reportResponse.value.data!.allCarInfo!.interiorView != null) Master(title: MyStrings.interiorViewFromBootDashboard, image: reportResponse.value.data!.allCarInfo!.interiorView?.url, listValue: reportResponse.value.data!.allCarInfo!.interiorView?.condition),
      if(reportResponse.value.data!.allCarInfo!.powerWindowDriverImage != null) Master(title: MyStrings.powerWindowDriverImage, image: reportResponse.value.data!.allCarInfo!.powerWindowDriverImage?.url, listValue: reportResponse.value.data!.allCarInfo!.powerWindowDriverImage?.condition),
      if(reportResponse.value.data!.allCarInfo!.pushWindowDriverImage != null) Master(title: MyStrings.pushWindowDriverImage, image: reportResponse.value.data!.allCarInfo!.pushWindowDriverImage?.url, listValue: reportResponse.value.data!.allCarInfo!.pushWindowDriverImage?.condition),
    ];
    engineImages.value = [
      if(reportResponse.value.data!.allCarInfo!.engineCompartment != null) Master(title: MyStrings.engineCompartmentImage, image: reportResponse.value.data!.allCarInfo!.engineCompartment?.url, listValue: reportResponse.value.data!.allCarInfo!.engineCompartment?.condition),
      if(reportResponse.value.data!.allCarInfo!.engine != null) Master(title: MyStrings.engine, image: reportResponse.value.data!.allCarInfo!.engine?.url, listValue: reportResponse.value.data!.allCarInfo!.engine?.condition),
      if(reportResponse.value.data!.allCarInfo!.mount != null) Master(title: MyStrings.engineMount, image: reportResponse.value.data!.allCarInfo!.mount?.url, listValue: reportResponse.value.data!.allCarInfo!.mount?.condition),
      if(reportResponse.value.data!.allCarInfo!.battery != null) Master(title: MyStrings.battery, image: reportResponse.value.data!.allCarInfo!.battery?.url, listValue: reportResponse.value.data!.allCarInfo!.battery?.condition),
      if(reportResponse.value.data!.allCarInfo!.blowBy != null) Master(title: MyStrings.blowByBackCompression, image: reportResponse.value.data!.allCarInfo!.blowBy?.url, listValue: reportResponse.value.data!.allCarInfo!.blowBy?.condition),
      if(reportResponse.value.data!.allCarInfo!.gearBox != null) Master(title: MyStrings.gearbox, image: reportResponse.value.data!.allCarInfo!.gearBox?.url, listValue: reportResponse.value.data!.allCarInfo!.gearBox?.condition),
      if(reportResponse.value.data!.allCarInfo!.engineOil != null) Master(title: MyStrings.engineOil, image: reportResponse.value.data!.allCarInfo!.engineOil?.url, listValue: reportResponse.value.data!.allCarInfo!.engineOil?.condition),
      if(reportResponse.value.data!.allCarInfo!.clutch != null) Master(title: MyStrings.clutchOperations, image: reportResponse.value.data!.allCarInfo!.clutch?.url, listValue: reportResponse.value.data!.allCarInfo!.clutch?.condition),
      if(reportResponse.value.data!.allCarInfo!.turboCharger != null) Master(title: MyStrings.turboCharger, image: reportResponse.value.data!.allCarInfo!.turboCharger?.url, listValue: reportResponse.value.data!.allCarInfo!.turboCharger?.condition),
      if(reportResponse.value.data!.allCarInfo!.sump != null) Master(title: MyStrings.sump, image: reportResponse.value.data!.allCarInfo!.sump?.url, listValue: reportResponse.value.data!.allCarInfo!.sump?.condition),
    ];
    // Map<String, dynamic> mainObject = reportResponse.value.data!.allCarInfo!.toJson();
    // mainObject.forEach((key, value) {
    //   if (value is Map<String, dynamic> && value.containsKey('url') && value['url'] != null && value.containsValue('damaged')) {
    //     damageImages.add(value['url']);
    //   }
    // });
    if(exteriorImages.isNotEmpty) imageList.add({"title":MyStrings.exterior, "isClick": false.obs, "images": exteriorImages});
    if(engineImages.isNotEmpty) imageList.add({"title":MyStrings.engine, "isClick": false.obs, "images": engineImages});
    if(interiorImages.isNotEmpty) imageList.add({"title":MyStrings.interior, "isClick": false.obs, "images": interiorImages});
    if(damageImages.isNotEmpty) imageList.add({"title":MyStrings.damage, "isClick": false.obs, "images": damageImages});
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
        // log(response.body);
        reportResponse.value = ReportResponse.fromJson(json.decode(response.body));
        if (reportResponse.value.data != null) {
          sliderImage.value = [
            if(reportResponse.value.data!.allCarInfo!.frontLeft != null) reportResponse.value.data!.allCarInfo!.frontLeft!.url ?? '',
            if(reportResponse.value.data!.allCarInfo!.front != null) reportResponse.value.data!.allCarInfo!.front!.url ?? '',
            if(reportResponse.value.data!.allCarInfo!.frontRight != null) reportResponse.value.data!.allCarInfo!.frontRight!.url ?? '',
            if(reportResponse.value.data!.allCarInfo!.rear != null) reportResponse.value.data!.allCarInfo!.rear!.url ?? '',
            if(reportResponse.value.data!.allCarInfo!.engineCompartment != null) reportResponse.value.data!.allCarInfo!.engineCompartment!.url ?? '',
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
            if((reportResponse.value.data!.loanNoc != null) && (reportResponse.value.data!.loanNoc!.isNotEmpty))
            Master(title: MyStrings.nocIssued, value: reportResponse.value.data!.loanNoc ?? ''),
            if((reportResponse.value.data!.insurance != null) && (reportResponse.value.data!.insurance!.isNotEmpty))
            Master(title: MyStrings.insurance, value: reportResponse.value.data!.insurance ?? ''),
            if((reportResponse.value.data!.ncb != null) && (reportResponse.value.data!.ncb!.isNotEmpty))
            Master(title: MyStrings.ncb, value: reportResponse.value.data!.ncb ?? ''),
            Master(title: MyStrings.underHypothecation, value: reportResponse.value.data!.hypothecation ?? ''),
            if((reportResponse.value.data!.loanStatus != null) && (reportResponse.value.data!.loanStatus!.isNotEmpty))
            Master(title: MyStrings.loanClosed, value: reportResponse.value.data!.loanStatus ?? ''),
            if((reportResponse.value.data!.form35 != null) && (reportResponse.value.data!.form35!.isNotEmpty))
            Master(title: MyStrings.form35, value: reportResponse.value.data!.form35 ?? ''),
            if((reportResponse.value.data!.insuranceValidity != null) && (reportResponse.value.data!.insuranceValidity!.isNotEmpty))
            Master(title: MyStrings.insuranceValidity, value: reportResponse.value.data!.insuranceValidity ?? ''),
          ];
          otherInformation.value = [
            Master(title: MyStrings.duplicateKey, value: reportResponse.value.data!.duplicateKey ?? ''),
            Master(title: MyStrings.chasisNumberEmbossing, value: reportResponse.value.data!.chasisNumber != null && (reportResponse.value.data!.chasisNumber!.isNotEmpty) ? MyStrings.ok : MyStrings.notTraceable),
          ];
          regAndFitness.value = [
            Master(title: MyStrings.manufacturingDate, value: reportResponse.value.data!.allCarInfo?.monthAndYearOfManufacture ?? ''),
            Master(title: MyStrings.regDate, value: reportResponse.value.data!.regDate ?? ''),
            Master(title: MyStrings.regValidity, value: reportResponse.value.data!.regValidity ?? ''),
            Master(title: MyStrings.taxValidity, value: reportResponse.value.data!.taxValidity ?? ''),
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
            Master(title: MyStrings.transmissionAutomatic, listValue: reportResponse.value.data!.allCarInfo!.transmissionAutomatic ?? []),
            Master(title: MyStrings.vehicleHorn, listValue: reportResponse.value.data!.allCarInfo!.vehicleHorn ?? []),
          ];
          engine.value = [
            Master(title: MyStrings.engineSound, value: reportResponse.value.data!.allCarInfo!.engineSound ?? ''),
            Master(title: MyStrings.engine, listValue: reportResponse.value.data!.allCarInfo?.engine?.condition, remarks: reportResponse.value.data!.allCarInfo!.engine?.remarks,image: reportResponse.value.data!.allCarInfo?.engine?.url),
            Master(title: MyStrings.smoke, value: reportResponse.value.data!.allCarInfo!.exhaustSmoke ?? ''),
            Master(title: MyStrings.battery, listValue: reportResponse.value.data!.allCarInfo!.battery?.condition, remarks: reportResponse.value.data!.allCarInfo!.battery?.remarks,image: reportResponse.value.data!.allCarInfo?.battery?.url),
            Master(title: MyStrings.radiator, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
            Master(title: MyStrings.startingMotor, value: reportResponse.value.data!.allCarInfo!.startingMotor ?? ''),
            Master(title: MyStrings.coolant, value: reportResponse.value.data!.allCarInfo!.coolant ?? ''),
            Master(title: MyStrings.blowByBackCompression, listValue: reportResponse.value.data!.allCarInfo!.blowBy?.condition, remarks: reportResponse.value.data!.allCarInfo!.blowBy?.remarks,image: reportResponse.value.data!.allCarInfo?.blowBy?.url),
            Master(title: MyStrings.silencer, value: reportResponse.value.data!.allCarInfo!.silencer ?? ''),
            Master(title: MyStrings.clutchOperations, listValue: reportResponse.value.data!.allCarInfo!.clutch?.condition, remarks: reportResponse.value.data!.allCarInfo!.clutch?.remarks,image: reportResponse.value.data!.allCarInfo?.clutch?.url),
            Master(title: MyStrings.gearbox, listValue: reportResponse.value.data!.allCarInfo!.gearBox?.condition, remarks: reportResponse.value.data!.allCarInfo!.gearBox?.remarks,image: reportResponse.value.data!.allCarInfo?.gearBox?.url),
            Master(title: MyStrings.engineOil, listValue: reportResponse.value.data!.allCarInfo!.engineOil?.condition, remarks: reportResponse.value.data!.allCarInfo!.engineOil?.remarks,image: reportResponse.value.data!.allCarInfo?.engineOil?.url),
            Master(title: MyStrings.turboCharger, listValue: reportResponse.value.data!.allCarInfo!.turboCharger?.condition, remarks: reportResponse.value.data!.allCarInfo!.turboCharger?.remarks,image: reportResponse.value.data!.allCarInfo?.turboCharger?.url),
            Master(title: MyStrings.gearboxLeakage, value: reportResponse.value.data!.allCarInfo!.gearBoxLeakage ?? ''),
            Master(title: MyStrings.engineMount, listValue: reportResponse.value.data!.allCarInfo!.mount?.condition, remarks: reportResponse.value.data!.allCarInfo!.mount?.remarks,image: reportResponse.value.data!.allCarInfo?.mount?.url),
            Master(title: MyStrings.sump, listValue: reportResponse.value.data!.allCarInfo!.sump?.condition, remarks: reportResponse.value.data!.allCarInfo!.sump?.remarks,image: reportResponse.value.data!.allCarInfo?.sump?.url),
            Master(title: MyStrings.comments, value: reportResponse.value.data!.allCarInfo!.engineComment ?? ''),
          ];
          interiorAndElectrical.value = [
            Master(title: MyStrings.clusterPanel, listValue: reportResponse.value.data!.allCarInfo!.clusterPanel?.condition, remarks: reportResponse.value.data!.allCarInfo!.clusterPanel?.remarks,image: reportResponse.value.data!.allCarInfo?.clusterPanel?.url),
            Master(title: MyStrings.warningLight, value: reportResponse.value.data!.allCarInfo!.warningDetails ?? ''),
            Master(title: MyStrings.dashboardImage, value: reportResponse.value.data!.allCarInfo!.dashboardCondition ?? ''),
            Master(title: MyStrings.frontSeatImage, listValue: reportResponse.value.data!.allCarInfo!.frontSeatImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontSeatImage?.remarks,image: reportResponse.value.data!.allCarInfo?.frontSeatImage?.url),
            Master(title: MyStrings.rearSeatImage, listValue: reportResponse.value.data!.allCarInfo!.rearSeatImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.rearSeatImage?.remarks,image: reportResponse.value.data!.allCarInfo?.rearSeatImage?.url),
            Master(title: MyStrings.insideRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirror?.condition, remarks: reportResponse.value.data!.allCarInfo!.rearViewMirror?.remarks,image: reportResponse.value.data!.allCarInfo?.rearViewMirror?.url),
            Master(title: MyStrings.interiorViewFromBootDashboard, listValue: reportResponse.value.data!.allCarInfo?.interiorView?.condition, remarks: reportResponse.value.data!.allCarInfo!.interiorView?.remarks,image: reportResponse.value.data!.allCarInfo?.interiorView?.url),
            Master(title: MyStrings.pushButtonOnOff, value: reportResponse.value.data!.allCarInfo!.pushButton ?? ''),
            Master(title: MyStrings.dashboardSwitches, value: reportResponse.value.data!.allCarInfo!.dashboardSwitch ?? ''),
            Master(title: MyStrings.powerWindowAndWindowLock, listValue: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock?.condition, remarks: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock?.remarks,image: reportResponse.value.data!.allCarInfo?.powerWindowCentalLock?.url),
            Master(title: MyStrings.handBrake, listValue: reportResponse.value.data!.allCarInfo!.handBreak),
            Master(title: MyStrings.carElectrical, listValue: reportResponse.value.data!.allCarInfo!.carElectrical?.condition, remarks: reportResponse.value.data!.allCarInfo!.carElectrical?.remarks,image: reportResponse.value.data!.allCarInfo?.carElectrical?.url),
            Master(title: MyStrings.secondKey, value: reportResponse.value.data!.allCarInfo!.secondKey ?? ''),
            Master(title: MyStrings.platform, listValue: reportResponse.value.data!.allCarInfo!.platformImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.platformImage?.remarks,image: reportResponse.value.data!.allCarInfo?.platformImage?.url),
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
            Master(title: MyStrings.frontImage, listValue: reportResponse.value.data!.allCarInfo?.front?.condition, remarks: reportResponse.value.data!.allCarInfo!.front?.remarks,image: reportResponse.value.data!.allCarInfo?.front?.url),
            Master(title: MyStrings.frontLeftImage, listValue: reportResponse.value.data!.allCarInfo?.frontLeft?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.frontLeft?.url),
            Master(title: MyStrings.frontRightImage, listValue: reportResponse.value.data!.allCarInfo?.frontRight?.condition, remarks: reportResponse.value.data!.allCarInfo!.frontRight?.remarks,image: reportResponse.value.data!.allCarInfo?.frontRight?.url),
            Master(title: MyStrings.leftImage, listValue: reportResponse.value.data!.allCarInfo?.leftImage?.condition, remarks: reportResponse.value.data!.allCarInfo!.leftImage?.remarks,image: reportResponse.value.data!.allCarInfo?.leftImage?.url),
            Master(title: MyStrings.rightImage, listValue: reportResponse.value.data!.allCarInfo?.rightImage?.condition, remarks: reportResponse.value.data!.allCarInfo?.rightImage?.remarks,image: reportResponse.value.data!.allCarInfo?.rightImage?.url),
            Master(title: MyStrings.rearLeftImage, listValue: reportResponse.value.data!.allCarInfo?.rearLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.rearLeft?.url),
            Master(title: MyStrings.rearImage, listValue: reportResponse.value.data!.allCarInfo?.rear?.condition, remarks: reportResponse.value.data!.allCarInfo?.rear?.remarks,image: reportResponse.value.data!.allCarInfo?.rear?.url),
            Master(title: MyStrings.rearRight, listValue: reportResponse.value.data!.allCarInfo?.rearRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearRight?.remarks,image: reportResponse.value.data!.allCarInfo?.rearRight?.url),
            Master(title: MyStrings.roofImage, listValue: reportResponse.value.data!.allCarInfo?.roof?.condition, remarks: reportResponse.value.data!.allCarInfo?.roof?.remarks,image: reportResponse.value.data!.allCarInfo?.roof?.url),
            Master(title: MyStrings.frontWindShieldWiper, listValue: reportResponse.value.data!.allCarInfo?.frontWindShield?.condition, remarks: reportResponse.value.data!.allCarInfo?.frontWindShield?.remarks,image: reportResponse.value.data!.allCarInfo?.frontWindShield?.url),
            Master(title: MyStrings.rearWindShield, listValue: reportResponse.value.data!.allCarInfo?.rearWindShield?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearWindShield?.remarks,image: reportResponse.value.data!.allCarInfo?.rearWindShield?.url),
            Master(title: MyStrings.doorGlassLH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorGlassLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.doorGlassLeft?.url),
            Master(title: MyStrings.doorGlassRH, listValue: reportResponse.value.data!.allCarInfo?.doorGlassRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorGlassRight?.remarks,image: reportResponse.value.data!.allCarInfo?.doorGlassRight?.url),
            Master(title: MyStrings.quarterGlass, listValue: reportResponse.value.data!.allCarInfo?.quarterGlass?.condition, remarks: reportResponse.value.data!.allCarInfo?.quarterGlass?.remarks,image: reportResponse.value.data!.allCarInfo?.quarterGlass?.url),
            Master(title: MyStrings.headlightsLH, listValue: reportResponse.value.data!.allCarInfo?.headLightLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.headLightLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.headLightLeft?.url),
            Master(title: MyStrings.headlightsRH, listValue: reportResponse.value.data!.allCarInfo?.headLightRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.headLightRight?.remarks,image: reportResponse.value.data!.allCarInfo?.headLightRight?.url),
            Master(title: MyStrings.headlightSupport, listValue: reportResponse.value.data!.allCarInfo?.headLightSupport?.condition, remarks: reportResponse.value.data!.allCarInfo?.headLightSupport?.remarks,image: reportResponse.value.data!.allCarInfo?.headLightSupport?.url),
            Master(title: MyStrings.frontBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperFront?.condition, remarks: reportResponse.value.data!.allCarInfo?.bumperFront?.remarks,image: reportResponse.value.data!.allCarInfo?.bumperFront?.url),
            Master(title: MyStrings.rearBumper, listValue: reportResponse.value.data!.allCarInfo?.bumperRear?.condition, remarks: reportResponse.value.data!.allCarInfo?.bumperRear?.remarks,image: reportResponse.value.data!.allCarInfo?.bumperRear?.url),
            Master(title: MyStrings.frontGrill, listValue: reportResponse.value.data!.allCarInfo?.grill?.condition, remarks: reportResponse.value.data!.allCarInfo?.grill?.remarks,image: reportResponse.value.data!.allCarInfo?.grill?.url),
            Master(title: MyStrings.bonnetPatti, listValue: reportResponse.value.data!.allCarInfo?.bonnetPatti?.condition, remarks: reportResponse.value.data!.allCarInfo?.bonnetPatti?.remarks,image: reportResponse.value.data!.allCarInfo?.bonnetPatti?.url),
            Master(title: MyStrings.upperCrossMember, listValue: reportResponse.value.data!.allCarInfo?.upperCrossMember?.condition, remarks: reportResponse.value.data!.allCarInfo?.upperCrossMember?.remarks,image: reportResponse.value.data!.allCarInfo?.upperCrossMember?.url),
            Master(title: MyStrings.lowerCrossMember, listValue: reportResponse.value.data!.allCarInfo?.lowerCrossMember?.condition, remarks: reportResponse.value.data!.allCarInfo?.lowerCrossMember?.remarks,image: reportResponse.value.data!.allCarInfo?.lowerCrossMember?.url),
            Master(title: MyStrings.apronLH, listValue: reportResponse.value.data!.allCarInfo?.apronLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.apronLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.apronLeft?.url),
            Master(title: MyStrings.apronRH, listValue: reportResponse.value.data!.allCarInfo?.apronRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.apronRight?.remarks,image: reportResponse.value.data!.allCarInfo?.apronRight?.url),
            Master(title: MyStrings.cowlTop, listValue: reportResponse.value.data!.allCarInfo?.cowlTop?.condition, remarks: reportResponse.value.data!.allCarInfo?.cowlTop?.remarks,image: reportResponse.value.data!.allCarInfo?.cowlTop?.url),
            Master(title: MyStrings.chassisExtension, listValue: reportResponse.value.data!.allCarInfo?.chassisExtension?.condition, remarks: reportResponse.value.data!.allCarInfo?.chassisExtension?.remarks,image: reportResponse.value.data!.allCarInfo?.chassisExtension?.url),
            Master(title: MyStrings.tyreFrontRHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.frontTyreRight?.remarks,image: reportResponse.value.data!.allCarInfo?.frontTyreRight?.url),
            Master(title: MyStrings.tyreFrontLHS, listValue: reportResponse.value.data!.allCarInfo?.frontTyreLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.frontTyreLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.frontTyreLeft?.url),
            Master(title: MyStrings.tyreRearRHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearTyreRight?.remarks,image: reportResponse.value.data!.allCarInfo?.rearTyreRight?.url),
            Master(title: MyStrings.tyreRearLHS, listValue: reportResponse.value.data!.allCarInfo?.rearTyreLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearTyreLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.rearTyreLeft?.url),
            Master(title: MyStrings.lhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.fenderLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.fenderLeft?.url),
            Master(title: MyStrings.rhFender, listValue: reportResponse.value.data!.allCarInfo?.fenderRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.fenderRight?.remarks,image: reportResponse.value.data!.allCarInfo?.fenderRight?.url),
            Master(title: MyStrings.lhQuarterPanel, listValue: reportResponse.value.data!.allCarInfo?.quarterPanelLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.quarterPanelLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.quarterPanelLeft?.url),
            Master(title: MyStrings.rhQuarterPanel, listValue: reportResponse.value.data!.allCarInfo?.quarterPanelRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.quarterPanelRight?.remarks,image: reportResponse.value.data!.allCarInfo?.quarterPanelRight?.url),
            Master(title: MyStrings.frontLHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorFrontLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.doorFrontLeft?.url),
            Master(title: MyStrings.frontRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorFrontRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorFrontRight?.remarks,image: reportResponse.value.data!.allCarInfo?.doorFrontRight?.url),
            Master(title: MyStrings.rearRHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorRearRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorRearRight?.remarks,image: reportResponse.value.data!.allCarInfo?.doorRearRight?.url),
            Master(title: MyStrings.rearLHDoor, listValue: reportResponse.value.data!.allCarInfo?.doorRearLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.doorRearLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.doorRearLeft?.url),
            Master(title: MyStrings.lhaPillar, listValue: reportResponse.value.data!.allCarInfo?.leftApillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.leftApillar?.remarks,image: reportResponse.value.data!.allCarInfo?.leftApillar?.url),
            Master(title: MyStrings.rhaPillar, listValue: reportResponse.value.data!.allCarInfo?.rightApillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rightApillar?.remarks,image: reportResponse.value.data!.allCarInfo?.rightApillar?.url),
            Master(title: MyStrings.lhbPillar, listValue: reportResponse.value.data!.allCarInfo?.leftBpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.leftBpillar?.remarks,image: reportResponse.value.data!.allCarInfo?.leftBpillar?.url),
            Master(title: MyStrings.rhbPillar, listValue: reportResponse.value.data!.allCarInfo?.rightBpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rightBpillar?.remarks,image: reportResponse.value.data!.allCarInfo?.rightBpillar?.url),
            Master(title: MyStrings.lhcPillar, listValue: reportResponse.value.data!.allCarInfo?.leftCpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.leftCpillar?.remarks,image: reportResponse.value.data!.allCarInfo?.leftCpillar?.url),
            Master(title: MyStrings.rhcPillar, listValue: reportResponse.value.data!.allCarInfo?.rightCpillar?.condition, remarks: reportResponse.value.data!.allCarInfo?.rightCpillar?.remarks,image: reportResponse.value.data!.allCarInfo?.rightCpillar?.url),
            Master(title: MyStrings.lhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.runnningBorderLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.runnningBorderLeft?.url),
            Master(title: MyStrings.rhRunBoard, listValue: reportResponse.value.data!.allCarInfo?.runnningBorderRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.runnningBorderRight?.remarks,image: reportResponse.value.data!.allCarInfo?.runnningBorderRight?.url),
            Master(title: MyStrings.tailLightLh, listValue: reportResponse.value.data!.allCarInfo?.tailLightLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.tailLightLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.tailLightLeft?.url),
            Master(title: MyStrings.tailLightRh, listValue: reportResponse.value.data!.allCarInfo?.tailLightRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.tailLightRight?.remarks,image: reportResponse.value.data!.allCarInfo?.tailLightRight?.url),
            Master(title: MyStrings.rearWiper, listValue: reportResponse.value.data!.allCarInfo?.rearWiper?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearWiper?.remarks,image: reportResponse.value.data!.allCarInfo?.rearWiper?.url),
            Master(title: MyStrings.boot, listValue: reportResponse.value.data!.allCarInfo?.boot?.condition, remarks: reportResponse.value.data!.allCarInfo?.boot?.remarks,image: reportResponse.value.data!.allCarInfo?.boot?.url),
            Master(title: MyStrings.dickyDoor, listValue: reportResponse.value.data!.allCarInfo?.dickyDoor?.condition, remarks: reportResponse.value.data!.allCarInfo?.dickyDoor?.remarks,image: reportResponse.value.data!.allCarInfo?.dickyDoor?.url),
            Master(title: MyStrings.spareWheel, listValue: reportResponse.value.data!.allCarInfo?.spareWheel?.condition, remarks: reportResponse.value.data!.allCarInfo?.spareWheel?.remarks,image: reportResponse.value.data!.allCarInfo?.spareWheel?.url),
            Master(title: MyStrings.jackAndTool, value: reportResponse.value.data!.allCarInfo?.jackAndTool),
            Master(title: MyStrings.lhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorLeft?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearViewMirrorLeft?.remarks,image: reportResponse.value.data!.allCarInfo?.rearViewMirrorLeft?.url),
            Master(title: MyStrings.rhRearViewMirror, listValue: reportResponse.value.data!.allCarInfo?.rearViewMirrorRight?.condition, remarks: reportResponse.value.data!.allCarInfo?.rearViewMirrorRight?.remarks,image: reportResponse.value.data!.allCarInfo?.rearViewMirrorRight?.url),
            Master(title: MyStrings.fuelLid, listValue: reportResponse.value.data!.allCarInfo?.fuelLid?.condition, remarks: reportResponse.value.data!.allCarInfo?.fuelLid?.remarks,image: reportResponse.value.data!.allCarInfo?.fuelLid?.url),
            Master(title: MyStrings.firewall, listValue: reportResponse.value.data!.allCarInfo?.firewall?.condition, remarks: reportResponse.value.data!.allCarInfo?.firewall?.remarks,image: reportResponse.value.data!.allCarInfo?.firewall?.url),
            Master(title: MyStrings.fullBodyRepaint, value: reportResponse.value.data!.allCarInfo?.fullBodyRepaint ?? ''),
            // Master(title: MyStrings.missingParts, value: reportResponse.value.data!.allCarInfo!.missingParts ?? ''),
          ];
          notAvailable = reportResponse.value.data!.allCarInfo!.missingParts.toString();
          // extractUrls(reportResponse.value.data!.allCarInfo!.toJson());
          if(reportResponse.value.data!.allCarInfo!.startVideo != null && reportResponse.value.data!.allCarInfo!.startVideo!.url != null){
            videoController.value = VideoPlayerController.networkUrl(Uri.parse(
            reportResponse.value.data!.allCarInfo!.startVideo!.url ?? ''))
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

  void updateCarData(dynamic newData) {
    carDetailsResponse.value.data?[0] = newData;
    update();
    refresh();
    notifyChildrens();
  }

  void getCarDetails() async {
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}/$id').toString());
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.carBasic}/$id'), headers: globals.headers);
      log("get car details${response.statusCode}${response.body}");
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        // log("get car details"+response.body);
        carDetailsResponse.value = CarListResponse.fromJson(jsonDecode(response.body));
        if (carDetailsResponse.value.data?[0].status?.toLowerCase() != CarStatus.live.name && carDetailsResponse.value.data?[0].status?.toLowerCase() != CarStatus.otb.name && carDetailsResponse.value.data?[0].status?.toLowerCase() != CarStatus.scheduled.name) {
          carStatus.value = carDetailsResponse.value.data?[0].status ?? '';
        }
        // final isLastPage = liveCarsResponse.value.data!.length < limit;
        // if (isLastPage) {
        //   infinitePagingController.appendLastPage(liveCarsResponse.value.data!);
        // } else {
        //   final nextPageKey = pageKey + 1;
        //   infinitePagingController.appendPage(liveCarsResponse.value.data!, nextPageKey);
        // }
        // if(carDetailsResponse.value.data![0].bidStartTime != null && carDetailsResponse.value.data![0].bidEndTime != null){
        //   var startTime= DateTime.parse(carDetailsResponse.value.data![0].bidStartTime!);
        //   var endTime= DateTime.parse(carDetailsResponse.value.data![0].bidEndTime!);

          // var start = DateTime(startTime.year, startTime.month, startTime.day, startTime.hour, startTime.minute, startTime.second);
          // var now = DateTime.now();
          // var end = DateTime(endTime.year, endTime.month, endTime.day, endTime.hour, endTime.minute, endTime.second);

          // if(now.isBefore(start)){
          //   Duration diff = start.difference(now);
          //   duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
          //   startTimer();
          // }else if(now.isBefore(end)) {
          //   Duration diff = end.difference(now);
          //   duration.value = Duration(hours: diff.inHours, minutes: diff.inMinutes.remainder(60), seconds:diff.inSeconds.remainder(60));
          //   startTimer();
          // }
        // }
        timerController!.value = carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.otb.name
        ?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsResponse.value.data![0].otbEndTime  ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},)
        :carDetailsResponse.value.data?[0].status?.toLowerCase() == CarStatus.scheduled.name
          ?CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsResponse.value.data![0].bidStartTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},) 
          : CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + Duration(seconds: DateTime.parse(carDetailsResponse.value.data![0].bidEndTime ?? DateTime.now().toString()).toLocal().difference(DateTime.now()).inSeconds).inMilliseconds, onEnd:() {},);
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  RxBool isLike = false.obs;
  /// Like Feature API integration
  Future<void> updateLikedCar(bool like) async {
    try {
      // ProgressBar.instance.showProgressbar(Get.context!);
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$id').toString());
      log(jsonEncode({"status": like ==true ?"LikedCar": "Unlike"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$id'),
      headers: globals.jsonHeaders, body: jsonEncode({"status": like==true ?"LikedCar":"Unlike"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
         //CustomToast.instance.showMsg(MyStrings.success);
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
  }

  var likeResponse = UserResponse().obs;
  void getLikedCarData() async {
    try {
      log('API URL: ${Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}')}');
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId ?? ""}'), headers: globals.headers);
      log('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        likeResponse.value = UserResponse.fromJson(jsonDecode(response.body));
        for(int i=0; i<likeResponse.value.data![0].likedCars!.length; i++){
          if(likeResponse.value.data![0].likedCars![i].sId == id){
            isLike.value = true;
          }
        }
        if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
          globals.documentStatus = likeResponse.value.data?.first.isDocumentsVerified;
          globals.isDeposited = likeResponse.value.data?.first.isDeposited;
          SharedPrefManager.instance.setStringAsync(Constants.documentStatus, likeResponse.value.data!.first.isDocumentsVerified.toString());
          SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, likeResponse.value.data!.first.isDeposited ?? false);
        }

        log('API Response svvs: ${response.body}');
      } else {
        // ProgressBar.instance.stopProgressBar(Get.context!);
        log('API Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // ProgressBar.instance.stopProgressBar(Get.context!);
      log('Exception occurred: $e');
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void quotePrice(String carId, num amount) async {
    try {
      ProgressBar.instance.showProgressbar(Get.context!);
      var response = await http.post(Uri.parse('${EndPoints.baseUrl}${EndPoints.otb}'), headers: globals.jsonHeaders,
          body: jsonEncode({
            "carId": carId,
            "amount": amount,
          }));

      if (response.statusCode == 200) {
        CustomToast.instance.showMsgWithIcon("${MyStrings.quotePrice} ${MyStrings.success}",null);
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
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
    this.image,
  });

  String title;
  String? value;
  String? remarks;
  String? image;
  List<String>? listValue;
  Color? color;
}
