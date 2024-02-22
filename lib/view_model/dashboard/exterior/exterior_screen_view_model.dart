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

class ExteriorViewModel extends GetxController{

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
  RxList<String> selectedBonnetPattiList = <String>[].obs;
  RxList<String> selectedUpperCrossMemberList = <String>[].obs;
  RxList<String> selectedLowerCrossMemberList = <String>[].obs;
  RxList<String> selectedApronLHList = <String>[].obs;
  RxList<String> selectedApronRHList = <String>[].obs;
  RxList<String> selectedCowlTopList = <String>[].obs;
  RxList<String> selectedChassisExtensionList = <String>[].obs;
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
  ///page 6
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
  
  void updateExterior()async{
    try{
      var request = http.MultipartRequest('PATCH', Uri.parse('http://43.205.61.101:8080/api/v1/exterior/65cf2025b07b4acdec103563'));
      request.fields.addAll({
        'front_remarks': frontImageRemarks.value.text, 
        'front_condition[0]': 'bad',
        'front_condition[1]': '',
        'frontLeft_remarks': frontLeftImageRemarks.value.text,
        'frontLeft-condition[0]': 'bad',
        'frontLeft-condition[1]': 'bad',
        'frontRight_remarks': frontRightImageRemarks.value.text,
        'frontRight_condition[0]': 'bad',
        'frontRight_condition[1]': 'bad',
        'rearLeft_remarks': rearLeftImageRemarks.value.text,
        'rearLeft_condition[0]': 'bad',
        'rearLeft_condition[1]': 'bad',
        'rearRight_remarks': rearRightRemarks.value.text,
        'rearRight_condition[0]': 'bad',
        'rearRight_condition[1]': 'bad',
        'rear_remarks': rearImageRemarks.value.text,
        'rear_condition[0]': 'bad',
        'rear_condition[1]': 'bad',
        'frontWithHoodOpen_remarks': '',
        'frontWithHoodOpen_condition[0]': 'bad',
        'frontWithHoodOpen_condition[1]': 'bad',
        'rearBootOpen_remarks': '',
        'rearBootOpen_condition[0]': 'bad',
        'rearBootOpen_condition[1]': 'bad',
        'frontWindShield_remarks': frontWindShieldWiperRemarks.value.text,
        'frontWindShield_condition[0]': 'bad',
        'frontWindShield_condition[1]': 'bad',
        'rearWindShield_remarks': rearWindShieldRemarks.value.text,
        'rearWindShield_condition[0]': 'bad',
        'rearWindShield_condition[1]': 'bad',
        'roof_remarks': roofImageRemarks.value.text,
        'roof_condition[0]': 'bad',
        'roof_condition[1]': 'bad',
        'doorGlassLeft_remarks': doorGlassLHRemarks.value.text,
        'doorGlassLeft_condition[0]': 'bad',
        'doorGlassLeft_condition[1]': 'bad',
        'doorGlassRight_remarks': doorGlassRHRemarks.value.text,
        'doorGlassRight_condition[0]': 'bad',
        'doorGlassRight_condition[1]': 'bad',
        'quarterGlass_remarks': quarterGlassRemarks.value.text,
        'quarterGlass_condition[0]': 'bad',
        'quarterGlass_condition[1]': 'bad',
        'headLightRight_remarks': headlightsRHRemarks.value.text,
        'headLightRight_condition[0]': 'bad',
        'headLightRight_condition[1]': 'bad',
        'headLightLeft_remarks': headlightsLHRemarks.value.text,
        'headLightLeft_condition[0]': 'bad',
        'headLightLeft_condition[1]': 'bad',
        'headLightSupport_remarks': headlightSupportRemarks.value.text,
        'headLightSupport_condition[0]': 'bad',
        'headLightSupport_condition[1]': 'bad',
        'bumperFront_remarks': frontBumperRemarks.value.text,
        'bumperFront_condition[0]': 'bad',
        'bumperFront_condition[1]': 'bad',
        'bumperRear_remarks': rearBumperRemarks.value.text,
        'bumperRear_condition[0]': 'bad',
        'bumperRear_condition[1]': 'bad',
        'bonnetPatti_remarks': bonnetPattiRemarks.value.text,
        'bonnetPatti_condition[0]': 'bad',
        'bonnetPatti_condition[1]': 'bad',
        'grill_remarks': frontGrillRemarks.value.text,
        'grill_condition[0]': 'bad',
        'grill_condition[1]': 'bad',
        'lowerCrossMember_remarks': lowerCrossMemberRemarks.value.text,
        'lowerCrossMember_condition[0]': 'bad',
        'lowerCrossMember_condition[1]': 'bad',
        'upperCrossMember_remarks': upperCrossMemberRemarks.value.text,
        'upperCrossMember_condition[0]': 'bad',
        'upperCrossMember_condition[1]': 'bad',
        'apronLeft_remarks': apronLHRemarks.value.text,
        'apronLeft_condition[0]': 'bad',
        'apronLeft_condition[1]': 'bad',
        'apronRight_remarks': apronRHRemarks.value.text,
        'apronRight_condition[0]': 'bad',
        'apronRight_condition[1]': 'bad',
        'chassisExtension_remarks': chassisExtensionRemarks.value.text,
        'chassisExtension_condition[0]': 'bad',
        'chassisExtension_condition[1]': 'bad',
        'frontTyreRight_remarks': '',
        'frontTyreRight_condition[0]': 'bad',
        'frontTyreRight_condition[1]': 'bad',
        'frontTyreLeft_remarks': '',
        'frontTyreLeft_condition[0]': 'bad',
        'frontTyreLeft_condition[1]': 'bad',
        'rearTyreRight_remarks': '',
        'rearTyreRight_condition[0]': 'bad',
        'rearTyreRight_condition[1]': 'bad',
        'rearTyreLeft_remarks': '',
        'rearTyreLeft_condition[0]': 'bad',
        'rearTyreLeft_condition[1]': 'bad',
        'fenderLeft_remarks': lhFenderRemarks.value.text,
        'fenderLeft_condition[0]': 'bad',
        'fenderLeft_condition[1]': 'bad',
        'fenderRight_remarks': rhFenderRemarks.value.text,
        'fenderRight_condition[0]': 'bad',
        'fenderRight_condition[1]': 'bad',
        'quarterPanelRight_remarks': rhQuarterPanelRemarks.value.text,
        'quarterPanelRight_condition[0]': 'bad',
        'quarterPanelRight_condition[1]': 'bad',
        'quarterPanelLeft_remarks': lhQuarterPanelRemarks.value.text,
        'quarterPanelLeft_condition[0]': 'bad',
        'quarterPanelLeft_condition[1]': 'bad',
        'doorFrontRight_remarks': frontRHDoorRemarks.value.text,
        'doorFrontRight_condition[0]': 'bad',
        'doorFrontRight_condition[1]': 'bad',
        'doorFrontLeft_remarks': frontLHDoorRemarks.value.text,
        'doorFrontLeft_condition[0]': 'bad',
        'doorFrontLeft_condition[1]': 'bad',
        'doorRearRight_remarks': rearRHDoorRemarks.value.text,
        'doorRearRight_condition[0]': 'bad',
        'doorRearRight_condition[1]': 'bad',
        'doorRearLeft_remarks': rearLHDoorRemarks.value.text,
        'doorRearLeft_condition[0]': 'bad',
        'doorRearLeft_condition[1]': 'bad',
        'leftApillar_remarks':lhaPillarRemarks.value.text ,
        'leftApillar_condition[0]': 'bad',
        'leftApillar_condition[1]': 'bad',
        'rightApillar_remarks': rhaPillarRemarks.value.text,
        'rightApillar_condition[0]': 'bad',
        'rightApillar_condition[1]': 'bad',
        'leftBpillar_remarks': lhbPillarRemarks.value.text,
        'leftBpillar_condition[0]': 'bad',
        'leftBpillar_condition[1]': 'bad',
        'rightBpillar_remarks': rhbPillarRemarks.value.text,
        'rightBpillar_condition[0]': 'bad',
        'rightBpillar_condition[1]': 'bad',
        'leftCpillar_remarks': lhcPillarRemarks.value.text,
        'leftCpillar_condition[0]': 'bad',
        'leftCpillar_condition[1]': 'bad',
        'rightCpillar_remarks': rhcPillarRemarks.value.text,
        'rightCpillar_condition[0]': 'bad',
        'rightCpillar_condition[1]': 'bad',
        'runnningBorderRight_remarks': rhRunBoardRemarks.value.text,
        'runnningBorderRight_condition[0]': 'bad',
        'runnningBorderRight_condition[1]': 'bad',
        'runnningBorderLeft_remarks': lhRunBoardRemarks.value.text,
        'runnningBorderLeft_condition[0]': 'bad',
        'runnningBorderLeft_condition[1]': 'bad',
        'tailLightRight_remarks': tailLightRhRemarks.value.text,
        'tailLightRight_condition[0]': 'bad',
        'tailLightRight_condition[1]': 'bad',
        'tailLightLeft_remarks': tailLightLhRemarks.value.text,
        'tailLightLeft_condition[0]': 'bad',
        'tailLightLeft_condition[1]': 'bad',
        'rearWiper_remarks': rearWiperRemarks.value.text,
        'rearWiper_condition[0]': 'bad',
        'rearWiper_condition[1]': 'bad',
        'dickyDoor_remarks': dickyDoorRemarks.value.text,
        'dickyDoor_condition[0]': 'bad',
        'dickyDoor_condition[1]': 'bad',
        'boot_remarks': bootRemarks.value.text,
        'boot_condition[0]': 'bad',
        'boot_condition[1]': 'good',
        'firewall_remarks': firewallRemarks.value.text,
        'firewall_condition[0]': 'bad',
        'firewall_condition[1]': 'bad',
        'spareWheel_remarks': spareWheelRemarks.value.text,
        'spareWheel_condition[0]': 'bad',
        'spareWheel_condition[1]': 'bad',
        'rearViewMirrorLeft_remarks': lhRearViewMirrorRemarks.value.text,
        'rearViewMirrorLeft_condition[0]': 'bad',
        'rearViewMirrorLeft_condition[1]': 'bad',
        'rearViewMirrorRight_remarks': rhRearViewMirrorRemarks.value.text,
        'rearViewMirrorRight_condition[0]': 'bad',
        'rearViewMirrorRight_condition[1]': 'bad',
        'fuelLid_remarks': fuelLidRemarks.value.text,
        'fuelLid_condition[0]': 'bad',
        'fuelLid_condition[1]': 'bad',
        'fogLightRight_remarks': '',
        'fogLightRight_condition[0]': 'bad',
        'fogLightRight_condition[1]': 'bad',
        'fogLightLeft_remarks': '',
        'fogLightLeft_condition[0]': 'bad',
        'fogLightLeft_condition[1]': 'bad',
        'jackAndTool': selectedJackAndTool.value,
        'fullBodyRepaint': selectedFullBodyRepaint.value,
        'missingParts': missingPartsController.value.text,
        'cowlTop_remarks': cowlTopRemarks.value.text,
        'cowlTop_condition[0]': 'bad',
        'cowlTop_condition[1]': 'bad'
      });
      request.files.add( http.MultipartFile.fromBytes('front',frontImage.value!.readAsBytesSync() ));
      request.files.add( http.MultipartFile.fromBytes('frontLeft',frontLeftImage.value!.readAsBytesSync() ));
      request.files.add( http.MultipartFile.fromBytes('frontRight', frontRightImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearLeft', rearLeftImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearRight', rearRightImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rear', rearImage.value!.readAsBytesSync()));
      // request.files.add( http.MultipartFile.fromBytes('frontWithHoodOpen', ));
      // request.files.add( http.MultipartFile.fromBytes('rearBootOpen', ));
      request.files.add( http.MultipartFile.fromBytes('leftImage', leftImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rightImage', rightImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('frontWindShield', frontWindShieldWiperImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearWindShield', rearWindShield.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('roof', roofImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorGlassLeft', doorGlassLH.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorGlassRight', doorGlassRH.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('quarterGlass', quarterGlass.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('headLightRight', headlightSupport.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('headLightLeft', headlightsLH.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('headLightSupport', headlightSupport.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('bumperFront', frontBumper.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('bumperRear', rearBumper.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('bonnetPatti', bonnetPattiImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('grill', frontGrill.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('lowerCrossMember', lowerCrossMember.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('upperCrossMember',upperCrossMember.value!.readAsBytesSync() ));
      request.files.add( http.MultipartFile.fromBytes('apronLeft', apronLH.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('apronRight',apronRH.value!.readAsBytesSync() ));
      request.files.add( http.MultipartFile.fromBytes('chassisExtension',chassisExtension.value!.readAsBytesSync() ));
      // request.files.add( http.MultipartFile.fromBytes('frontTyreRight', ));
      // request.files.add( http.MultipartFile.fromBytes('frontTyreLeft', ));
      // request.files.add( http.MultipartFile.fromBytes('rearTyreRight', ));
      // request.files.add( http.MultipartFile.fromBytes('rearTyreLeft', ));
      request.files.add( http.MultipartFile.fromBytes('fenderLeft', lhFender.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('fenderRight', rhFender.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('quarterPanelRight', rhQuarterPanel.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('quarterPanelLeft', lhQuarterPanel.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorFrontRight', frontRHDoor.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorFrontLeft', frontLHDoor.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorRearRight', rearRHDoor.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('doorRearLeft', rearLHDoor.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('leftApillar', lhaPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rightApillar', rhaPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('leftBpillar', lhbPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rightBpillar', rhbPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('leftCpillar', lhcPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rightCpillar', rhcPillar.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('runnningBorderRight', rhRunBoard.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('runnningBorderLeft', lhRunBoard.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('tailLightRight', tailLightRh.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('tailLightLeft', tailLightLh.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearWiper', rearWiper.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('dickyDoor', dickyDoorImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('boot', bootImage.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('firewall', firewall.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('spareWheel', spareWheel.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearViewMirrorLeft', lhRearViewMirror.value!.readAsBytesSync()));
      request.files.add( http.MultipartFile.fromBytes('rearViewMirrorRight',rhRearViewMirror.value!.readAsBytesSync() ));
      request.files.add( http.MultipartFile.fromBytes('fuelLid', fuelLid.value!.readAsBytesSync()));
      // request.files.add( http.MultipartFile.fromBytes('fogLightRight', ));
      // request.files.add( http.MultipartFile.fromBytes('fogLightLeft', ));
      request.files.add( http.MultipartFile.fromBytes('cowlTop', cowlTop.value!.readAsBytesSync()));
      request.headers.addAll(globals.headers);

      http.StreamedResponse response =  await request.send();

      if (response.statusCode == 200) {
        print( response.stream.bytesToString());
        CustomToast.instance.showMsg(MyStrings.success);
        Get.toNamed(AppRoutes.dashBoardScreen);
      }
      else {
        print(response.reasonPhrase);
      }

    }catch(e){
      print(e);
    }
  }
  var exteriorResponse = ExteriorResponse().obs;

  void loadData(){
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
  }
  
  void getExteriorData()async{
    try{
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.exterior+id),headers: globals.headers);
      if(response.statusCode == 200){
        exteriorResponse.value = ExteriorResponse.fromJson(jsonDecode(response.body));
        print(response.body);
      }
    }catch(e){
      print(e);
    }
  }

}