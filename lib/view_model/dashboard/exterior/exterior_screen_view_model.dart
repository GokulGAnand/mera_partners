import 'dart:convert';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../model/response/exterior/exterior_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class ExteriorViewModel extends GetxController {
  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  var isPage3Fill = false.obs;
  var isPage4Fill = false.obs;
  var isPage5Fill = false.obs;
  var isPage6Fill = false.obs;

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  var activePage = 0.obs;
  var id = Get.arguments;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page5Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page6Key = GlobalKey<FormState>();
  List<String> carCondition = Constants.carCondition;
  List<String> rearCondition = Constants.rearCondition;
  List<String> roofCondition = Constants.roofCondition;
  List<String> windShieldCondition = Constants.windShieldCondition;
  List<String> doorGlassCondition = Constants.doorGlassCondition;
  List<String> lightCondition = Constants.lightCondition;
  List<String> headLightSupport = Constants.headLightSupport;
  List<String> bumper = Constants.bumper;
  List<String> frontGrillList = Constants.frontGrill;
  List<String> bonnetPatti = Constants.bonnetPatti;
  List<String> crossMember = Constants.crossMember;
  List<String> apron = Constants.apron;
  List<String> cowlTopList = Constants.cowlTop;
  List<String> chassisExtensionList = Constants.chassisExtension;
  List<String> tyreWheelsCondition = Constants.tyreWheelsCondition;
  List<String> rhCondition = Constants.rhCondition;
  List<String> lhCondition = Constants.lhCondition;
  List<String> pillarsBoardsCondition = Constants.pillarsBoardsCondition;
  List<String> wiper = Constants.wiper;
  List<String> mirror = Constants.mirror;
  List<String> fuelLidList = Constants.fuelLid;
  List<String> fireWallList = Constants.fireWall;
  List<String> bootList = Constants.bootList;
  List<String> yesNoList = Constants.yesNoList;

  ///page one
  Rx<File?> frontImage = Rx<File?>(null);
  Rx<File?> frontLeftImage = Rx<File?>(null);
  Rx<File?> frontRightImage = Rx<File?>(null);
  Rx<File?> leftImage = Rx<File?>(null);
  Rx<File?> rightImage = Rx<File?>(null);
  Rx<File?> rearLeftImage = Rx<File?>(null);
  Rx<File?> rearImage = Rx<File?>(null);
  Rx<File?> rearRightImage = Rx<File?>(null);
  Rx<File?> roofImage = Rx<File?>(null);
  Rx<File?> frontWindShieldWiperImage = Rx<File?>(null);
  RxList<String> selectedFrontImageList = <String>[].obs;
  RxList<String> selectedFrontLeftImageList = <String>[].obs;
  RxList<String> selectedFrontRightImageList = <String>[].obs;
  RxList<String> selectedLeftImageList = <String>[].obs;
  RxList<String> selectedRightImageList = <String>[].obs;
  RxList<String> selectedRearLeftImageList = <String>[].obs;
  RxList<String> selectedRearImageList = <String>[].obs;
  RxList<String> selectedRearRightList = <String>[].obs;
  RxList<String> selectedRoofImageList = <String>[].obs;
  RxList<String> selectedFrontWindShieldWiperList = <String>[].obs;
  Rx<TextEditingController> frontImageController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontImageController = TextEditingController().obs;
  Rx<TextEditingController> frontImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontLeftImageController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontLeftImageController = TextEditingController().obs;
  Rx<TextEditingController> frontLeftImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontRightImageController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontRightImageController = TextEditingController().obs;
  Rx<TextEditingController> frontRightImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> leftImageController = TextEditingController().obs;
  Rx<TextEditingController> otherLeftImageController = TextEditingController().obs;
  Rx<TextEditingController> leftImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> rightImageController = TextEditingController().obs;
  Rx<TextEditingController> otherRightImageController = TextEditingController().obs;
  Rx<TextEditingController> rightImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearLeftImageController = TextEditingController().obs;
  Rx<TextEditingController> otherRearLeftImageController = TextEditingController().obs;
  Rx<TextEditingController> rearLeftImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearImageController = TextEditingController().obs;
  Rx<TextEditingController> otherRearImageController = TextEditingController().obs;
  Rx<TextEditingController> rearImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearRightController = TextEditingController().obs;
  Rx<TextEditingController> otherRearRightController = TextEditingController().obs;
  Rx<TextEditingController> rearRightRemarks = TextEditingController().obs;
  Rx<TextEditingController> roofImageController = TextEditingController().obs;
  Rx<TextEditingController> otherRoofImageController = TextEditingController().obs;
  Rx<TextEditingController> roofImageRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontWindShieldWiperController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontWindShieldWiperController = TextEditingController().obs;
  Rx<TextEditingController> frontWindShieldWiperRemarks = TextEditingController().obs;

  ///page two
  Rx<File?> rearWindShield = Rx<File?>(null);
  Rx<File?> doorGlassLH = Rx<File?>(null);
  Rx<File?> doorGlassRH = Rx<File?>(null);
  Rx<File?> quarterGlass = Rx<File?>(null);
  Rx<File?> headlightsLH = Rx<File?>(null);
  Rx<File?> headlightsRH = Rx<File?>(null);
  Rx<File?> headlightSupport = Rx<File?>(null);
  Rx<File?> frontBumper = Rx<File?>(null);
  Rx<File?> rearBumper = Rx<File?>(null);
  Rx<File?> frontGrill = Rx<File?>(null);
  RxList<String> selectedRearWindShieldList = <String>[].obs;
  RxList<String> selectedDoorGlassLHList = <String>[].obs;
  RxList<String> selectedDoorGlassRHList = <String>[].obs;
  RxList<String> selectedQuarterGlassList = <String>[].obs;
  RxList<String> selectedHeadlightsLHList = <String>[].obs;
  RxList<String> selectedHeadlightsRHList = <String>[].obs;
  RxList<String> selectedHeadlightSupportList = <String>[].obs;
  RxList<String> selectedFrontBumperList = <String>[].obs;
  RxList<String> selectedRearBumperList = <String>[].obs;
  RxList<String> selectedFrontGrillList = <String>[].obs;
  Rx<TextEditingController> rearWindShieldController = TextEditingController().obs;
  Rx<TextEditingController> otherRearWindShieldController = TextEditingController().obs;
  Rx<TextEditingController> rearWindShieldRemarks = TextEditingController().obs;
  Rx<TextEditingController> doorGlassLHController = TextEditingController().obs;
  Rx<TextEditingController> otherDoorGlassLHController = TextEditingController().obs;
  Rx<TextEditingController> doorGlassLHRemarks = TextEditingController().obs;
  Rx<TextEditingController> doorGlassRHController = TextEditingController().obs;
  Rx<TextEditingController> otherDoorGlassRHController = TextEditingController().obs;
  Rx<TextEditingController> doorGlassRHRemarks = TextEditingController().obs;
  Rx<TextEditingController> quarterGlassController = TextEditingController().obs;
  Rx<TextEditingController> otherQuarterGlassController = TextEditingController().obs;
  Rx<TextEditingController> quarterGlassRemarks = TextEditingController().obs;
  Rx<TextEditingController> headlightsLHController = TextEditingController().obs;
  Rx<TextEditingController> otherHeadlightsLHController = TextEditingController().obs;
  Rx<TextEditingController> headlightsLHRemarks = TextEditingController().obs;
  Rx<TextEditingController> headlightsRHController = TextEditingController().obs;
  Rx<TextEditingController> otherHeadlightsRHController = TextEditingController().obs;
  Rx<TextEditingController> headlightsRHRemarks = TextEditingController().obs;
  Rx<TextEditingController> headlightSupportController = TextEditingController().obs;
  Rx<TextEditingController> otherHeadlightSupportController = TextEditingController().obs;
  Rx<TextEditingController> headlightSupportRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontBumperController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontBumperController = TextEditingController().obs;
  Rx<TextEditingController> frontBumperRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearBumperController = TextEditingController().obs;
  Rx<TextEditingController> otherRearBumperController = TextEditingController().obs;
  Rx<TextEditingController> rearBumperRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontGrillController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontGrillController = TextEditingController().obs;
  Rx<TextEditingController> frontGrillRemarks = TextEditingController().obs;

  ///page three
  var selectedTyreFrontRHS = ''.obs;
  var selectedTyreRearRHS = ''.obs;
  var selectedTyreRearLHS = ''.obs;
  var selectedTyreFrontLHS = ''.obs;
  Rx<File?> bonnetPattiImage = Rx<File?>(null);
  Rx<File?> upperCrossMember = Rx<File?>(null);
  Rx<File?> lowerCrossMember = Rx<File?>(null);
  Rx<File?> apronLH = Rx<File?>(null);
  Rx<File?> apronRH = Rx<File?>(null);
  Rx<File?> cowlTop = Rx<File?>(null);
  Rx<File?> chassisExtension = Rx<File?>(null);
  Rx<File?> tyreFrontRHS = Rx<File?>(null);
  Rx<File?> tyreFrontLHS = Rx<File?>(null);
  Rx<File?> tyreRearRHS = Rx<File?>(null);
  Rx<File?> tyreRearLHS = Rx<File?>(null);
  RxList<String> selectedBonnetPattiList = <String>[].obs;
  RxList<String> selectedUpperCrossMemberList = <String>[].obs;
  RxList<String> selectedLowerCrossMemberList = <String>[].obs;
  RxList<String> selectedApronLHList = <String>[].obs;
  RxList<String> selectedApronRHList = <String>[].obs;
  RxList<String> selectedCowlTopList = <String>[].obs;
  RxList<String> selectedChassisExtensionList = <String>[].obs;
  RxList<String> selectedTyreFrontRHSList = <String>[].obs;
  RxList<String> selectedTyreFrontLHSList = <String>[].obs;
  RxList<String> selectedTyreRearRHSList = <String>[].obs;
  RxList<String> selectedTyreRearLHSList = <String>[].obs;
  Rx<TextEditingController> bonnetPattiController = TextEditingController().obs;
  Rx<TextEditingController> otherBonnetPattiController = TextEditingController().obs;
  Rx<TextEditingController> bonnetPattiRemarks = TextEditingController().obs;
  Rx<TextEditingController> upperCrossMemberController = TextEditingController().obs;
  Rx<TextEditingController> otherUpperCrossMemberController = TextEditingController().obs;
  Rx<TextEditingController> upperCrossMemberRemarks = TextEditingController().obs;
  Rx<TextEditingController> lowerCrossMemberController = TextEditingController().obs;
  Rx<TextEditingController> otherLowerCrossMemberController = TextEditingController().obs;
  Rx<TextEditingController> lowerCrossMemberRemarks = TextEditingController().obs;
  Rx<TextEditingController> apronLHController = TextEditingController().obs;
  Rx<TextEditingController> otherApronLHController = TextEditingController().obs;
  Rx<TextEditingController> apronLHRemarks = TextEditingController().obs;
  Rx<TextEditingController> apronRHController = TextEditingController().obs;
  Rx<TextEditingController> otherApronRHController = TextEditingController().obs;
  Rx<TextEditingController> apronRHRemarks = TextEditingController().obs;
  Rx<TextEditingController> cowlTopController = TextEditingController().obs;
  Rx<TextEditingController> otherCowlTopController = TextEditingController().obs;
  Rx<TextEditingController> cowlTopRemarks = TextEditingController().obs;
  Rx<TextEditingController> chassisExtensionController = TextEditingController().obs;
  Rx<TextEditingController> otherChassisExtensionController = TextEditingController().obs;
  Rx<TextEditingController> chassisExtensionRemarks = TextEditingController().obs;
  Rx<TextEditingController> tyreFrontRHSController = TextEditingController().obs;
  Rx<TextEditingController> otherTyreFrontRHSController = TextEditingController().obs;
  Rx<TextEditingController> tyreFrontRHSRemarks = TextEditingController().obs;
  Rx<TextEditingController> tyreFrontLHSController = TextEditingController().obs;
  Rx<TextEditingController> otherTyreFrontLHSController = TextEditingController().obs;
  Rx<TextEditingController> tyreFrontLHSRemarks = TextEditingController().obs;
  Rx<TextEditingController> tyreRearRHSController = TextEditingController().obs;
  Rx<TextEditingController> otherTyreRearRHSController = TextEditingController().obs;
  Rx<TextEditingController> tyreRearRHSRemarks = TextEditingController().obs;
  Rx<TextEditingController> tyreRearLHSController = TextEditingController().obs;
  Rx<TextEditingController> otherTyreRearLHSController = TextEditingController().obs;
  Rx<TextEditingController> tyreRearLHSRemarks = TextEditingController().obs;

  ///page four
  Rx<File?> lhFender = Rx<File?>(null);
  Rx<File?> rhFender = Rx<File?>(null);
  Rx<File?> lhQuarterPanel = Rx<File?>(null);
  Rx<File?> rhQuarterPanel = Rx<File?>(null);
  Rx<File?> frontLHDoor = Rx<File?>(null);
  Rx<File?> frontRHDoor = Rx<File?>(null);
  Rx<File?> rearLHDoor = Rx<File?>(null);
  Rx<File?> rearRHDoor = Rx<File?>(null);
  Rx<File?> lhaPillar = Rx<File?>(null);
  RxList<String> selectedLhFenderList = <String>[].obs;
  RxList<String> selectedRhFenderList = <String>[].obs;
  RxList<String> selectedLhQuarterPanelList = <String>[].obs;
  RxList<String> selectedRhQuarterPanelList = <String>[].obs;
  RxList<String> selectedFrontLHDoorList = <String>[].obs;
  RxList<String> selectedFrontRHDoorList = <String>[].obs;
  RxList<String> selectedRearLHDoorList = <String>[].obs;
  RxList<String> selectedRearRHDoorList = <String>[].obs;
  RxList<String> selectedLhaPillarList = <String>[].obs;
  Rx<TextEditingController> lhFenderController = TextEditingController().obs;
  Rx<TextEditingController> otherLhFenderController = TextEditingController().obs;
  Rx<TextEditingController> lhFenderRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhFenderController = TextEditingController().obs;
  Rx<TextEditingController> otherRhFenderController = TextEditingController().obs;
  Rx<TextEditingController> rhFenderRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhQuarterPanelController = TextEditingController().obs;
  Rx<TextEditingController> otherLhQuarterPanelController = TextEditingController().obs;
  Rx<TextEditingController> lhQuarterPanelRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhQuarterPanelController = TextEditingController().obs;
  Rx<TextEditingController> otherRhQuarterPanelController = TextEditingController().obs;
  Rx<TextEditingController> rhQuarterPanelRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontLHDoorController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontLHDoorController = TextEditingController().obs;
  Rx<TextEditingController> frontLHDoorRemarks = TextEditingController().obs;
  Rx<TextEditingController> frontRHDoorController = TextEditingController().obs;
  Rx<TextEditingController> otherFrontRHDoorController = TextEditingController().obs;
  Rx<TextEditingController> frontRHDoorRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearLHDoorController = TextEditingController().obs;
  Rx<TextEditingController> otherRearLHDoorController = TextEditingController().obs;
  Rx<TextEditingController> rearLHDoorRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearRHDoorController = TextEditingController().obs;
  Rx<TextEditingController> otherRearRHDoorController = TextEditingController().obs;
  Rx<TextEditingController> rearRHDoorRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhaPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherLhaPillarController = TextEditingController().obs;
  Rx<TextEditingController> lhaPillarRemarks = TextEditingController().obs;

  ///page five
  Rx<File?> rhaPillar = Rx<File?>(null);
  Rx<File?> lhbPillar = Rx<File?>(null);
  Rx<File?> lhcPillar = Rx<File?>(null);
  Rx<File?> rhbPillar = Rx<File?>(null);
  Rx<File?> rhcPillar = Rx<File?>(null);
  Rx<File?> rhRunBoard = Rx<File?>(null);
  Rx<File?> lhRunBoard = Rx<File?>(null);
  Rx<File?> tailLightLh = Rx<File?>(null);
  Rx<File?> tailLightRh = Rx<File?>(null);
  Rx<File?> rearWiper = Rx<File?>(null);
  RxList<String> selectedRhaPillarList = <String>[].obs;
  RxList<String> selectedLhbPillarList = <String>[].obs;
  RxList<String> selectedRhbPillarList = <String>[].obs;
  RxList<String> selectedLhcPillarList = <String>[].obs;
  RxList<String> selectedRhcPillarList = <String>[].obs;
  RxList<String> selectedRhRunBoardList = <String>[].obs;
  RxList<String> selectedLhRunBoardList = <String>[].obs;
  RxList<String> selectedTailLightLhList = <String>[].obs;
  RxList<String> selectedTailLightRhList = <String>[].obs;
  RxList<String> selectedRearWiperList = <String>[].obs;
  Rx<TextEditingController> rhaPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherRhaPillarController = TextEditingController().obs;
  Rx<TextEditingController> rhaPillarRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhbPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherLhbPillarController = TextEditingController().obs;
  Rx<TextEditingController> lhbPillarRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhbPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherRhbPillarController = TextEditingController().obs;
  Rx<TextEditingController> rhbPillarRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhcPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherLhcPillarController = TextEditingController().obs;
  Rx<TextEditingController> lhcPillarRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhcPillarController = TextEditingController().obs;
  Rx<TextEditingController> otherRhcPillarController = TextEditingController().obs;
  Rx<TextEditingController> rhcPillarRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhRunBoardController = TextEditingController().obs;
  Rx<TextEditingController> otherRhRunBoardController = TextEditingController().obs;
  Rx<TextEditingController> rhRunBoardRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhRunBoardController = TextEditingController().obs;
  Rx<TextEditingController> otherLhRunBoardController = TextEditingController().obs;
  Rx<TextEditingController> lhRunBoardRemarks = TextEditingController().obs;
  Rx<TextEditingController> tailLightLhController = TextEditingController().obs;
  Rx<TextEditingController> tailLightRhController = TextEditingController().obs;
  Rx<TextEditingController> otherTailLightLhController = TextEditingController().obs;
  Rx<TextEditingController> otherTailLightRhController = TextEditingController().obs;
  Rx<TextEditingController> tailLightLhRemarks = TextEditingController().obs;
  Rx<TextEditingController> tailLightRhRemarks = TextEditingController().obs;
  Rx<TextEditingController> rearWiperController = TextEditingController().obs;
  Rx<TextEditingController> otherRearWiperController = TextEditingController().obs;
  Rx<TextEditingController> rearWiperRemarks = TextEditingController().obs;

  ///page six
  Rx<TextEditingController> missingPartsController = TextEditingController().obs;

  var selectedJackAndTool = ''.obs;
  var selectedFullBodyRepaint = ''.obs;
  Rx<File?> bootImage = Rx<File?>(null);
  Rx<File?> dickyDoorImage = Rx<File?>(null);
  Rx<File?> spareWheel = Rx<File?>(null);
  Rx<File?> fuelLid = Rx<File?>(null);
  Rx<File?> lhRearViewMirror = Rx<File?>(null);
  Rx<File?> rhRearViewMirror = Rx<File?>(null);
  Rx<File?> firewall = Rx<File?>(null);
  RxList<String> selectedBootList = <String>[].obs;
  RxList<String> selectedDickyDoorList = <String>[].obs;
  RxList<String> selectedSpareWheelList = <String>[].obs;
  RxList<String> selectedFuelLidList = <String>[].obs;
  RxList<String> selectedRhRearViewMirrorList = <String>[].obs;
  RxList<String> selectedLhRearViewMirrorList = <String>[].obs;
  RxList<String> selectedFirewallList = <String>[].obs;
  Rx<TextEditingController> bootController = TextEditingController().obs;
  Rx<TextEditingController> otherBootController = TextEditingController().obs;
  Rx<TextEditingController> bootRemarks = TextEditingController().obs;
  Rx<TextEditingController> dickyDoorController = TextEditingController().obs;
  Rx<TextEditingController> otherDickyDoorController = TextEditingController().obs;
  Rx<TextEditingController> dickyDoorRemarks = TextEditingController().obs;
  Rx<TextEditingController> spareWheelController = TextEditingController().obs;
  Rx<TextEditingController> otherSpareWheelController = TextEditingController().obs;
  Rx<TextEditingController> spareWheelRemarks = TextEditingController().obs;
  Rx<TextEditingController> fuelLidController = TextEditingController().obs;
  Rx<TextEditingController> otherFuelLidController = TextEditingController().obs;
  Rx<TextEditingController> fuelLidRemarks = TextEditingController().obs;
  Rx<TextEditingController> lhRearViewMirrorController = TextEditingController().obs;
  Rx<TextEditingController> otherRhRearViewMirrorController = TextEditingController().obs;
  Rx<TextEditingController> lhRearViewMirrorRemarks = TextEditingController().obs;
  Rx<TextEditingController> rhRearViewMirrorController = TextEditingController().obs;
  Rx<TextEditingController> otherLhRearViewMirrorController = TextEditingController().obs;
  Rx<TextEditingController> rhRearViewMirrorRemarks = TextEditingController().obs;
  Rx<TextEditingController> firewallController = TextEditingController().obs;
  Rx<TextEditingController> otherFirewallController = TextEditingController().obs;
  Rx<TextEditingController> firewallRemarks = TextEditingController().obs;

  @override
  void onInit() {
    getExteriorData();
    super.onInit();
  }

  void updateExterior() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      print(Uri.parse(EndPoints.baseUrl + EndPoints.exterior +globals.carId.toString()));
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl + EndPoints.exterior +globals.carId.toString()));
      for (int i = 0; i < selectedFrontImageList.length; i++) {
        request.fields['front_condition[$i]'] = selectedFrontImageList[i];
      }
      for (int i = 0; i < selectedLeftImageList.length; i++) {
        request.fields['left_condition[$i]'] = selectedLeftImageList[i];
      }
      for (int i = 0; i < selectedRightImageList.length; i++) {
        request.fields['right_condition[$i]'] = selectedRightImageList[i];
      }
      for (int i = 0; i < selectedFrontLeftImageList.length; i++) {
        request.fields['frontLeft_condition[$i]'] = selectedFrontLeftImageList[i];
      }
      for (int i = 0; i < selectedFrontRightImageList.length; i++) {
        request.fields['frontRight_condition[$i]'] = selectedFrontRightImageList[i];
      }
      for (int i = 0; i < selectedRearLeftImageList.length; i++) {
        request.fields['rearLeft_condition[$i]'] = selectedRearLeftImageList[i];
      }
      for (int i = 0; i < selectedRearRightList.length; i++) {
        request.fields['rearRight_condition[$i]'] = selectedRearRightList[i];
      }
      for (int i = 0; i < selectedRearImageList.length; i++) {
        request.fields['rear_condition[$i]'] = selectedRearImageList[i];
      }
      for (int i = 0; i < selectedFrontWindShieldWiperList.length; i++) {
        request.fields['frontWindShield_condition[$i]'] = selectedFrontWindShieldWiperList[i];
      }
      for (int i = 0; i < selectedRearWindShieldList.length; i++) {
        request.fields['rearWindShield_condition[$i]'] = selectedRearWindShieldList[i];
      }
      for (int i = 0; i < selectedRoofImageList.length; i++) {
        request.fields['roof_condition[$i]'] = selectedRoofImageList[i];
      }
      for (int i = 0; i < selectedDoorGlassLHList.length; i++) {
        request.fields['doorGlassLeft_condition[$i]'] = selectedDoorGlassLHList[i];
      }
      for (int i = 0; i < selectedDoorGlassRHList.length; i++) {
        request.fields['doorGlassRight_condition[$i]'] = selectedDoorGlassRHList[i];
      }
      for (int i = 0; i < selectedQuarterGlassList.length; i++) {
        request.fields['quarterGlass_condition[$i]'] = selectedQuarterGlassList[i];
      }
      for (int i = 0; i < selectedHeadlightsRHList.length; i++) {
        request.fields['headLightRight_condition[$i]'] = selectedHeadlightsRHList[i];
      }
      for (int i = 0; i < selectedHeadlightSupportList.length; i++) {
        request.fields['headLightSupport_condition[$i]'] = selectedHeadlightSupportList[i];
      }
      for (int i = 0; i < selectedFrontBumperList.length; i++) {
        request.fields['bumperFront_condition[$i]'] = selectedFrontBumperList[i];
      }
      for (int i = 0; i < selectedRearBumperList.length; i++) {
        request.fields['bumperRear_condition[$i]'] = selectedRearBumperList[i];
      }
      for (int i = 0; i < selectedBonnetPattiList.length; i++) {
        request.fields['bonnetPatti_condition[$i]'] = selectedBonnetPattiList[i];
      }
      for (int i = 0; i < selectedFrontGrillList.length; i++) {
        request.fields['grill_condition[$i]'] = selectedFrontGrillList[i];
      }
      for (int i = 0; i < selectedLowerCrossMemberList.length; i++) {
        request.fields['lowerCrossMember_condition[$i]'] = selectedLowerCrossMemberList[i];
      }
      for (int i = 0; i < selectedUpperCrossMemberList.length; i++) {
        request.fields['upperCrossMember_condition[$i]'] = selectedUpperCrossMemberList[i];
      }
      for (int i = 0; i < selectedApronLHList.length; i++) {
        request.fields['apronLeft_condition[$i]'] = selectedApronLHList[i];
      }
      for (int i = 0; i < selectedApronRHList.length; i++) {
        request.fields['apronRight_condition[$i]'] = selectedApronRHList[i];
      }
      for (int i = 0; i < selectedChassisExtensionList.length; i++) {
        request.fields['chassisExtension_condition[$i]'] = selectedChassisExtensionList[i];
      }
      for (int i = 0; i < selectedLhFenderList.length; i++) {
        request.fields['fenderLeft_condition[$i]'] = selectedLhFenderList[i];
      }
      for (int i = 0; i < selectedRhFenderList.length; i++) {
        request.fields['fenderRight_condition[$i]'] = selectedRhFenderList[i];
      }
      for (int i = 0; i < selectedRhQuarterPanelList.length; i++) {
        request.fields['quarterPanelRight_condition[$i]'] = selectedRhQuarterPanelList[i];
      }
      for (int i = 0; i < selectedLhQuarterPanelList.length; i++) {
        request.fields['quarterPanelLeft_condition[$i]'] = selectedLhQuarterPanelList[i];
      }
      for (int i = 0; i < selectedFrontRHDoorList.length; i++) {
        request.fields['doorFrontRight_condition[$i]'] = selectedFrontRHDoorList[i];
      }
      for (int i = 0; i < selectedFrontLHDoorList.length; i++) {
        request.fields['doorFrontLeft_condition[$i]'] = selectedFrontLHDoorList[i];
      }
      for (int i = 0; i < selectedRearRHDoorList.length; i++) {
        request.fields['doorRearRight_condition[$i]'] = selectedRearRHDoorList[i];
      }
      for (int i = 0; i < selectedRearLHDoorList.length; i++) {
        request.fields['doorRearLeft_condition[$i]'] = selectedRearLHDoorList[i];
      }
      for (int i = 0; i < selectedLhaPillarList.length; i++) {
        request.fields['leftApillar_condition[$i]'] = selectedLhaPillarList[i];
      }
      for (int i = 0; i < selectedRhaPillarList.length; i++) {
        request.fields['rightApillar_condition[$i]'] = selectedRhaPillarList[i];
      }
      for (int i = 0; i < selectedLhbPillarList.length; i++) {
        request.fields['leftBpillar_condition[$i]'] = selectedLhbPillarList[i];
      }
      for (int i = 0; i < selectedRhbPillarList.length; i++) {
        request.fields['rightBpillar_condition[$i]'] = selectedRhbPillarList[i];
      }
      for (int i = 0; i < selectedLhcPillarList.length; i++) {
        request.fields['leftCpillar_condition[$i]'] = selectedLhcPillarList[i];
      }
      for (int i = 0; i < selectedRhcPillarList.length; i++) {
        request.fields['rightCpillar_condition[$i]'] = selectedRhcPillarList[i];
      }
      for (int i = 0; i < selectedRhRunBoardList.length; i++) {
        request.fields['runnningBorderRight_condition[$i]'] = selectedRhRunBoardList[i];
      }
      for (int i = 0; i < selectedLhRunBoardList.length; i++) {
        request.fields['runnningBorderLeft_condition[$i]'] = selectedLhRunBoardList[i];
      }
      for (int i = 0; i < selectedTailLightRhList.length; i++) {
        request.fields['tailLightRight_condition[$i]'] = selectedTailLightRhList[i];
      }
      for (int i = 0; i < selectedTailLightLhList.length; i++) {
        request.fields['tailLightLeft_condition[$i]'] = selectedTailLightLhList[i];
      }
      for (int i = 0; i < selectedRearWiperList.length; i++) {
        request.fields['rearWiper_condition[$i]'] = selectedRearWiperList[i];
      }
      for (int i = 0; i < selectedDickyDoorList.length; i++) {
        request.fields['dickyDoor_condition[$i]'] = selectedDickyDoorList[i];
      }
      for (int i = 0; i < selectedBootList.length; i++) {
        request.fields['boot_condition[$i]'] = selectedBootList[i];
      }
      for (int i = 0; i < selectedFirewallList.length; i++) {
        request.fields['firewall_condition[$i]'] = selectedFirewallList[i];
      }
      for (int i = 0; i < selectedSpareWheelList.length; i++) {
        request.fields['spareWheel_condition[$i]'] = selectedSpareWheelList[i];
      }
      for (int i = 0; i < selectedLhRearViewMirrorList.length; i++) {
        request.fields['rearViewMirrorLeft_condition[$i]'] = selectedLhRearViewMirrorList[i];
      }
      for (int i = 0; i < selectedRhRearViewMirrorList.length; i++) {
        request.fields['rearViewMirrorRight_condition[$i]'] = selectedRhRearViewMirrorList[i];
      }
      for (int i = 0; i < selectedFuelLidList.length; i++) {
        request.fields['fuelLid_condition[$i]'] = selectedFuelLidList[i];
      }
      for (int i = 0; i < selectedCowlTopList.length; i++) {
        request.fields['cowlTop_condition[$i]'] = selectedCowlTopList[i];
      }
      for (int i = 0; i < selectedTyreFrontRHSList.length; i++) {
        request.fields['frontTyreRight_condition[$i]'] = selectedTyreFrontRHSList[i];
      }
      for (int i = 0; i < selectedTyreFrontLHSList.length; i++) {
        request.fields['frontTyreLeft_condition[$i]'] = selectedTyreFrontLHSList[i];
      }
      for (int i = 0; i < selectedTyreRearRHSList.length; i++) {
        request.fields['rearTyreRight_condition[$i]'] = selectedTyreRearRHSList[i];
      }
      for (int i = 0; i < selectedTyreRearLHSList.length; i++) {
        request.fields['rearTyreLeft_condition[$i]'] = selectedTyreRearLHSList[i];
      }
      for (int i = 0; i < selectedHeadlightsLHList.length; i++) {
        request.fields['headLightLeft_condition[$i]'] = selectedHeadlightsLHList[i];
      }
      for (int i = 0; i < selectedTyreFrontLHSList.length; i++) {
        request.fields['frontTyreLeft_condition[$i]'] = selectedTyreFrontLHSList[i];
      }
      for (int i = 0; i < selectedTyreFrontRHSList.length; i++) {
        request.fields['frontTyreRight_condition[$i]'] = selectedTyreFrontRHSList[i];
      }
      for (int i = 0; i < selectedTyreRearRHSList.length; i++) {
        request.fields['rearTyreRight_condition[$i]'] = selectedTyreRearRHSList[i];
      }
      for (int i = 0; i < selectedTyreRearLHSList.length; i++) {
        request.fields['rearTyreLeft_condition[$i]'] = selectedTyreRearLHSList[i];
      }
      request.fields.addAll({
        'front_remarks': frontImageRemarks.value.text,
        'frontLeft_remarks': frontLeftImageRemarks.value.text,
        'frontRight_remarks': frontRightImageRemarks.value.text,
        'rearLeft_remarks': rearLeftImageRemarks.value.text,
        'rearRight_remarks': rearRightRemarks.value.text,
        'rear_remarks': rearImageRemarks.value.text,
        // 'frontWithHoodOpen_remarks': '',
        // 'frontWithHoodOpen_condition[0]': 'bad',
        // 'frontWithHoodOpen_condition[1]': 'bad',
        // 'rearBootOpen_remarks': '',
        // 'rearBootOpen_condition[0]': 'bad',
        // 'rearBootOpen_condition[1]': 'bad',
        'frontWindShield_remarks': frontWindShieldWiperRemarks.value.text,
        'rearWindShield_remarks': rearWindShieldRemarks.value.text,
        'roof_remarks': roofImageRemarks.value.text,
        'doorGlassLeft_remarks': doorGlassLHRemarks.value.text,
        'doorGlassRight_remarks': doorGlassRHRemarks.value.text,
        'quarterGlass_remarks': quarterGlassRemarks.value.text,
        'headLightRight_remarks': headlightsRHRemarks.value.text,
        'headLightLeft_remarks': headlightsLHRemarks.value.text,
        'headLightSupport_remarks': headlightSupportRemarks.value.text,
        'bumperFront_remarks': frontBumperRemarks.value.text,
        'bumperRear_remarks': rearBumperRemarks.value.text,
        'bonnetPatti_remarks': bonnetPattiRemarks.value.text,
        'grill_remarks': frontGrillRemarks.value.text,
        'lowerCrossMember_remarks': lowerCrossMemberRemarks.value.text,
        'upperCrossMember_remarks': upperCrossMemberRemarks.value.text,
        'apronLeft_remarks': apronLHRemarks.value.text,
        'apronRight_remarks': apronRHRemarks.value.text,
        'chassisExtension_remarks': chassisExtensionRemarks.value.text,
        'frontTyreRight_remarks': tyreFrontRHSRemarks.value.text,
        'frontTyreLeft_remarks': tyreFrontLHSRemarks.value.text,
        'rearTyreRight_remarks': tyreRearRHSRemarks.value.text,
        'rearTyreLeft_remarks': tyreRearLHSRemarks.value.text,
        'fenderLeft_remarks': lhFenderRemarks.value.text,
        'fenderRight_remarks': rhFenderRemarks.value.text,
        'quarterPanelRight_remarks': rhQuarterPanelRemarks.value.text,
        'quarterPanelLeft_remarks': lhQuarterPanelRemarks.value.text,
        'doorFrontRight_remarks': frontRHDoorRemarks.value.text,
        'doorFrontLeft_remarks': frontLHDoorRemarks.value.text,
        'doorRearRight_remarks': rearRHDoorRemarks.value.text,
        'doorRearLeft_remarks': rearLHDoorRemarks.value.text,
        'leftApillar_remarks': lhaPillarRemarks.value.text,
        'rightApillar_remarks': rhaPillarRemarks.value.text,
        'leftBpillar_remarks': lhbPillarRemarks.value.text,
        'rightBpillar_remarks': rhbPillarRemarks.value.text,
        'leftCpillar_remarks': lhcPillarRemarks.value.text,
        'rightCpillar_remarks': rhcPillarRemarks.value.text,
        'runnningBorderRight_remarks': rhRunBoardRemarks.value.text,
        'runnningBorderLeft_remarks': lhRunBoardRemarks.value.text,
        'tailLightRight_remarks': tailLightRhRemarks.value.text,
        'tailLightLeft_remarks': tailLightLhRemarks.value.text,
        'rearWiper_remarks': rearWiperRemarks.value.text,
        'dickyDoor_remarks': dickyDoorRemarks.value.text,
        'boot_remarks': bootRemarks.value.text,
        'firewall_remarks': firewallRemarks.value.text,
        'spareWheel_remarks': spareWheelRemarks.value.text,
        'rearViewMirrorLeft_remarks': lhRearViewMirrorRemarks.value.text,
        'rearViewMirrorRight_remarks': rhRearViewMirrorRemarks.value.text,
        'fuelLid_remarks': fuelLidRemarks.value.text,
        // 'fogLightRight_remarks': '',
        // 'fogLightRight_condition[0]': 'bad',
        // 'fogLightRight_condition[1]': 'bad',
        // 'fogLightLeft_remarks': '',
        // 'fogLightLeft_condition[0]': 'bad',
        // 'fogLightLeft_condition[1]': 'bad',
        'jackAndTool': selectedJackAndTool.value,
        'fullBodyRepaint': selectedFullBodyRepaint.value,
        'missingParts': missingPartsController.value.text,
        'cowlTop_remarks': cowlTopRemarks.value.text,
        'evaluationStatusForExterior':'COMPLETED'
      });
      if (frontImage.value != null && !frontImage.value!.path.startsWith('http') && !frontImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('front', frontImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      /*if (leftImage.value != null && !leftImage.value!.path.startsWith('http') && !leftImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('left', leftImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }*/
      /*if (rightImage.value != null && !rightImage.value!.path.startsWith('http') && !rightImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('right', rightImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }*/
      if (frontLeftImage.value != null && !frontLeftImage.value!.path.startsWith('http') && !frontLeftImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('frontLeft', frontLeftImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (frontRightImage.value != null && !frontRightImage.value!.path.startsWith('http') && !frontRightImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('frontRight', frontRightImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearLeftImage.value != null && !rearLeftImage.value!.path.startsWith('http') && !rearLeftImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearLeft', rearLeftImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearRightImage.value != null && !rearRightImage.value!.path.startsWith('http') && !rearRightImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearRight', rearRightImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearImage.value != null && !rearImage.value!.path.startsWith('http') && !rearImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rear', rearImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      // request.files.add( await http.MultipartFile.fromPath('frontWithHoodOpen', ));
      // request.files.add( await http.MultipartFile.fromPath('rearBootOpen', ));
      if (leftImage.value != null && !leftImage.value!.path.startsWith('http') && !leftImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('leftImage', leftImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rightImage.value  != null && !rightImage.value!.path.startsWith('http') && !rightImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rightImage', rightImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (frontWindShieldWiperImage.value  != null && !frontWindShieldWiperImage.value!.path.startsWith('http') && !frontWindShieldWiperImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('frontWindShield', frontWindShieldWiperImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearWindShield.value  != null && !rearWindShield.value!.path.startsWith('http') && !rearWindShield.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearWindShield', rearWindShield.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (roofImage.value  != null && !roofImage.value!.path.startsWith('http') && !roofImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('roof', roofImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (doorGlassLH.value  != null && !doorGlassLH.value!.path.startsWith('http') && !doorGlassLH.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorGlassLeft', doorGlassLH.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (doorGlassRH.value  != null && !doorGlassRH.value!.path.startsWith('http') && !doorGlassRH.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorGlassRight', doorGlassRH.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (quarterGlass.value  != null && !quarterGlass.value!.path.startsWith('http') && !quarterGlass.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('quarterGlass', quarterGlass.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (headlightSupport.value  != null && !headlightSupport.value!.path.startsWith('http') && !headlightSupport.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('headLightRight', headlightSupport.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (headlightsLH.value  != null && !headlightsLH.value!.path.startsWith('http') && !headlightsLH.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('headLightLeft', headlightsLH.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (headlightSupport.value  != null /*&& !headlightSupport.value!.path.startsWith('http') && !headlightSupport.value!.path.startsWith('https')*/) {
        if (!headlightSupport.value!.path.startsWith('http') && !headlightSupport.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('headLightSupport', headlightSupport.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (frontBumper.value  != null && !frontBumper.value!.path.startsWith('http') && !frontBumper.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('bumperFront', frontBumper.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearBumper.value  != null && !rearBumper.value!.path.startsWith('http') && !rearBumper.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('bumperRear', rearBumper.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (bonnetPattiImage.value  != null /*&& !bonnetPattiImage.value!.path.startsWith('http') && !bonnetPattiImage.value!.path.startsWith('https')*/) {
        if (!bonnetPattiImage.value!.path.startsWith('http') && !bonnetPattiImage.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('bonnetPatti', bonnetPattiImage.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (frontGrill.value  != null && !frontGrill.value!.path.startsWith('http') && !frontGrill.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('grill', frontGrill.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lowerCrossMember.value  != null && !lowerCrossMember.value!.path.startsWith('http') && !lowerCrossMember.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('lowerCrossMember', lowerCrossMember.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (upperCrossMember.value  != null && !upperCrossMember.value!.path.startsWith('http') && !upperCrossMember.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('upperCrossMember', upperCrossMember.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (apronLH.value  != null /*&& !apronLH.value!.path.startsWith('http') && !apronLH.value!.path.startsWith('https')*/) {
        if (!apronLH.value!.path.startsWith('http') && !apronLH.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('apronLeft', apronLH.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (apronRH.value  != null /*&& !apronRH.value!.path.startsWith('http') && !apronRH.value!.path.startsWith('https')*/) {
        if (!apronRH.value!.path.startsWith('http') && !apronRH.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('apronRight', apronRH.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (chassisExtension.value  != null /*&& !chassisExtension.value!.path.startsWith('http') && !chassisExtension.value!.path.startsWith('https')*/) {
        if (!chassisExtension.value!.path.startsWith('http') && !chassisExtension.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('chassisExtension', chassisExtension.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (tyreFrontRHS.value != null && !tyreFrontRHS.value!.path.startsWith('http') && !tyreFrontRHS.value!.path.startsWith('https')) {
        request.files.add( await http.MultipartFile.fromPath('frontTyreRight', tyreFrontRHS.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (tyreFrontLHS.value != null && !tyreFrontLHS.value!.path.startsWith('http') && !tyreFrontLHS.value!.path.startsWith('https')) {
        request.files.add( await http.MultipartFile.fromPath('frontTyreLeft', tyreFrontLHS.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (tyreRearRHS.value != null && !tyreRearRHS.value!.path.startsWith('http') && !tyreRearRHS.value!.path.startsWith('https')) {
        request.files.add( await http.MultipartFile.fromPath('rearTyreRight', tyreRearRHS.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (tyreRearLHS.value != null && !tyreRearLHS.value!.path.startsWith('http') && !tyreRearLHS.value!.path.startsWith('https')) {
        request.files.add( await http.MultipartFile.fromPath('rearTyreLeft', tyreRearLHS.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhFender.value  != null && !lhFender.value!.path.startsWith('http') && !lhFender.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('fenderLeft', lhFender.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhFender.value  != null && !rhFender.value!.path.startsWith('http') && !rhFender.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('fenderRight', rhFender.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhQuarterPanel.value  != null && !rhQuarterPanel.value!.path.startsWith('http') && !rhQuarterPanel.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('quarterPanelRight', rhQuarterPanel.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhQuarterPanel.value  != null && !lhQuarterPanel.value!.path.startsWith('http') && !lhQuarterPanel.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('quarterPanelLeft', lhQuarterPanel.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (frontRHDoor.value  != null && !frontRHDoor.value!.path.startsWith('http') && !frontRHDoor.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorFrontRight', frontRHDoor.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (frontLHDoor.value  != null && !frontLHDoor.value!.path.startsWith('http') && !frontLHDoor.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorFrontLeft', frontLHDoor.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearRHDoor.value  != null && !rearRHDoor.value!.path.startsWith('http') && !rearRHDoor.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorRearRight', rearRHDoor.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearLHDoor.value  != null && !rearLHDoor.value!.path.startsWith('http') && !rearLHDoor.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('doorRearLeft', rearLHDoor.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhaPillar.value  != null && !lhaPillar.value!.path.startsWith('http') && !lhaPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('leftApillar', lhaPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhaPillar.value  != null && !rhaPillar.value!.path.startsWith('http') && !rhaPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rightApillar', rhaPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhbPillar.value  != null && !lhbPillar.value!.path.startsWith('http') && !lhbPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('leftBpillar', lhbPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhbPillar.value  != null && !rhbPillar.value!.path.startsWith('http') && !rhbPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rightBpillar', rhbPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhcPillar.value  != null && !lhcPillar.value!.path.startsWith('http') && !lhcPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('leftCpillar', lhcPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhcPillar.value  != null && !rhcPillar.value!.path.startsWith('http') && !rhcPillar.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rightCpillar', rhcPillar.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhRunBoard.value  != null && !rhRunBoard.value!.path.startsWith('http') && !rhRunBoard.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('runnningBorderRight', rhRunBoard.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhRunBoard.value  != null && !lhRunBoard.value!.path.startsWith('http') && !lhRunBoard.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('runnningBorderLeft', lhRunBoard.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (tailLightRh.value  != null && !tailLightRh.value!.path.startsWith('http') && !tailLightRh.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('tailLightRight', tailLightRh.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (tailLightLh.value  != null && !tailLightLh.value!.path.startsWith('http') && !tailLightLh.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('tailLightLeft', tailLightLh.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rearWiper.value  != null && !rearWiper.value!.path.startsWith('http') && !rearWiper.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearWiper', rearWiper.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (dickyDoorImage.value  != null && !dickyDoorImage.value!.path.startsWith('http') && !dickyDoorImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('dickyDoor', dickyDoorImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (bootImage.value  != null && !bootImage.value!.path.startsWith('http') && !bootImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('boot', bootImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (firewall.value  != null/* && !firewall.value!.path.startsWith('http') && !firewall.value!.path.startsWith('https')*/) {
        if (!firewall.value!.path.startsWith('http') && !firewall.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('firewall', firewall.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      if (spareWheel.value  != null && !spareWheel.value!.path.startsWith('http') && !spareWheel.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('spareWheel', spareWheel.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (lhRearViewMirror.value  != null && !lhRearViewMirror.value!.path.startsWith('http') && !lhRearViewMirror.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearViewMirrorLeft', lhRearViewMirror.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rhRearViewMirror.value  != null && !rhRearViewMirror.value!.path.startsWith('http') && !rhRearViewMirror.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rearViewMirrorRight', rhRearViewMirror.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (fuelLid.value  != null && !fuelLid.value!.path.startsWith('http') && !fuelLid.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('fuelLid', fuelLid.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      // request.files.add( await http.MultipartFile.fromPath('fogLightRight', ));
      // request.files.add( await http.MultipartFile.fromPath('fogLightLeft', ));
      if (cowlTop.value  != null /*&& !cowlTop.value!.path.startsWith('http') && !cowlTop.value!.path.startsWith('https')*/) {
        if (!cowlTop.value!.path.startsWith('http') && !cowlTop.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('cowlTop', cowlTop.value!.path,contentType: MediaType('image', 'jpg'),));
        }
      }
      request.headers.addAll(globals.headers);

      http.StreamedResponse response = await request.send();
print(response.toString());
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.stream.bytesToString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.offNamed(AppRoutes.dashBoardScreen);
        // Get.back();
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.reasonPhrase);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      print(e);
    }
  }

  var exteriorResponse = ExteriorResponse().obs;

  void loadData() {
    try {
      if (exteriorResponse.value.data != null) {
        isPage1Fill.value = true;
        isPage2Fill.value = true;
        isPage3Fill.value = true;
        isPage4Fill.value = true;
        isPage5Fill.value = true;
        isPage6Fill.value = true;
        frontImage.value = exteriorResponse.value.data?[0].front?.url != null ? File(exteriorResponse.value.data?[0].front?.url ?? ''):null;
        frontLeftImage.value = exteriorResponse.value.data?[0].frontLeft?.url != null ? File(exteriorResponse.value.data?[0].frontLeft?.url ?? ''):null;
        frontRightImage.value = exteriorResponse.value.data?[0].frontRight?.url != null ? File(exteriorResponse.value.data?[0].frontRight?.url ?? ''):null;
        leftImage.value = exteriorResponse.value.data?[0].leftImage?.url != null ? File(exteriorResponse.value.data?[0].leftImage?.url ?? ''):null;
        rightImage.value = exteriorResponse.value.data?[0].rightImage?.url != null ? File(exteriorResponse.value.data?[0].rightImage?.url ?? ''):null;
        rearLeftImage.value = exteriorResponse.value.data?[0].rearLeft?.url != null ? File(exteriorResponse.value.data?[0].rearLeft?.url ?? ''):null;
        rearImage.value = exteriorResponse.value.data?[0].rear?.url != null ? File(exteriorResponse.value.data?[0].rear?.url ?? ''):null;
        rearRightImage.value = exteriorResponse.value.data?[0].rearRight?.url != null ? File(exteriorResponse.value.data?[0].rearRight?.url ?? ''):null;
        roofImage.value = exteriorResponse.value.data?[0].roof?.url != null ? File(exteriorResponse.value.data?[0].roof?.url ?? ''):null;
        frontWindShieldWiperImage.value = exteriorResponse.value.data?[0].frontWindShield?.url != null ? File(exteriorResponse.value.data?[0].frontWindShield?.url ?? ''):null;
        selectedFrontImageList.value = exteriorResponse.value.data?[0].front?.condition ?? [];
        selectedFrontLeftImageList.value = exteriorResponse.value.data?[0].frontLeft?.condition ?? [];
        selectedFrontRightImageList.value = exteriorResponse.value.data?[0].frontRight?.condition ?? [];
        selectedLeftImageList.value = exteriorResponse.value.data?[0].leftImage?.condition ?? [];
        selectedRightImageList.value = exteriorResponse.value.data?[0].rightImage?.condition ?? [];
        selectedRearLeftImageList.value = exteriorResponse.value.data?[0].rearLeft?.condition ?? [];
        selectedRearImageList.value = exteriorResponse.value.data?[0].rear?.condition ?? [];
        selectedRearRightList.value = exteriorResponse.value.data?[0].rearRight?.condition ?? [];
        selectedRoofImageList.value = exteriorResponse.value.data?[0].roof?.condition ?? [];
        selectedFrontWindShieldWiperList.value = exteriorResponse.value.data?[0].frontWindShield?.condition ?? [];
        frontImageController.value.text = exteriorResponse.value.data?[0].front?.condition?.join(',') ?? '';
        // otherFrontImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        frontImageRemarks.value.text = exteriorResponse.value.data?[0].front?.remarks ?? '';
        frontLeftImageController.value.text = exteriorResponse.value.data?[0].frontLeft?.condition?.join(',') ?? '';
        // otherFrontLeftImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        frontLeftImageRemarks.value.text = exteriorResponse.value.data?[0].frontLeft?.remarks ?? '';
        frontRightImageController.value.text = exteriorResponse.value.data?[0].frontRight?.condition?.join(',') ?? '';
        // otherFrontRightImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        frontRightImageRemarks.value.text = exteriorResponse.value.data?[0].frontRight?.remarks ?? '';
        leftImageController.value.text = exteriorResponse.value.data?[0].leftImage?.condition?.join(',') ?? '';
        // otherLeftImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        leftImageRemarks.value.text = exteriorResponse.value.data?[0].leftImage?.remarks ?? '';
        rightImageController.value.text = exteriorResponse.value.data?[0].rightImage?.condition?.join(',') ?? '';
        // otherRightImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        rightImageRemarks.value.text = exteriorResponse.value.data?[0].rightImage?.remarks ?? '';
        rearLeftImageController.value.text = exteriorResponse.value.data?[0].rearLeft?.condition?.join(',') ?? '';
        // otherRearLeftImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        rearLeftImageRemarks.value.text = exteriorResponse.value.data?[0].rearLeft?.remarks ?? '';
        rearImageController.value.text = exteriorResponse.value.data?[0].rear?.condition?.join(',') ?? '';
        // otherRearImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        rearImageRemarks.value.text = exteriorResponse.value.data?[0].rear?.remarks ?? '';
        rearRightController.value.text = exteriorResponse.value.data?[0].rearRight?.condition?.join(',') ?? '';
        // otherRearRightController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        rearRightRemarks.value.text = exteriorResponse.value.data?[0].rearRight?.remarks ?? '';
        roofImageController.value.text = exteriorResponse.value.data?[0].roof?.condition?.join(',') ?? '';
        // otherRoofImageController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        roofImageRemarks.value.text = exteriorResponse.value.data?[0].roof?.remarks ?? '';
        frontWindShieldWiperController.value.text = exteriorResponse.value.data?[0].frontWindShield?.condition?.join(',') ?? '';
        // otherFrontWindShieldWiperController.value.text = exteriorResponse.value.data?[0].?.condition?.join(',') ?? '';
        frontWindShieldWiperRemarks.value.text = exteriorResponse.value.data?[0].frontWindShield?.remarks ?? '';

        ///page two
        rearWindShield.value = exteriorResponse.value.data?[0].rearWindShield?.url != null ? File(exteriorResponse.value.data?[0].rearWindShield?.url ?? ''):null;
        doorGlassLH.value = exteriorResponse.value.data?[0].doorGlassLeft?.url != null ? File(exteriorResponse.value.data?[0].doorGlassLeft?.url ?? ''):null;
        doorGlassRH.value = exteriorResponse.value.data?[0].doorGlassRight?.url != null ? File(exteriorResponse.value.data?[0].doorGlassRight?.url ?? ''):null;
        quarterGlass.value = exteriorResponse.value.data?[0].quarterGlass?.url != null ? File(exteriorResponse.value.data?[0].quarterGlass?.url ?? ''):null;
        headlightsLH.value = exteriorResponse.value.data?[0].headLightLeft?.url != null ? File(exteriorResponse.value.data?[0].headLightLeft?.url ?? ''):null;
        headlightsRH.value = exteriorResponse.value.data?[0].headLightRight?.url != null ? File(exteriorResponse.value.data?[0].headLightRight?.url ?? ''):null;
        headlightSupport.value = exteriorResponse.value.data?[0].headLightSupport?.url != null ? File(exteriorResponse.value.data?[0].headLightSupport?.url ?? ''):null;
        frontBumper.value = exteriorResponse.value.data?[0].bumperFront?.url != null ? File(exteriorResponse.value.data?[0].bumperFront?.url ?? ''):null;
        rearBumper.value = exteriorResponse.value.data?[0].bumperRear?.url != null ? File(exteriorResponse.value.data?[0].bumperRear?.url ?? ''):null;
        frontGrill.value = exteriorResponse.value.data?[0].grill?.url != null ? File(exteriorResponse.value.data?[0].grill?.url ?? ''):null;
        selectedRearWindShieldList.value = exteriorResponse.value.data?[0].rearWindShield?.condition ?? [];
        selectedDoorGlassLHList.value = exteriorResponse.value.data?[0].doorGlassLeft?.condition ?? [];
        selectedDoorGlassRHList.value = exteriorResponse.value.data?[0].doorGlassRight?.condition ?? [];
        selectedQuarterGlassList.value = exteriorResponse.value.data?[0].quarterGlass?.condition ?? [];
        selectedHeadlightsLHList.value = exteriorResponse.value.data?[0].headLightLeft?.condition ?? [];
        selectedHeadlightsRHList.value = exteriorResponse.value.data?[0].headLightRight?.condition ?? [];
        selectedHeadlightSupportList.value = exteriorResponse.value.data?[0].headLightSupport?.condition ?? [];
        selectedFrontBumperList.value = exteriorResponse.value.data?[0].bumperFront?.condition ?? [];
        selectedRearBumperList.value = exteriorResponse.value.data?[0].bumperRear?.condition ?? [];
        selectedFrontGrillList.value = exteriorResponse.value.data?[0].grill?.condition ?? [];
        rearWindShieldController.value.text = exteriorResponse.value.data?[0].rearWindShield?.condition?.join(',') ?? '';
        // otherRearWindShieldController.value.text = exteriorResponse.value.data
        rearWindShieldRemarks.value.text = exteriorResponse.value.data?[0].rearWindShield?.remarks ?? '';
        doorGlassLHController.value.text = exteriorResponse.value.data?[0].doorGlassLeft?.condition?.join(',') ?? '';
        // otherDoorGlassLHController.value.text = exteriorResponse.value.data
        doorGlassLHRemarks.value.text = exteriorResponse.value.data?[0].doorGlassLeft?.remarks ?? '';
        doorGlassRHController.value.text = exteriorResponse.value.data?[0].doorGlassRight?.condition?.join(',') ?? '';
        // otherDoorGlassRHController.value.text = exteriorResponse.value.data
        doorGlassRHRemarks.value.text = exteriorResponse.value.data?[0].doorGlassRight?.remarks ?? '';
        quarterGlassController.value.text = exteriorResponse.value.data?[0].quarterGlass?.condition?.join(',') ?? '';
        // otherQuarterGlassController.value.text = exteriorResponse.value.data
        quarterGlassRemarks.value.text = exteriorResponse.value.data?[0].quarterGlass?.remarks ?? '';
        headlightsLHController.value.text = exteriorResponse.value.data?[0].headLightLeft?.condition?.join(',') ?? '';
        // otherHeadlightsLHController.value.text = exteriorResponse.value.data
        headlightsLHRemarks.value.text = exteriorResponse.value.data?[0].headLightLeft?.remarks ?? '';
        headlightsRHController.value.text = exteriorResponse.value.data?[0].headLightRight?.condition?.join(',') ?? '';
        // otherHeadlightsRHController.value.text = exteriorResponse.value.data
        headlightsRHRemarks.value.text = exteriorResponse.value.data?[0].headLightRight?.remarks ?? '';
        headlightSupportController.value.text = exteriorResponse.value.data?[0].headLightSupport?.condition?.join(',') ?? '';
        // otherHeadlightSupportController.value.text = exteriorResponse.value.data
        headlightSupportRemarks.value.text = exteriorResponse.value.data?[0].headLightSupport?.remarks ?? '';
        frontBumperController.value.text = exteriorResponse.value.data?[0].bumperFront?.condition?.join(',') ?? '';
        // otherFrontBumperController.value.text = exteriorResponse.value.data
        frontBumperRemarks.value.text = exteriorResponse.value.data?[0].bumperFront?.remarks ?? '';
        rearBumperController.value.text = exteriorResponse.value.data?[0].bumperRear?.condition?.join(',') ?? '';
        // otherRearBumperController.value.text = exteriorResponse.value.data
        rearBumperRemarks.value.text = exteriorResponse.value.data?[0].bumperRear?.remarks ?? '';
        frontGrillController.value.text = exteriorResponse.value.data?[0].grill?.condition?.join(',') ?? '';
        // otherFrontGrillController.value.text = exteriorResponse.value.data
        frontGrillRemarks.value.text = exteriorResponse.value.data?[0].grill?.remarks ?? '';

        ///page three
        // selectedTyreFrontRHS.value = exteriorResponse.value.data
        // selectedTyreRearRHS.value = exteriorResponse.value.data
        // selectedTyreRearLHS.value = exteriorResponse.value.data
        // selectedTyreFrontLHS.value = exteriorResponse.value.data
        bonnetPattiImage.value = exteriorResponse.value.data?[0].bonnetPatti?.url != null ? File(exteriorResponse.value.data?[0].bonnetPatti?.url ?? ''):null;
        upperCrossMember.value = exteriorResponse.value.data?[0].upperCrossMember?.url != null ? File(exteriorResponse.value.data?[0].upperCrossMember?.url ?? ''):null;
        lowerCrossMember.value = exteriorResponse.value.data?[0].lowerCrossMember?.url != null ? File(exteriorResponse.value.data?[0].lowerCrossMember?.url ?? ''):null;
        apronLH.value = exteriorResponse.value.data?[0].apronLeft?.url != null ? File(exteriorResponse.value.data?[0].apronLeft?.url ?? ''):null;
        apronRH.value = exteriorResponse.value.data?[0].apronRight?.url != null ? File(exteriorResponse.value.data?[0].apronRight?.url ?? ''):null;
        cowlTop.value = exteriorResponse.value.data?[0].cowlTop?.url != null ? File(exteriorResponse.value.data?[0].cowlTop?.url ?? ''):null;
        tyreFrontRHS.value = exteriorResponse.value.data?[0].frontTyreRight?.url != null ? File(exteriorResponse.value.data?[0].frontTyreRight?.url ?? ''):null;
        tyreFrontLHS.value = exteriorResponse.value.data?[0].frontTyreLeft?.url != null ? File(exteriorResponse.value.data?[0].frontTyreLeft?.url ?? ''):null;
        tyreRearRHS.value = exteriorResponse.value.data?[0].rearTyreRight?.url != null ? File(exteriorResponse.value.data?[0].rearTyreRight?.url ?? ''):null;
        tyreRearLHS.value = exteriorResponse.value.data?[0].rearTyreLeft?.url != null ? File(exteriorResponse.value.data?[0].rearTyreLeft?.url ?? ''):null;
        chassisExtension.value = exteriorResponse.value.data?[0].chassisExtension?.url != null ? File(exteriorResponse.value.data?[0].chassisExtension?.url ?? ''):null;
        selectedBonnetPattiList.value = exteriorResponse.value.data?[0].bonnetPatti?.condition ?? [];
        selectedUpperCrossMemberList.value = exteriorResponse.value.data?[0].upperCrossMember?.condition ?? [];
        selectedLowerCrossMemberList.value = exteriorResponse.value.data?[0].lowerCrossMember?.condition ?? [];
        selectedApronLHList.value = exteriorResponse.value.data?[0].apronLeft?.condition ?? [];
        selectedApronRHList.value = exteriorResponse.value.data?[0].apronRight?.condition ?? [];
        selectedCowlTopList.value = exteriorResponse.value.data?[0].cowlTop?.condition ?? [];
        selectedChassisExtensionList.value = exteriorResponse.value.data?[0].chassisExtension?.condition ?? [];
        bonnetPattiController.value.text = exteriorResponse.value.data?[0].bonnetPatti?.condition?.join(',') ?? '';
        // otherBonnetPattiController.value.text = exteriorResponse.value.data
        bonnetPattiRemarks.value.text = exteriorResponse.value.data?[0].bonnetPatti?.remarks ?? '';
        upperCrossMemberController.value.text = exteriorResponse.value.data?[0].upperCrossMember?.condition?.join(',') ?? '';
        // otherUpperCrossMemberController.value.text = exteriorResponse.value.data
        upperCrossMemberRemarks.value.text = exteriorResponse.value.data?[0].upperCrossMember?.remarks ?? '';
        lowerCrossMemberController.value.text = exteriorResponse.value.data?[0].lowerCrossMember?.condition?.join(',') ?? '';
        // otherLowerCrossMemberController.value.text = exteriorResponse.value.data
        lowerCrossMemberRemarks.value.text = exteriorResponse.value.data?[0].lowerCrossMember?.remarks ?? '';
        apronLHController.value.text = exteriorResponse.value.data?[0].apronLeft?.condition?.join(',') ?? '';
        // otherApronLHController.value.text = exteriorResponse.value.data
        apronLHRemarks.value.text = exteriorResponse.value.data?[0].apronLeft?.remarks ?? '';
        apronRHController.value.text = exteriorResponse.value.data?[0].apronRight?.condition?.join(',') ?? '';
        // otherApronRHController.value.text = exteriorResponse.value.data
        apronRHRemarks.value.text = exteriorResponse.value.data?[0].apronRight?.remarks ?? '';
        cowlTopController.value.text = exteriorResponse.value.data?[0].cowlTop?.condition?.join(',') ?? '';
        // otherCowlTopController.value.text = exteriorResponse.value.data
        cowlTopRemarks.value.text = exteriorResponse.value.data?[0].cowlTop?.remarks ?? '';
        chassisExtensionController.value.text = exteriorResponse.value.data?[0].chassisExtension?.condition?.join(',') ?? '';
        // otherChassisExtensionController.value.text = exteriorResponse.value.data
        chassisExtensionRemarks.value.text = exteriorResponse.value.data?[0].chassisExtension?.remarks ?? '';

        ///page four
        lhFender.value = exteriorResponse.value.data?[0].fenderLeft?.url != null ? File(exteriorResponse.value.data?[0].fenderLeft?.url ?? ''):null;
        rhFender.value = exteriorResponse.value.data?[0].fenderRight?.url != null ? File(exteriorResponse.value.data?[0].fenderRight?.url ?? ''):null;
        lhQuarterPanel.value = exteriorResponse.value.data?[0].quarterPanelLeft?.url != null ? File(exteriorResponse.value.data?[0].quarterPanelLeft?.url ?? ''):null;
        rhQuarterPanel.value = exteriorResponse.value.data?[0].quarterPanelRight?.url != null ? File(exteriorResponse.value.data?[0].quarterPanelRight?.url ?? ''):null;
        frontLHDoor.value = exteriorResponse.value.data?[0].doorFrontLeft?.url != null ? File(exteriorResponse.value.data?[0].doorFrontLeft?.url ?? ''):null;
        frontRHDoor.value = exteriorResponse.value.data?[0].doorFrontRight?.url != null ? File(exteriorResponse.value.data?[0].doorFrontRight?.url ?? ''):null;
        rearLHDoor.value = exteriorResponse.value.data?[0].doorRearLeft?.url != null ? File(exteriorResponse.value.data?[0].doorRearLeft?.url ?? ''):null;
        rearRHDoor.value = exteriorResponse.value.data?[0].doorRearRight?.url != null ? File(exteriorResponse.value.data?[0].doorRearRight?.url ?? ''):null;
        lhaPillar.value = exteriorResponse.value.data?[0].leftApillar?.url != null ? File(exteriorResponse.value.data?[0].leftApillar?.url ?? ''):null;
        selectedLhFenderList.value = exteriorResponse.value.data?[0].fenderLeft?.condition ?? [];
        selectedRhFenderList.value = exteriorResponse.value.data?[0].fenderRight?.condition ?? [];
        selectedLhQuarterPanelList.value = exteriorResponse.value.data?[0].quarterPanelLeft?.condition ?? [];
        selectedRhQuarterPanelList.value = exteriorResponse.value.data?[0].quarterPanelRight?.condition ?? [];
        selectedFrontLHDoorList.value = exteriorResponse.value.data?[0].doorFrontLeft?.condition ?? [];
        selectedFrontRHDoorList.value = exteriorResponse.value.data?[0].doorFrontRight?.condition ?? [];
        selectedRearLHDoorList.value = exteriorResponse.value.data?[0].doorRearLeft?.condition ?? [];
        selectedRearRHDoorList.value = exteriorResponse.value.data?[0].doorRearRight?.condition ?? [];
        selectedLhaPillarList.value = exteriorResponse.value.data?[0].leftApillar?.condition ?? [];
        lhFenderController.value.text = exteriorResponse.value.data?[0].fenderLeft?.condition?.join(',') ?? '';
        // otherLhFenderController.value.text = exteriorResponse.value.data
        lhFenderRemarks.value.text = exteriorResponse.value.data?[0].fenderLeft?.remarks ?? '';
        rhFenderController.value.text = exteriorResponse.value.data?[0].fenderRight?.condition?.join(',') ?? '';
        // otherRhFenderController.value.text = exteriorResponse.value.data
        rhFenderRemarks.value.text = exteriorResponse.value.data?[0].fenderRight?.remarks ?? '';
        lhQuarterPanelController.value.text = exteriorResponse.value.data?[0].quarterPanelLeft?.condition?.join(',') ?? '';
        // otherLhQuarterPanelController.value.text = exteriorResponse.value.data
        lhQuarterPanelRemarks.value.text = exteriorResponse.value.data?[0].quarterPanelLeft?.remarks ?? '';
        rhQuarterPanelController.value.text = exteriorResponse.value.data?[0].quarterPanelRight?.condition?.join(',') ?? '';
        // otherRhQuarterPanelController.value.text = exteriorResponse.value.data
        rhQuarterPanelRemarks.value.text = exteriorResponse.value.data?[0].quarterPanelRight?.remarks ?? '';
        frontLHDoorController.value.text = exteriorResponse.value.data?[0].doorFrontLeft?.condition?.join(',') ?? '';
        // otherFrontLHDoorController.value.text = exteriorResponse.value.data
        frontLHDoorRemarks.value.text = exteriorResponse.value.data?[0].doorFrontLeft?.remarks ?? '';
        frontRHDoorController.value.text = exteriorResponse.value.data?[0].doorFrontRight?.condition?.join(',') ?? '';
        // otherFrontRHDoorController.value.text = exteriorResponse.value.data
        frontRHDoorRemarks.value.text = exteriorResponse.value.data?[0].doorFrontRight?.remarks ?? '';
        rearLHDoorController.value.text = exteriorResponse.value.data?[0].doorRearLeft?.condition?.join(',') ?? '';
        // otherRearLHDoorController.value.text = exteriorResponse.value.data
        rearLHDoorRemarks.value.text = exteriorResponse.value.data?[0].doorRearLeft?.remarks ?? '';
        rearRHDoorController.value.text = exteriorResponse.value.data?[0].doorRearRight?.condition?.join(',') ?? '';
        // otherRearRHDoorController.value.text = exteriorResponse.value.data
        rearRHDoorRemarks.value.text = exteriorResponse.value.data?[0].doorRearRight?.remarks ?? '';
        lhaPillarController.value.text = exteriorResponse.value.data?[0].leftApillar?.condition?.join(',') ?? '';
        // otherLhaPillarController.value.text = exteriorResponse.value.data
        lhaPillarRemarks.value.text = exteriorResponse.value.data?[0].leftApillar?.remarks ?? '';

        ///page five
        rhaPillar.value = exteriorResponse.value.data?[0].rightApillar?.url != null ? File(exteriorResponse.value.data?[0].rightApillar?.url ?? ''):null;
        lhbPillar.value = exteriorResponse.value.data?[0].leftBpillar?.url != null ? File(exteriorResponse.value.data?[0].leftBpillar?.url ?? ''):null;
        lhcPillar.value = exteriorResponse.value.data?[0].leftCpillar?.url != null ? File(exteriorResponse.value.data?[0].leftCpillar?.url ?? ''):null;
        rhbPillar.value = exteriorResponse.value.data?[0].rightBpillar?.url != null ? File(exteriorResponse.value.data?[0].rightBpillar?.url ?? ''):null;
        rhcPillar.value = exteriorResponse.value.data?[0].rightCpillar?.url != null ? File(exteriorResponse.value.data?[0].rightCpillar?.url ?? ''):null;
        rhRunBoard.value = exteriorResponse.value.data?[0].runnningBorderRight?.url != null ? File(exteriorResponse.value.data?[0].runnningBorderRight?.url ?? ''):null;
        lhRunBoard.value = exteriorResponse.value.data?[0].runnningBorderLeft?.url != null ? File(exteriorResponse.value.data?[0].runnningBorderLeft?.url ?? ''):null;
        tailLightLh.value = exteriorResponse.value.data?[0].tailLightLeft?.url != null ? File(exteriorResponse.value.data?[0].tailLightLeft?.url ?? ''):null;
        tailLightRh.value = exteriorResponse.value.data?[0].tailLightRight?.url != null ? File(exteriorResponse.value.data?[0].tailLightRight?.url ?? ''):null;
        rearWiper.value = exteriorResponse.value.data?[0].rearWiper?.url != null ? File(exteriorResponse.value.data?[0].rearWiper?.url ?? ''):null;
        selectedRhaPillarList.value = exteriorResponse.value.data?[0].rightApillar?.condition ?? [];
        selectedLhbPillarList.value = exteriorResponse.value.data?[0].leftBpillar?.condition ?? [];
        selectedRhbPillarList.value = exteriorResponse.value.data?[0].rightBpillar?.condition ?? [];
        selectedLhcPillarList.value = exteriorResponse.value.data?[0].leftCpillar?.condition ?? [];
        selectedRhcPillarList.value = exteriorResponse.value.data?[0].rightCpillar?.condition ?? [];
        selectedRhRunBoardList.value = exteriorResponse.value.data?[0].runnningBorderRight?.condition ?? [];
        selectedLhRunBoardList.value = exteriorResponse.value.data?[0].runnningBorderLeft?.condition ?? [];
        selectedTailLightLhList.value = exteriorResponse.value.data?[0].tailLightLeft?.condition ?? [];
        selectedTailLightRhList.value = exteriorResponse.value.data?[0].tailLightRight?.condition ?? [];
        selectedRearWiperList.value = exteriorResponse.value.data?[0].rearWiper?.condition ?? [];
        rhaPillarController.value.text = exteriorResponse.value.data?[0].rightApillar?.condition?.join(',') ?? '';
        // otherRhaPillarController.value.text = exteriorResponse.value.data
        rhaPillarRemarks.value.text = exteriorResponse.value.data?[0].rightApillar?.remarks ?? '';
        lhbPillarController.value.text = exteriorResponse.value.data?[0].leftBpillar?.condition?.join(',') ?? '';
        // otherLhbPillarController.value.text = exteriorResponse.value.data
        lhbPillarRemarks.value.text = exteriorResponse.value.data?[0].leftBpillar?.remarks ?? '';
        rhbPillarController.value.text = exteriorResponse.value.data?[0].rightBpillar?.condition?.join(',') ?? '';
        // otherRhbPillarController.value.text = exteriorResponse.value.data
        rhbPillarRemarks.value.text = exteriorResponse.value.data?[0].rightBpillar?.remarks ?? '';
        lhcPillarController.value.text = exteriorResponse.value.data?[0].leftCpillar?.condition?.join(',') ?? '';
        // otherLhcPillarController.value.text = exteriorResponse.value.data
        lhcPillarRemarks.value.text = exteriorResponse.value.data?[0].leftCpillar?.remarks ?? '';
        rhcPillarController.value.text = exteriorResponse.value.data?[0].rightCpillar?.condition?.join(',') ?? '';
        // otherRhcPillarController.value.text = exteriorResponse.value.data
        rhcPillarRemarks.value.text = exteriorResponse.value.data?[0].rightCpillar?.remarks ?? '';
        rhRunBoardController.value.text = exteriorResponse.value.data?[0].runnningBorderRight?.condition?.join(',') ?? '';
        // otherRhRunBoardController.value.text = exteriorResponse.value.data
        rhRunBoardRemarks.value.text = exteriorResponse.value.data?[0].runnningBorderRight?.remarks ?? '';
        lhRunBoardController.value.text = exteriorResponse.value.data?[0].runnningBorderLeft?.condition?.join(',') ?? '';
        // otherLhRunBoardController.value.text = exteriorResponse.value.data
        lhRunBoardRemarks.value.text = exteriorResponse.value.data?[0].runnningBorderLeft?.remarks ?? '';
        tailLightLhController.value.text = exteriorResponse.value.data?[0].tailLightLeft?.condition?.join(',') ?? '';
        tailLightRhController.value.text = exteriorResponse.value.data?[0].tailLightRight?.condition?.join(',') ?? '';
        // otherTailLightLhController.value.text = exteriorResponse.value.data?[0].?.remarks ?? '';
        // otherTailLightRhController.value.text = exteriorResponse.value.data
        tailLightLhRemarks.value.text = exteriorResponse.value.data?[0].tailLightLeft?.remarks ?? '';
        tailLightRhRemarks.value.text = exteriorResponse.value.data?[0].tailLightRight?.remarks ?? '';
        rearWiperController.value.text = exteriorResponse.value.data?[0].rearWiper?.condition?.join(',') ?? '';
        // otherRearWiperController.value.text = exteriorResponse.value.data
        rearWiperRemarks.value.text = exteriorResponse.value.data?[0].rearWiper?.remarks ?? '';

        ///page six
        selectedJackAndTool.value = exteriorResponse.value.data?[0].jackAndTool ?? '';
        selectedFullBodyRepaint.value = exteriorResponse.value.data?[0].fullBodyRepaint ?? '';
        bootImage.value = exteriorResponse.value.data?[0].boot?.url != null ? File(exteriorResponse.value.data?[0].boot?.url ?? ''):null;
        dickyDoorImage.value = exteriorResponse.value.data?[0].dickyDoor?.url != null ? File(exteriorResponse.value.data?[0].dickyDoor?.url ?? ''):null;
        spareWheel.value = exteriorResponse.value.data?[0].spareWheel?.url != null ? File(exteriorResponse.value.data?[0].spareWheel?.url ?? ''):null;
        fuelLid.value = exteriorResponse.value.data?[0].fuelLid?.url != null ? File(exteriorResponse.value.data?[0].fuelLid?.url ?? ''):null;
        lhRearViewMirror.value = exteriorResponse.value.data?[0].rearViewMirrorLeft?.url != null ? File(exteriorResponse.value.data?[0].rearViewMirrorLeft?.url ?? ''):null;
        rhRearViewMirror.value = exteriorResponse.value.data?[0].rearViewMirrorRight?.url != null ? File(exteriorResponse.value.data?[0].rearViewMirrorRight?.url ?? ''):null;
        firewall.value = exteriorResponse.value.data?[0].firewall?.url != null ? File(exteriorResponse.value.data?[0].firewall?.url ?? ''):null;
        selectedBootList.value = exteriorResponse.value.data?[0].boot?.condition ?? [];
        selectedDickyDoorList.value = exteriorResponse.value.data?[0].dickyDoor?.condition ?? [];
        selectedSpareWheelList.value = exteriorResponse.value.data?[0].spareWheel?.condition ?? [];
        selectedFuelLidList.value = exteriorResponse.value.data?[0].fuelLid?.condition ?? [];
        selectedRhRearViewMirrorList.value = exteriorResponse.value.data?[0].rearViewMirrorRight?.condition ?? [];
        selectedLhRearViewMirrorList.value = exteriorResponse.value.data?[0].rearViewMirrorLeft?.condition ?? [];
        selectedFirewallList.value = exteriorResponse.value.data?[0].firewall?.condition ?? [];
        missingPartsController.value.text = exteriorResponse.value.data?[0].missingParts ?? '';
        bootController.value.text = exteriorResponse.value.data?[0].boot?.condition?.join(',') ?? '';
        // otherBootController.value.text = exteriorResponse.value.data
        bootRemarks.value.text = exteriorResponse.value.data?[0].boot?.remarks ?? '';
        dickyDoorController.value.text = exteriorResponse.value.data?[0].dickyDoor?.condition?.join(',') ?? '';
        // otherDickyDoorController.value.text = exteriorResponse.value.data
        dickyDoorRemarks.value.text = exteriorResponse.value.data?[0].dickyDoor?.remarks ?? '';
        spareWheelController.value.text = exteriorResponse.value.data?[0].spareWheel?.condition?.join(',') ?? '';
        // otherSpareWheelController.value.text = exteriorResponse.value.data
        spareWheelRemarks.value.text = exteriorResponse.value.data?[0].spareWheel?.remarks ?? '';
        fuelLidController.value.text = exteriorResponse.value.data?[0].fuelLid?.condition?.join(',') ?? '';
        // otherFuelLidController.value.text = exteriorResponse.value.data
        fuelLidRemarks.value.text = exteriorResponse.value.data?[0].fuelLid?.remarks ?? '';
        lhRearViewMirrorController.value.text = exteriorResponse.value.data?[0].rearViewMirrorLeft?.condition?.join(',') ?? '';
        // otherRhRearViewMirrorController.value.text = exteriorResponse.value.data
        lhRearViewMirrorRemarks.value.text = exteriorResponse.value.data?[0].rearViewMirrorLeft?.remarks ?? '';
        rhRearViewMirrorController.value.text = exteriorResponse.value.data?[0].rearViewMirrorRight?.condition?.join(',') ?? '';
        // otherLhRearViewMirrorController.value.text = exteriorResponse.value.data
        rhRearViewMirrorRemarks.value.text = exteriorResponse.value.data?[0].rearViewMirrorLeft?.remarks ?? '';
        firewallController.value.text = exteriorResponse.value.data?[0].firewall?.condition?.join(',') ?? '';
        // otherFirewallController.value.text = exteriorResponse.value.data
        firewallRemarks.value.text = exteriorResponse.value.data?[0].firewall?.remarks ?? '';
      }
    } catch (e) {
      print(e);
    }
  }

  void getExteriorData() async {
    // ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.exterior + globals.carId.toString()), headers: globals.headers);
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        exteriorResponse.value = ExteriorResponse.fromJson(jsonDecode(response.body));
        loadData();
        print(response.body);
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
        print(response.reasonPhrase);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      print(e);
    }
  }
}
