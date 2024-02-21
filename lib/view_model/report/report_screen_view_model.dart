import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/utils/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../model/response/report/report_response.dart';
import '../../service/endpoints.dart';
import '../../service/exception_error_util.dart';
import '../../utils/images.dart';
import '../../widgets/custom_toast.dart';
import '../dashboard/dashboard_view_model.dart';

class ReportScreenViewModel extends GetxController{

  var isExpanded = true.obs;
  var id = Get.arguments ?? '';

  var ratingList = <Item>[].obs;
  var vehicleDetails = <Master>[].obs;
  var documents = <Master>[].obs;
  var exterior = <Master>[].obs;
  var exteriorImages = <Master>[].obs;
  var interiorImages = <Master>[].obs;
  var airCondition = <Master>[].obs;
  var engine = <Master>[].obs;
  var engineImages = <Master>[].obs;
  var testDrive = <Master>[].obs;
  var features = <Master>[].obs;
  var interiorAndElectrical = <Master>[].obs;
  var reportResponse = ReportResponse().obs;
  List<DashBoardClass> dashboard = [];


  @override
  void onInit() {
    dashboard = [
      DashBoardClass(icon: MyImages.all, label: MyStrings.allImages.toUpperCase(),),
      DashBoardClass(icon: MyImages.exteriorOutLined, label: MyStrings.exterior.toUpperCase(),),
      DashBoardClass(icon: MyImages.interiorOutLined, label: MyStrings.interior.toUpperCase(),),
      DashBoardClass(icon: MyImages.others, label: MyStrings.others.toUpperCase(),),
      DashBoardClass(icon: MyImages.engineOutLined, label: MyStrings.engine.toUpperCase(),),
      DashBoardClass(icon: MyImages.damages, label: MyStrings.damages.toUpperCase(),),
    ];
    getReport();
    super.onInit();
  }

void getReport() async {
  try {
    var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.evaluation+'/'+EndPoints.report+'65cf2025b07b4acdec103563'),headers: globals.headers);
    if(response.statusCode == 200){
      reportResponse.value = ReportResponse.fromJson(jsonDecode(response.body));
      if (reportResponse.value.data != null) {
        ratingList.value = [
                Item(title: MyStrings.exterior, rating: reportResponse.value.data!.allCarInfo!.exteriorStar?.toDouble() ?? 0),
                Item(title: MyStrings.interior, rating: reportResponse.value.data!.allCarInfo!.interiorStar?.toDouble() ?? 0),
                Item(title: MyStrings.engine, rating: reportResponse.value.data!.allCarInfo!.engineStar?.toDouble() ?? 0),
                //todo
                Item(title: MyStrings.carElectrical, rating: reportResponse.value.data!.allCarInfo!.interiorStar?.toDouble() ?? 0),
                Item(title: MyStrings.test, rating: reportResponse.value.data!.allCarInfo!.testDriveStar?.toDouble() ?? 0),
              ];
        vehicleDetails.value = [
          Master(title: MyStrings.registrationNumber, value: reportResponse.value.data!.regNumber ?? ''),
          Master(title: MyStrings.registrationDate, value: reportResponse.value.data!.regDate ?? ''),
          Master(title: MyStrings.ownershipNumber, value: reportResponse.value.data!.ownershipNumber ?? ''),
          Master(title: MyStrings.fuelType, value: reportResponse.value.data!.fuelType ?? ''),
          Master(title: MyStrings.transmission, value: reportResponse.value.data!.allCarInfo!.transmission ?? ''),
          Master(title: MyStrings.bodyType, value: reportResponse.value.data!.bodyType ?? ''),
          Master(title: MyStrings.color, value: reportResponse.value.data!.color ?? ''),
          Master(title: MyStrings.kilometer, value: reportResponse.value.data!.odometerReading.toString()),
          //todo
          Master(title: MyStrings.chassisNumber, value: reportResponse.value.data!.regNumber ?? ''),
          Master(title: MyStrings.specialComments, value: reportResponse.value.data!.specialComments ?? ''),
        ];
        documents.value = [
          Master(title: MyStrings.rc, value: reportResponse.value.data!.rcAvailability ?? ''),
          Master(title: MyStrings.insurance, value: reportResponse.value.data!.insurance ?? ''),
          Master(title: MyStrings.form35, value: reportResponse.value.data!.form35 ?? ''),
        ];
        features.value = [
          Master(title: MyStrings.keyLessEntry, value: reportResponse.value.data!.allCarInfo!.keylessEntry ?? ''),
          Master(title: MyStrings.stereoImage, value: reportResponse.value.data!.allCarInfo!.stereoBrand ?? ''),
          Master(title: MyStrings.stereoBrand, value: reportResponse.value.data!.allCarInfo!.stereoBrand ?? ''),
          Master(title: MyStrings.rearParkingSensor, value: reportResponse.value.data!.allCarInfo!.rearParkingSensor ?? ''),
          Master(title: MyStrings.fogLamp, value: reportResponse.value.data!.allCarInfo!.fogLamps ?? ''),
          Master(title: MyStrings.sunroof, value: reportResponse.value.data!.allCarInfo!.sunroof ?? ''),
          Master(title: MyStrings.gpsNavigation, value: reportResponse.value.data!.allCarInfo!.gpsNavigation ?? ''),
          Master(title: MyStrings.alloyWheels, value: reportResponse.value.data!.allCarInfo!.alloyWheels ?? ''),
          Master(title: MyStrings.airBag, value: reportResponse.value.data!.allCarInfo!.airbag ?? ''),
          Master(title: MyStrings.seatBelt, value: reportResponse.value.data!.allCarInfo!.seatBelt ?? ''),
          Master(title: MyStrings.absEbd, value: reportResponse.value.data!.allCarInfo!.absEbd ?? ''),
          Master(title: MyStrings.gloveBox, value: reportResponse.value.data!.allCarInfo!.gloveBox ?? ''),
          Master(title: MyStrings.interiorModifications, value: reportResponse.value.data!.allCarInfo!.interiorView ?? ''),
        ];
        testDrive.value = [
          Master(title: MyStrings.steering, value: reportResponse.value.data!.allCarInfo!.steeringSystem ?? ''),
          Master(title: MyStrings.steeringWheel, value: reportResponse.value.data!.allCarInfo!.steeringWheel ?? ''),
          Master(title: MyStrings.steeringAdjustment, value: reportResponse.value.data!.allCarInfo!.steeringAdjustment ?? ''),
          Master(title: MyStrings.steeringMountedAudio, value: reportResponse.value.data!.allCarInfo!.steeringMountedAudioControl ?? ''),
          Master(title: MyStrings.cruiseControl, value: reportResponse.value.data!.allCarInfo!.cruiseControl ?? ''),
          Master(title: MyStrings.seatAdjustment, value: reportResponse.value.data!.allCarInfo!.seatAdjustment ?? ''),
          Master(title: MyStrings.suspensionSystem, value: reportResponse.value.data!.allCarInfo!.suspension ?? ''),
          Master(title: MyStrings.brakes, value: reportResponse.value.data!.allCarInfo!.brakes ?? ''),
          Master(title: MyStrings.clutchSystem, value: reportResponse.value.data!.allCarInfo!.clutchSystem ?? ''),
          Master(title: MyStrings.transmissionAutomatic, value: reportResponse.value.data!.allCarInfo!.transmissionAutomatic ?? ''),
          Master(title: MyStrings.vehicleHorn, value: reportResponse.value.data!.allCarInfo!.vehicleHorn ?? ''),
        ];
        engine.value = [
          Master(title: MyStrings.engineSound, value: reportResponse.value.data!.allCarInfo!.engineSound ?? ''),
          Master(title: MyStrings.engine, value: reportResponse.value.data!.allCarInfo!.engineCondition ?? ''),
          Master(title: MyStrings.smoke, value: reportResponse.value.data!.allCarInfo!.exhaustSmoke ?? ''),
          Master(title: MyStrings.battery, value: reportResponse.value.data!.allCarInfo!.battery ?? ''),
          Master(title: MyStrings.radiator, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
          //todo
          Master(title: MyStrings.startingMotor, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
          Master(title: MyStrings.coolant, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
          Master(title: MyStrings.blowByBackCompression, value: reportResponse.value.data!.allCarInfo!.blowBy ?? ''),
          Master(title: MyStrings.silencer, value: reportResponse.value.data!.allCarInfo!.silencer ?? ''),
          Master(title: MyStrings.clutchOperations, value: reportResponse.value.data!.allCarInfo!.clutchSystem ?? ''),
          Master(title: MyStrings.gearbox, value: reportResponse.value.data!.allCarInfo!.gearBox ?? ''),
          Master(title: MyStrings.engineOil, value: reportResponse.value.data!.allCarInfo!.engineOil ?? ''),
          //todo
          Master(title: MyStrings.turboCharger, value: reportResponse.value.data!.allCarInfo!.radiator ?? ''),
          Master(title: MyStrings.gearboxLeakage, value: reportResponse.value.data!.allCarInfo!.gearBox ?? ''),
          Master(title: MyStrings.engineMount, value: reportResponse.value.data!.allCarInfo!.gearBox ?? ''),
          Master(title: MyStrings.sump, value: reportResponse.value.data!.allCarInfo!.gearBox ?? ''),
          Master(title: MyStrings.comments, value: reportResponse.value.data!.allCarInfo!.engineComment ?? ''),
        ];
        interiorAndElectrical.value = [
          Master(title: MyStrings.clusterPanel, value: reportResponse.value.data!.allCarInfo!.clusterPanel ?? ''),
          Master(title: MyStrings.warningLight, value: reportResponse.value.data!.allCarInfo!.warningDetails ?? ''),
          Master(title: MyStrings.dashboardImage, value: reportResponse.value.data!.allCarInfo!.dashboardCondition ?? ''),
          //todo
          Master(title: MyStrings.frontSeatImage, value: reportResponse.value.data!.allCarInfo!.seatAdjustment ?? ''),
          Master(title: MyStrings.rearSeatImage, value: reportResponse.value.data!.allCarInfo!.seatAdjustment ?? ''),
          Master(title: MyStrings.insideRearViewMirror, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.pushButtonOnOff, value: reportResponse.value.data!.allCarInfo!.pushButton ?? ''),
          Master(title: MyStrings.dashboardSwitches, value: reportResponse.value.data!.allCarInfo!.dashboardSwitch ?? ''),
          Master(title: MyStrings.powerWindowAndWindowLock, value: reportResponse.value.data!.allCarInfo!.powerWindowCentalLock ?? ''),
          Master(title: MyStrings.handBrake, value: reportResponse.value.data!.allCarInfo!.handBreak ?? ''),
          Master(title: MyStrings.carElectrical, value: reportResponse.value.data!.allCarInfo!.carElectrical ?? ''),
          Master(title: MyStrings.secondKey, value: reportResponse.value.data!.allCarInfo!.secondKey ?? ''),
          Master(title: MyStrings.platform, value: reportResponse.value.data!.allCarInfo!.platform ?? ''),
        ];
        airCondition.value = [
          Master(title: MyStrings.acWorking, value: reportResponse.value.data!.allCarInfo!.acWorking ?? ''),
          Master(title: MyStrings.cooling, value: reportResponse.value.data!.allCarInfo!.airCooling ?? ''),
          Master(title: MyStrings.heater, value: reportResponse.value.data!.allCarInfo!.heater ?? ''),
          Master(title: MyStrings.climateControl, value: reportResponse.value.data!.allCarInfo!.climateControl ?? ''),
          Master(title: MyStrings.acCondenserCompressor, value: reportResponse.value.data!.allCarInfo!.acCondensor ?? ''),
          Master(title: MyStrings.acFilterDamaged, value: reportResponse.value.data!.allCarInfo!.acFilterDamaged ?? ''),
          Master(title: MyStrings.acBlowerGrill, value: reportResponse.value.data!.allCarInfo!.acBlowerGrill ?? ''),
          Master(title: MyStrings.rearDefogger, value: reportResponse.value.data!.allCarInfo!.rearDefogger ?? ''),
        ];
        exterior.value = [
          //todo
          Master(title: MyStrings.frontImage, value: reportResponse.value.data!.rcAvailability ?? ''),
          Master(title: MyStrings.frontLeftImage, value: reportResponse.value.data!.insurance ?? ''),
          Master(title: MyStrings.frontRightImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.leftImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rightImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearLeftImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearRight, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.roofImage, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.frontWindShieldWiper, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearWindShield, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.doorGlassLH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.doorGlassRH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.quarterGlass, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.headlightsLH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.headlightsRH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.headlightSupport, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.frontBumper, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearBumper, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.frontGrill, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.bonnetPatti, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.upperCrossMember, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lowerCrossMember, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.apronLH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.apronRH, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.cowlTop, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.chassisExtension, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tyreFrontRHS, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tyreFrontLHS, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tyreRearRHS, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tyreRearLHS, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhFender, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhFender, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhQuarterPanel, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.frontLHDoor, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.frontRHDoor, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearRHDoor, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhaPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhaPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhbPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhbPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhcPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhcPillar, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhRunBoard, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhRunBoard, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tailLightLh, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.tailLightRh, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rearWiper, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.boot, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.dickyDoor, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.spareWheel, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.jackAndTool, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.lhRearViewMirror, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.rhRearViewMirror, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.fuelLid, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.firewall, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.fullBodyRepaint, value: reportResponse.value.data!.form35 ?? ''),
          Master(title: MyStrings.missingParts, value: reportResponse.value.data!.allCarInfo!.acBlowerGrill ?? ''),
        ];
      }

      }
  } catch (e) {
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
    required this.value,
  });

  String title;
  String value;
}