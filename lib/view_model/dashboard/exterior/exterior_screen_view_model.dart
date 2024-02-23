import 'dart:convert';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../model/response/exterior/exterior_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';

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
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints.baseUrl + EndPoints.exterior + id));
      for (int i = 0; i < selectedFrontImageList.length; i++) {
        request.fields['front_condition[$i]'] = selectedFrontImageList[i];
      }
      for (int i = 0; i < selectedFrontLeftImageList.length; i++) {
        request.fields['frontLeft-condition[$i]'] = selectedFrontLeftImageList[i];
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
      });
      if (frontImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('front', frontImage.value!.readAsBytesSync()));
      }
      if (frontLeftImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('frontLeft', frontLeftImage.value!.readAsBytesSync()));
      }
      if (frontRightImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('frontRight', frontRightImage.value!.readAsBytesSync()));
      }
      if (rearLeftImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearLeft', rearLeftImage.value!.readAsBytesSync()));
      }
      if (rearRightImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearRight', rearRightImage.value!.readAsBytesSync()));
      }
      if (rearImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rear', rearImage.value!.readAsBytesSync()));
      }
      // request.files.add( http.MultipartFile.fromBytes('frontWithHoodOpen', ));
      // request.files.add( http.MultipartFile.fromBytes('rearBootOpen', ));
      if (leftImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('leftImage', leftImage.value!.readAsBytesSync()));
      }
      if (leftImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rightImage', rightImage.value!.readAsBytesSync()));
      }
      if (frontWindShieldWiperImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('frontWindShield', frontWindShieldWiperImage.value!.readAsBytesSync()));
      }
      if (rearWindShield.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearWindShield', rearWindShield.value!.readAsBytesSync()));
      }
      if (roofImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('roof', roofImage.value!.readAsBytesSync()));
      }
      if (doorGlassLH.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorGlassLeft', doorGlassLH.value!.readAsBytesSync()));
      }
      if (doorGlassRH.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorGlassRight', doorGlassRH.value!.readAsBytesSync()));
      }
      if (quarterGlass.value != null) {
        request.files.add(http.MultipartFile.fromBytes('quarterGlass', quarterGlass.value!.readAsBytesSync()));
      }
      if (headlightSupport.value != null) {
        request.files.add(http.MultipartFile.fromBytes('headLightRight', headlightSupport.value!.readAsBytesSync()));
      }
      if (headlightsLH.value != null) {
        request.files.add(http.MultipartFile.fromBytes('headLightLeft', headlightsLH.value!.readAsBytesSync()));
      }
      if (headlightSupport.value != null) {
        request.files.add(http.MultipartFile.fromBytes('headLightSupport', headlightSupport.value!.readAsBytesSync()));
      }
      if (frontBumper.value != null) {
        request.files.add(http.MultipartFile.fromBytes('bumperFront', frontBumper.value!.readAsBytesSync()));
      }
      if (rearBumper.value != null) {
        request.files.add(http.MultipartFile.fromBytes('bumperRear', rearBumper.value!.readAsBytesSync()));
      }
      if (bonnetPattiImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('bonnetPatti', bonnetPattiImage.value!.readAsBytesSync()));
      }
      if (frontGrill.value != null) {
        request.files.add(http.MultipartFile.fromBytes('grill', frontGrill.value!.readAsBytesSync()));
      }
      if (lowerCrossMember.value != null) {
        request.files.add(http.MultipartFile.fromBytes('lowerCrossMember', lowerCrossMember.value!.readAsBytesSync()));
      }
      if (upperCrossMember.value != null) {
        request.files.add(http.MultipartFile.fromBytes('upperCrossMember', upperCrossMember.value!.readAsBytesSync()));
      }
      if (apronLH.value != null) {
        request.files.add(http.MultipartFile.fromBytes('apronLeft', apronLH.value!.readAsBytesSync()));
      }
      if (apronRH.value != null) {
        request.files.add(http.MultipartFile.fromBytes('apronRight', apronRH.value!.readAsBytesSync()));
      }
      if (chassisExtension.value != null) {
        request.files.add(http.MultipartFile.fromBytes('chassisExtension', chassisExtension.value!.readAsBytesSync()));
      }
      if (tyreFrontRHS.value!=null) {
        request.files.add( http.MultipartFile.fromBytes('frontTyreRight', tyreFrontRHS.value!.readAsBytesSync()));
      }
      if (tyreFrontLHS.value!=null) {
        request.files.add( http.MultipartFile.fromBytes('frontTyreLeft', tyreFrontLHS.value!.readAsBytesSync()));
      }
      if (tyreRearRHS.value!=null) {
        request.files.add( http.MultipartFile.fromBytes('rearTyreRight', tyreRearRHS.value!.readAsBytesSync()));
      }
      if (tyreRearLHS.value!=null) {
        request.files.add( http.MultipartFile.fromBytes('rearTyreLeft', tyreRearLHS.value!.readAsBytesSync()));
      }
      if (lhFender.value != null) {
        request.files.add(http.MultipartFile.fromBytes('fenderLeft', lhFender.value!.readAsBytesSync()));
      }
      if (rhFender.value != null) {
        request.files.add(http.MultipartFile.fromBytes('fenderRight', rhFender.value!.readAsBytesSync()));
      }
      if (rhQuarterPanel.value != null) {
        request.files.add(http.MultipartFile.fromBytes('quarterPanelRight', rhQuarterPanel.value!.readAsBytesSync()));
      }
      if (lhQuarterPanel.value != null) {
        request.files.add(http.MultipartFile.fromBytes('quarterPanelLeft', lhQuarterPanel.value!.readAsBytesSync()));
      }
      if (frontRHDoor.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorFrontRight', frontRHDoor.value!.readAsBytesSync()));
      }
      if (frontLHDoor.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorFrontLeft', frontLHDoor.value!.readAsBytesSync()));
      }
      if (rearRHDoor.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorRearRight', rearRHDoor.value!.readAsBytesSync()));
      }
      if (rearLHDoor.value != null) {
        request.files.add(http.MultipartFile.fromBytes('doorRearLeft', rearLHDoor.value!.readAsBytesSync()));
      }
      if (lhaPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('leftApillar', lhaPillar.value!.readAsBytesSync()));
      }
      if (rhaPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rightApillar', rhaPillar.value!.readAsBytesSync()));
      }
      if (lhbPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('leftBpillar', lhbPillar.value!.readAsBytesSync()));
      }
      if (rhbPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rightBpillar', rhbPillar.value!.readAsBytesSync()));
      }
      if (lhcPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('leftCpillar', lhcPillar.value!.readAsBytesSync()));
      }
      if (rhcPillar.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rightCpillar', rhcPillar.value!.readAsBytesSync()));
      }
      if (rhRunBoard.value != null) {
        request.files.add(http.MultipartFile.fromBytes('runnningBorderRight', rhRunBoard.value!.readAsBytesSync()));
      }
      if (lhRunBoard.value != null) {
        request.files.add(http.MultipartFile.fromBytes('runnningBorderLeft', lhRunBoard.value!.readAsBytesSync()));
      }
      if (tailLightRh.value != null) {
        request.files.add(http.MultipartFile.fromBytes('tailLightRight', tailLightRh.value!.readAsBytesSync()));
      }
      if (tailLightLh.value != null) {
        request.files.add(http.MultipartFile.fromBytes('tailLightLeft', tailLightLh.value!.readAsBytesSync()));
      }
      if (rearWiper.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearWiper', rearWiper.value!.readAsBytesSync()));
      }
      if (dickyDoorImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('dickyDoor', dickyDoorImage.value!.readAsBytesSync()));
      }
      if (bootImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('boot', bootImage.value!.readAsBytesSync()));
      }
      if (firewall.value != null) {
        request.files.add(http.MultipartFile.fromBytes('firewall', firewall.value!.readAsBytesSync()));
      }
      if (spareWheel.value != null) {
        request.files.add(http.MultipartFile.fromBytes('spareWheel', spareWheel.value!.readAsBytesSync()));
      }
      if (lhRearViewMirror.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearViewMirrorLeft', lhRearViewMirror.value!.readAsBytesSync()));
      }
      if (rhRearViewMirror.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rearViewMirrorRight', rhRearViewMirror.value!.readAsBytesSync()));
      }
      if (fuelLid.value != null) {
        request.files.add(http.MultipartFile.fromBytes('fuelLid', fuelLid.value!.readAsBytesSync()));
      }
      // request.files.add( http.MultipartFile.fromBytes('fogLightRight', ));
      // request.files.add( http.MultipartFile.fromBytes('fogLightLeft', ));
      if (cowlTop.value != null) {
        request.files.add(http.MultipartFile.fromBytes('cowlTop', cowlTop.value!.readAsBytesSync()));
      }
      request.headers.addAll(globals.headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(response.stream.bytesToString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.toNamed(AppRoutes.dashBoardScreen);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  var exteriorResponse = ExteriorResponse().obs;

  void loadData() {
    // frontImage.value = exteriorResponse.value.data[0]
    // frontLeftImage.value = exteriorResponse.value.data
    // frontRightImage.value = exteriorResponse.value.data
    // leftImage.value = exteriorResponse.value.data
    // rightImage.value = exteriorResponse.value.data
    // rearLeftImage.value = exteriorResponse.value.data
    // rearImage.value = exteriorResponse.value.data
    // rearRightImage.value = exteriorResponse.value.data
    // roofImage.value = exteriorResponse.value.data
    // frontWindShieldWiperImage.value = exteriorResponse.value.data
    // selectedFrontImageList.value = exteriorResponse.value.data
    // selectedFrontLeftImageList.value = exteriorResponse.value.data
    // selectedFrontRightImageList.value = exteriorResponse.value.data
    // selectedLeftImageList.value = exteriorResponse.value.data
    // selectedRightImageList.value = exteriorResponse.value.data
    // selectedRearLeftImageList.value = exteriorResponse.value.data
    // selectedRearImageList.value = exteriorResponse.value.data
    // selectedRearRightList.value = exteriorResponse.value.data
    // selectedRoofImageList.value = exteriorResponse.value.data
    // selectedFrontWindShieldWiperList.value = exteriorResponse.value.data
    // frontImageController.value.text = exteriorResponse.value.data
    // otherFrontImageController.value.text = exteriorResponse.value.data
    // frontImageRemarks.value.text = exteriorResponse.value.data
    // frontLeftImageController.value.text = exteriorResponse.value.data
    // otherFrontLeftImageController.value.text = exteriorResponse.value.data
    // frontLeftImageRemarks.value.text = exteriorResponse.value.data
    // frontRightImageController.value.text = exteriorResponse.value.data
    // otherFrontRightImageController.value.text = exteriorResponse.value.data
    // frontRightImageRemarks.value.text = exteriorResponse.value.data
    // leftImageController.value.text = exteriorResponse.value.data
    // otherLeftImageController.value.text = exteriorResponse.value.data
    // leftImageRemarks.value.text = exteriorResponse.value.data
    // rightImageController.value.text = exteriorResponse.value.data
    // otherRightImageController.value.text = exteriorResponse.value.data
    // rightImageRemarks.value.text = exteriorResponse.value.data
    // rearLeftImageController.value.text = exteriorResponse.value.data
    // otherRearLeftImageController.value.text = exteriorResponse.value.data
    // rearLeftImageRemarks.value.text = exteriorResponse.value.data
    // rearImageController.value.text = exteriorResponse.value.data
    // otherRearImageController.value.text = exteriorResponse.value.data
    // rearImageRemarks.value.text = exteriorResponse.value.data
    // rearRightController.value.text = exteriorResponse.value.data
    // otherRearRightController.value.text = exteriorResponse.value.data
    // rearRightRemarks.value.text = exteriorResponse.value.data
    // roofImageController.value.text = exteriorResponse.value.data
    // otherRoofImageController.value.text = exteriorResponse.value.data
    // roofImageRemarks.value.text = exteriorResponse.value.data
    // frontWindShieldWiperController.value.text = exteriorResponse.value.data
    // otherFrontWindShieldWiperController.value.text = exteriorResponse.value.data
    // frontWindShieldWiperRemarks.value.text = exteriorResponse.value.data
    ///page two
    // rearWindShield.value = exteriorResponse.value.data
    // doorGlassLH.value = exteriorResponse.value.data
    // doorGlassRH.value = exteriorResponse.value.data
    // quarterGlass.value = exteriorResponse.value.data
    // headlightsLH.value = exteriorResponse.value.data
    // headlightsRH.value = exteriorResponse.value.data
    // headlightSupport.value = exteriorResponse.value.data
    // frontBumper.value = exteriorResponse.value.data
    // rearBumper.value = exteriorResponse.value.data
    // frontGrill.value = exteriorResponse.value.data
    // selectedRearWindShieldList.value = exteriorResponse.value.data
    // selectedDoorGlassLHList.value = exteriorResponse.value.data
    // selectedDoorGlassRHList.value = exteriorResponse.value.data
    // selectedQuarterGlassList.value = exteriorResponse.value.data
    // selectedHeadlightsLHList.value = exteriorResponse.value.data
    // selectedHeadlightsRHList.value = exteriorResponse.value.data
    // selectedHeadlightSupportList.value = exteriorResponse.value.data
    // selectedFrontBumperList.value = exteriorResponse.value.data
    // selectedRearBumperList.value = exteriorResponse.value.data
    // selectedFrontGrillList.value = exteriorResponse.value.data
    // rearWindShieldController.value = exteriorResponse.value.data
    // otherRearWindShieldController.value.text = exteriorResponse.value.data
    // rearWindShieldRemarks.value.text = exteriorResponse.value.data
    // doorGlassLHController.value.text = exteriorResponse.value.data
    // otherDoorGlassLHController.value.text = exteriorResponse.value.data
    // doorGlassLHRemarks.value.text = exteriorResponse.value.data
    // doorGlassRHController.value.text = exteriorResponse.value.data
    // otherDoorGlassRHController.value.text = exteriorResponse.value.data
    // doorGlassRHRemarks.value.text = exteriorResponse.value.data
    // quarterGlassController.value.text = exteriorResponse.value.data
    // otherQuarterGlassController.value.text = exteriorResponse.value.data
    // quarterGlassRemarks.value.text = exteriorResponse.value.data
    // headlightsLHController.value.text = exteriorResponse.value.data
    // otherHeadlightsLHController.value.text = exteriorResponse.value.data
    // headlightsLHRemarks.value.text = exteriorResponse.value.data
    // headlightsRHController.value.text = exteriorResponse.value.data
    // otherHeadlightsRHController.value.text = exteriorResponse.value.data
    // headlightsRHRemarks.value.text = exteriorResponse.value.data
    // headlightSupportController.value.text = exteriorResponse.value.data
    // otherHeadlightSupportController.value.text = exteriorResponse.value.data
    // headlightSupportRemarks.value.text = exteriorResponse.value.data
    // frontBumperController.value.text = exteriorResponse.value.data
    // otherFrontBumperController.value.text = exteriorResponse.value.data
    // frontBumperRemarks.value.text = exteriorResponse.value.data
    // rearBumperController.value.text = exteriorResponse.value.data
    // otherRearBumperController.value.text = exteriorResponse.value.data
    // rearBumperRemarks.value.text = exteriorResponse.value.data
    // frontGrillController.value.text = exteriorResponse.value.data
    // otherFrontGrillController.value.text = exteriorResponse.value.data
    // frontGrillRemarks.value.text = exteriorResponse.value.data
    ///page three
    // selectedTyreFrontRHS.value = exteriorResponse.value.data
    // selectedTyreRearRHS.value = exteriorResponse.value.data
    // selectedTyreRearLHS.value = exteriorResponse.value.data
    // selectedTyreFrontLHS.value = exteriorResponse.value.data
    // bonnetPattiImage.value = exteriorResponse.value.data
    // upperCrossMember.value = exteriorResponse.value.data
    // lowerCrossMember.value = exteriorResponse.value.data
    // apronLH.value = exteriorResponse.value.data
    // apronRH.value = exteriorResponse.value.data
    // cowlTop.value = exteriorResponse.value.data
    // chassisExtension.value = exteriorResponse.value.data
    // selectedBonnetPattiList.value = exteriorResponse.value.data
    // selectedUpperCrossMemberList.value = exteriorResponse.value.data
    // selectedLowerCrossMemberList.value = exteriorResponse.value.data
    // selectedApronLHList.value = exteriorResponse.value.data
    // selectedApronRHList.value = exteriorResponse.value.data
    // selectedCowlTopList.value = exteriorResponse.value.data
    // selectedChassisExtensionList.value = exteriorResponse.value.data
    // bonnetPattiController.value.text = exteriorResponse.value.data
    // otherBonnetPattiController.value.text = exteriorResponse.value.data
    // bonnetPattiRemarks.value.text = exteriorResponse.value.data
    // upperCrossMemberController.value.text = exteriorResponse.value.data
    // otherUpperCrossMemberController.value.text = exteriorResponse.value.data
    // upperCrossMemberRemarks.value.text = exteriorResponse.value.data
    // lowerCrossMemberController.value.text = exteriorResponse.value.data
    // otherLowerCrossMemberController.value.text = exteriorResponse.value.data
    // lowerCrossMemberRemarks.value.text = exteriorResponse.value.data
    // apronLHController.value.text = exteriorResponse.value.data
    // otherApronLHController.value.text = exteriorResponse.value.data
    // apronLHRemarks.value.text = exteriorResponse.value.data
    // apronRHController.value.text = exteriorResponse.value.data
    // otherApronRHController.value.text = exteriorResponse.value.data
    // apronRHRemarks.value.text = exteriorResponse.value.data
    // cowlTopController.value.text = exteriorResponse.value.data
    // otherCowlTopController.value.text = exteriorResponse.value.data
    // cowlTopRemarks.value.text = exteriorResponse.value.data
    // chassisExtensionController.value.text = exteriorResponse.value.data
    // otherChassisExtensionController.value.text = exteriorResponse.value.data
    // chassisExtensionRemarks.value.text = exteriorResponse.value.data
    ///page four
    // lhFender.value = exteriorResponse.value.data
    // rhFender.value = exteriorResponse.value.data
    // lhQuarterPanel.value = exteriorResponse.value.data
    // rhQuarterPanel.value = exteriorResponse.value.data
    // frontLHDoor.value = exteriorResponse.value.data
    // frontRHDoor.value = exteriorResponse.value.data
    // rearLHDoor.value = exteriorResponse.value.data
    // rearRHDoor.value = exteriorResponse.value.data
    // lhaPillar.value = exteriorResponse.value.data
    // selectedLhFenderList.value = exteriorResponse.value.data
    // selectedRhFenderList.value = exteriorResponse.value.data
    // selectedLhQuarterPanelList.value = exteriorResponse.value.data
    // selectedRhQuarterPanelList.value = exteriorResponse.value.data
    // selectedFrontLHDoorList.value = exteriorResponse.value.data
    // selectedFrontRHDoorList.value = exteriorResponse.value.data
    // selectedRearLHDoorList.value = exteriorResponse.value.data
    // selectedRearRHDoorList.value = exteriorResponse.value.data
    // selectedLhaPillarList.value = exteriorResponse.value.data
    // lhFenderController.value.text = exteriorResponse.value.data
    // otherLhFenderController.value.text = exteriorResponse.value.data
    // lhFenderRemarks.value.text = exteriorResponse.value.data
    // rhFenderController.value.text = exteriorResponse.value.data
    // otherRhFenderController.value.text = exteriorResponse.value.data
    // rhFenderRemarks.value.text = exteriorResponse.value.data
    // lhQuarterPanelController.value.text = exteriorResponse.value.data
    // otherLhQuarterPanelController.value.text = exteriorResponse.value.data
    // lhQuarterPanelRemarks.value.text = exteriorResponse.value.data
    // rhQuarterPanelController.value.text = exteriorResponse.value.data
    // otherRhQuarterPanelController.value.text = exteriorResponse.value.data
    // rhQuarterPanelRemarks.value.text = exteriorResponse.value.data
    // frontLHDoorController.value.text = exteriorResponse.value.data
    // otherFrontLHDoorController.value.text = exteriorResponse.value.data
    // frontLHDoorRemarks.value.text = exteriorResponse.value.data
    // frontRHDoorController.value.text = exteriorResponse.value.data
    // otherFrontRHDoorController.value.text = exteriorResponse.value.data
    // frontRHDoorRemarks.value.text = exteriorResponse.value.data
    // rearLHDoorController.value.text = exteriorResponse.value.data
    // otherRearLHDoorController.value.text = exteriorResponse.value.data
    // rearLHDoorRemarks.value.text = exteriorResponse.value.data
    // rearRHDoorController.value.text = exteriorResponse.value.data
    // otherRearRHDoorController.value.text = exteriorResponse.value.data
    // rearRHDoorRemarks.value.text = exteriorResponse.value.data
    // lhaPillarController.value.text = exteriorResponse.value.data
    // otherLhaPillarController.value.text = exteriorResponse.value.data
    // lhaPillarRemarks.value.text = exteriorResponse.value.data
    ///page five
    // rhaPillar.value = exteriorResponse.value.data
    // lhbPillar.value = exteriorResponse.value.data
    // lhcPillar.value = exteriorResponse.value.data
    // rhbPillar.value = exteriorResponse.value.data
    // rhcPillar.value = exteriorResponse.value.data
    // rhRunBoard.value = exteriorResponse.value.data
    // lhRunBoard.value = exteriorResponse.value.data
    // tailLightLh.value = exteriorResponse.value.data
    // tailLightRh.value = exteriorResponse.value.data
    // rearWiper.value = exteriorResponse.value.data
    // selectedRhaPillarList.value = exteriorResponse.value.data
    // selectedLhbPillarList.value = exteriorResponse.value.data
    // selectedRhbPillarList.value = exteriorResponse.value.data
    // selectedLhcPillarList.value = exteriorResponse.value.data
    // selectedRhcPillarList.value = exteriorResponse.value.data
    // selectedRhRunBoardList.value = exteriorResponse.value.data
    // selectedLhRunBoardList.value = exteriorResponse.value.data
    // selectedTailLightLhList.value = exteriorResponse.value.data
    // selectedTailLightRhList.value = exteriorResponse.value.data
    // selectedRearWiperList.value = exteriorResponse.value.data
    // rhaPillarController.value.text = exteriorResponse.value.data
    // otherRhaPillarController.value.text = exteriorResponse.value.data
    // rhaPillarRemarks.value.text = exteriorResponse.value.data
    // lhbPillarController.value.text = exteriorResponse.value.data
    // otherLhbPillarController.value.text = exteriorResponse.value.data
    // lhbPillarRemarks.value.text = exteriorResponse.value.data
    // rhbPillarController.value.text = exteriorResponse.value.data
    // otherRhbPillarController.value.text = exteriorResponse.value.data
    // rhbPillarRemarks.value.text = exteriorResponse.value.data
    // lhcPillarController.value.text = exteriorResponse.value.data
    // otherLhcPillarController.value.text = exteriorResponse.value.data
    // lhcPillarRemarks.value.text = exteriorResponse.value.data
    // rhcPillarController.value.text = exteriorResponse.value.data
    // otherRhcPillarController.value.text = exteriorResponse.value.data
    // rhcPillarRemarks.value.text = exteriorResponse.value.data
    // rhRunBoardController.value.text = exteriorResponse.value.data
    // otherRhRunBoardController.value.text = exteriorResponse.value.data
    // rhRunBoardRemarks.value.text = exteriorResponse.value.data
    // lhRunBoardController.value.text = exteriorResponse.value.data
    // otherLhRunBoardController.value.text = exteriorResponse.value.data
    // lhRunBoardRemarks.value.text = exteriorResponse.value.data
    // tailLightLhController.value.text = exteriorResponse.value.data
    // tailLightRhController.value.text = exteriorResponse.value.data
    // otherTailLightLhController.value.text = exteriorResponse.value.data
    // otherTailLightRhController.value.text = exteriorResponse.value.data
    // tailLightLhRemarks.value.text = exteriorResponse.value.data
    // tailLightRhRemarks.value.text = exteriorResponse.value.data
    // rearWiperController.value.text = exteriorResponse.value.data
    // otherRearWiperController.value.text = exteriorResponse.value.data
    // rearWiperRemarks.value.text = exteriorResponse.value.data
    ///page six
    // selectedJackAndTool.value = exteriorResponse.value.data
    // selectedFullBodyRepaint.value = exteriorResponse.value.data
    // bootImage.value = exteriorResponse.value.data
    // dickyDoorImage.value = exteriorResponse.value.data
    // spareWheel.value = exteriorResponse.value.data
    // fuelLid.value = exteriorResponse.value.data
    // lhRearViewMirror.value = exteriorResponse.value.data
    // rhRearViewMirror.value = exteriorResponse.value.data
    // firewall.value = exteriorResponse.value.data
    // selectedBootList.value = exteriorResponse.value.data
    // selectedDickyDoorList.value = exteriorResponse.value.data
    // selectedSpareWheelList.value = exteriorResponse.value.data
    // selectedFuelLidList.value = exteriorResponse.value.data
    // selectedRhRearViewMirrorList.value = exteriorResponse.value.data
    // selectedLhRearViewMirrorList.value = exteriorResponse.value.data
    // selectedFirewallList.value = exteriorResponse.value.data
    // missingPartsController.value.text = exteriorResponse.value.data
    // bootController.value.text = exteriorResponse.value.data
    // otherBootController.value.text = exteriorResponse.value.data
    // bootRemarks.value.text = exteriorResponse.value.data
    // dickyDoorController.value.text = exteriorResponse.value.data
    // otherDickyDoorController.value.text = exteriorResponse.value.data
    // dickyDoorRemarks.value.text = exteriorResponse.value.data
    // spareWheelController.value.text = exteriorResponse.value.data
    // otherSpareWheelController.value.text = exteriorResponse.value.data
    // spareWheelRemarks.value.text = exteriorResponse.value.data
    // fuelLidController.value.text = exteriorResponse.value.data
    // otherFuelLidController.value.text = exteriorResponse.value.data
    // fuelLidRemarks.value.text = exteriorResponse.value.data
    // lhRearViewMirrorController.value.text = exteriorResponse.value.data
    // otherRhRearViewMirrorController.value.text = exteriorResponse.value.data
    // lhRearViewMirrorRemarks.value.text = exteriorResponse.value.data
    // rhRearViewMirrorController.value.text = exteriorResponse.value.data
    // otherLhRearViewMirrorController.value.text = exteriorResponse.value.data
    // rhRearViewMirrorRemarks.value.text = exteriorResponse.value.data
    // firewallController.value.text = exteriorResponse.value.data
    // otherFirewallController.value.text = exteriorResponse.value.data
    // firewallRemarks.value.text = exteriorResponse.value.data
  }

  void getExteriorData() async {
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.exterior + id), headers: globals.headers);
      if (response.statusCode == 200) {
        exteriorResponse.value = ExteriorResponse.fromJson(jsonDecode(response.body));
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
