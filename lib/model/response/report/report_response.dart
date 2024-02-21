class ReportResponse {
  String? status;
  String? message;
  Data? data;
  Meta? meta;

  ReportResponse({this.status, this.message, this.data, this.meta});

  ReportResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? make;
  String? model;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  Front? front;
  Front? frontLeft;
  Front? frontRight;
  Front? rear;
  Front? rearLeft;
  Front? rearRight;
  AllCarInfo? allCarInfo;
  String? chasisNumber;
  String? monthAndYearOfManufacture;
  String? regDate;
  String? bodyType;
  String? color;
  int? odometerReading;
  String? rcAvailability;
  String? insurance;
  String? form35;
  List<String>? transmissionAutomatic;
  String? transmissionManual;
  String? specialComments;
  String? regNumber;
  String? customerPrice;

  Data(
      {this.sId,
        this.make,
        this.model,
        this.vehicleLocation,
        this.ownershipNumber,
        this.fuelType,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rear,
        this.rearLeft,
        this.rearRight,
        this.allCarInfo,
        this.chasisNumber,
        this.monthAndYearOfManufacture,
        this.regDate,
        this.bodyType,
        this.color,
        this.odometerReading,
        this.rcAvailability,
        this.insurance,
        this.form35,
        this.transmissionAutomatic,
        this.transmissionManual,
        this.specialComments,
        this.regNumber,
        this.customerPrice});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    make = json['make'];
    model = json['model'];
    vehicleLocation = json['vehicleLocation'];
    ownershipNumber = json['ownershipNumber'];
    fuelType = json['fuelType'];
    front = json['front'] != null ? new Front.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? new Front.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? new Front.fromJson(json['frontRight'])
        : null;
    rear = json['rear'] != null ? new Front.fromJson(json['rear']) : null;
    rearLeft =
    json['rearLeft'] != null ? new Front.fromJson(json['rearLeft']) : null;
    rearRight = json['rearRight'] != null
        ? new Front.fromJson(json['rearRight'])
        : null;
    allCarInfo = json['allCarInfo'] != null
        ? new AllCarInfo.fromJson(json['allCarInfo'])
        : null;
    chasisNumber = json['chasisNumber'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    regDate = json['regDate'];
    bodyType = json['bodyType'];
    color = json['color'];
    odometerReading = json['odometerReading'];
    rcAvailability = json['rcAvailability'];
    insurance = json['insurance'];
    form35 = json['form35'];
    transmissionAutomatic = json['transmissionAutomatic'].cast<String>();
    transmissionManual = json['transmissionManual'];
    specialComments = json['specialComments'];
    regNumber = json['regNumber'];
    customerPrice = json['customerPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['vehicleLocation'] = this.vehicleLocation;
    data['ownershipNumber'] = this.ownershipNumber;
    data['fuelType'] = this.fuelType;
    if (this.front != null) {
      data['front'] = this.front!.toJson();
    }
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
    }
    if (this.frontRight != null) {
      data['frontRight'] = this.frontRight!.toJson();
    }
    if (this.rear != null) {
      data['rear'] = this.rear!.toJson();
    }
    if (this.rearLeft != null) {
      data['rearLeft'] = this.rearLeft!.toJson();
    }
    if (this.rearRight != null) {
      data['rearRight'] = this.rearRight!.toJson();
    }
    if (this.allCarInfo != null) {
      data['allCarInfo'] = this.allCarInfo!.toJson();
    }
    data['chasisNumber'] = this.chasisNumber;
    data['monthAndYearOfManufacture'] = this.monthAndYearOfManufacture;
    data['regDate'] = this.regDate;
    data['bodyType'] = this.bodyType;
    data['color'] = this.color;
    data['odometerReading'] = this.odometerReading;
    data['rcAvailability'] = this.rcAvailability;
    data['insurance'] = this.insurance;
    data['form35'] = this.form35;
    data['transmissionAutomatic'] = this.transmissionAutomatic;
    data['transmissionManual'] = this.transmissionManual;
    data['specialComments'] = this.specialComments;
    data['regNumber'] = this.regNumber;
    data['customerPrice'] = this.customerPrice;
    return data;
  }
}

class Front {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  Front({this.name, this.url, this.condition, this.remarks});

  Front.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    condition = json['condition'].cast<String>();
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['condition'] = this.condition;
    data['remarks'] = this.remarks;
    return data;
  }
}

class AllCarInfo {
  int? engineCylinder;
  String? evaluationStatusForEngine;
  String? createdAt;
  String? updatedAt;
  List<String>? battery;
  List<String>? blowBy;
  List<String>? clutch;
  String? engineComment;
  Front? engineCompartment;
  List<String>? engineCondition;
  List<String>? engineOil;
  String? engineSound;
  EngineTappetVideo? engineTappetVideo;
  String? exhaustSmoke;
  List<String>? gearBox;
  String? radiator;
  String? silencer;
  String? compression;
  String? coolant;
  String? gearBoxLeakage;
  List<String>? mount;
  Front? startVideo;
  String? startingMotor;
  String? summary;
  List<String>? sump;
  List<String>? turboCharger;
  String? evaluationStatusForExterior;
  Front? apronLeft;
  Front? apronRight;
  Front? bonnetPatti;
  Front? boot;
  Front? bumperFront;
  Front? bumperRear;
  Front? chassisExtension;
  Front? dickyDoor;
  Front? doorFrontLeft;
  Front? doorFrontRight;
  Front? doorGlassLeft;
  Front? doorGlassRight;
  Front? doorRearLeft;
  Front? doorRearRight;
  Front? fenderLeft;
  Front? fenderRight;
  Front? firewall;
  Front? fogLightLeft;
  Front? fogLightRight;
  Front? frontTyreLeft;
  Front? frontTyreRight;
  Front? frontWindShield;
  Front? fuelLid;
  String? fullBodyRepaint;
  Front? grill;
  Front? headLightLeft;
  Front? headLightRight;
  Front? headLightSupport;
  String? jackAndTool;
  Front? leftApillar;
  Front? leftBpillar;
  Front? leftCpillar;
  Front? leftImage;
  Front? lowerCrossMember;
  String? missingParts;
  Front? quarterGlass;
  Front? quarterPanelLeft;
  Front? quarterPanelRight;
  Front? rearTyreLeft;
  Front? rearTyreRight;
  Front? rearViewMirrorLeft;
  Front? rearViewMirrorRight;
  Front? rearWindShield;
  Front? rearWiper;
  Front? rightApillar;
  Front? rightBpillar;
  Front? rightCpillar;
  Front? rightImage;
  Front? roof;
  Front? runnningBorderLeft;
  Front? runnningBorderRight;
  Front? spareWheel;
  Front? tailLightLeft;
  Front? tailLightRight;
  Front? upperCrossMember;
  Front? cowlTop;
  String? evaluationStatusForInterior;
  String? transmission;
  String? evaluationStatusForTestDrive;
  String? evaluationStatusForFeature;
  String? evaluationStatusForAc;
  String? carCondition;
  String? specialComments;
  List<String>? carElectrical;
  List<String>? clusterPanel;
  String? combitionSwitch;
  String? dashboardCondition;
  String? dashboardSwitch;
  List<String>? handBreak;
  double? interiorStar;
  Front? interiorView;
  String? key;
  List<String>? platform;
  List<String>? powerWindowCentalLock;
  String? pushButton;
  List<String>? rearViewMirror;
  String? secondKey;
  String? warningDetails;
  String? brakes;
  String? clutchSystem;
  String? cruiseControl;
  String? seatAdjustment;
  String? shocker;
  String? steeringAdjustment;
  String? steeringMountedAudioControl;
  String? steeringSystem;
  List<String>? steeringWheel;
  List<String>? suspension;
  List<String>? transmissionAutomatic;
  String? transmissionManual;
  List<String>? vehicleHorn;
  List<String>? absEbd;
  List<String>? airbag;
  List<String>? alloyWheels;
  String? anyInteriorModifications;
  String? fogLamps;
  List<String>? gloveBox;
  String? gpsNavigation;
  List<String>? keylessEntry;
  String? rearDefogger;
  String? rearParkingSensor;
  String? remoteCentalLock;
  String? seatBelt;
  String? stereoBrand;
  List<String>? sunroof;
  String? toolKit;
  String? acBlowerGrill;
  String? acCompressor;
  List<String>? acCondensor;
  String? acFilterDamaged;
  String? acWorking;
  List<String>? airCooling;
  String? climateControl;
  String? heater;
  int? engineStar;
  int? exteriorStar;
  int? testDriveStar;
  Front? dashboardImage;
  Front? frontSeatImage;
  EngineTappetVideo? handbreakImage;
  EngineTappetVideo? odometerImage;
  Front? powerWindowDriverImage;
  Front? pushWindowDriverImage;
  Front? rearSeatImage;
  double? electricalStar;
  Front? cngKitImage;
  Front? stereoImage;
  double? interiorAndElectricalStar;

  AllCarInfo(
      {this.engineCylinder,
        this.evaluationStatusForEngine,
        this.createdAt,
        this.updatedAt,
        this.battery,
        this.blowBy,
        this.clutch,
        this.engineComment,
        this.engineCompartment,
        this.engineCondition,
        this.engineOil,
        this.engineSound,
        this.engineTappetVideo,
        this.exhaustSmoke,
        this.gearBox,
        this.radiator,
        this.silencer,
        this.compression,
        this.coolant,
        this.gearBoxLeakage,
        this.mount,
        this.startVideo,
        this.startingMotor,
        this.summary,
        this.sump,
        this.turboCharger,
        this.evaluationStatusForExterior,
        this.apronLeft,
        this.apronRight,
        this.bonnetPatti,
        this.boot,
        this.bumperFront,
        this.bumperRear,
        this.chassisExtension,
        this.dickyDoor,
        this.doorFrontLeft,
        this.doorFrontRight,
        this.doorGlassLeft,
        this.doorGlassRight,
        this.doorRearLeft,
        this.doorRearRight,
        this.fenderLeft,
        this.fenderRight,
        this.firewall,
        this.fogLightLeft,
        this.fogLightRight,
        this.frontTyreLeft,
        this.frontTyreRight,
        this.frontWindShield,
        this.fuelLid,
        this.fullBodyRepaint,
        this.grill,
        this.headLightLeft,
        this.headLightRight,
        this.headLightSupport,
        this.jackAndTool,
        this.leftApillar,
        this.leftBpillar,
        this.leftCpillar,
        this.leftImage,
        this.lowerCrossMember,
        this.missingParts,
        this.quarterGlass,
        this.quarterPanelLeft,
        this.quarterPanelRight,
        this.rearTyreLeft,
        this.rearTyreRight,
        this.rearViewMirrorLeft,
        this.rearViewMirrorRight,
        this.rearWindShield,
        this.rearWiper,
        this.rightApillar,
        this.rightBpillar,
        this.rightCpillar,
        this.rightImage,
        this.roof,
        this.runnningBorderLeft,
        this.runnningBorderRight,
        this.spareWheel,
        this.tailLightLeft,
        this.tailLightRight,
        this.upperCrossMember,
        this.cowlTop,
        this.evaluationStatusForInterior,
        this.transmission,
        this.evaluationStatusForTestDrive,
        this.evaluationStatusForFeature,
        this.evaluationStatusForAc,
        this.carCondition,
        this.specialComments,
        this.carElectrical,
        this.clusterPanel,
        this.combitionSwitch,
        this.dashboardCondition,
        this.dashboardSwitch,
        this.handBreak,
        this.interiorStar,
        this.interiorView,
        this.key,
        this.platform,
        this.powerWindowCentalLock,
        this.pushButton,
        this.rearViewMirror,
        this.secondKey,
        this.warningDetails,
        this.brakes,
        this.clutchSystem,
        this.cruiseControl,
        this.seatAdjustment,
        this.shocker,
        this.steeringAdjustment,
        this.steeringMountedAudioControl,
        this.steeringSystem,
        this.steeringWheel,
        this.suspension,
        this.transmissionAutomatic,
        this.transmissionManual,
        this.vehicleHorn,
        this.absEbd,
        this.airbag,
        this.alloyWheels,
        this.anyInteriorModifications,
        this.fogLamps,
        this.gloveBox,
        this.gpsNavigation,
        this.keylessEntry,
        this.rearDefogger,
        this.rearParkingSensor,
        this.remoteCentalLock,
        this.seatBelt,
        this.stereoBrand,
        this.sunroof,
        this.toolKit,
        this.acBlowerGrill,
        this.acCompressor,
        this.acCondensor,
        this.acFilterDamaged,
        this.acWorking,
        this.airCooling,
        this.climateControl,
        this.heater,
        this.engineStar,
        this.exteriorStar,
        this.testDriveStar,
        this.dashboardImage,
        this.frontSeatImage,
        this.handbreakImage,
        this.odometerImage,
        this.powerWindowDriverImage,
        this.pushWindowDriverImage,
        this.rearSeatImage,
        this.electricalStar,
        this.cngKitImage,
        this.stereoImage,
        this.interiorAndElectricalStar});

  AllCarInfo.fromJson(Map<String, dynamic> json) {
    engineCylinder = json['engineCylinder'];
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    battery = json['battery'].cast<String>();
    blowBy = json['blowBy'].cast<String>();
    clutch = json['clutch'].cast<String>();
    engineComment = json['engineComment'];
    engineCompartment = json['engineCompartment'] != null
        ? new Front.fromJson(json['engineCompartment'])
        : null;
    engineCondition = json['engineCondition'].cast<String>();
    engineOil = json['engineOil'].cast<String>();
    engineSound = json['engineSound'];
    engineTappetVideo = json['engineTappetVideo'] != null
        ? new EngineTappetVideo.fromJson(json['engineTappetVideo'])
        : null;
    exhaustSmoke = json['exhaustSmoke'];
    gearBox = json['gearBox'].cast<String>();
    radiator = json['radiator'];
    silencer = json['silencer'];
    compression = json['compression'];
    coolant = json['coolant'];
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'].cast<String>();
    startVideo = json['startVideo'] != null
        ? new Front.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    summary = json['summary'];
    sump = json['sump'].cast<String>();
    turboCharger = json['turboCharger'].cast<String>();
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
    apronLeft = json['apronLeft'] != null
        ? new Front.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? new Front.fromJson(json['apronRight'])
        : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? new Front.fromJson(json['bonnetPatti'])
        : null;
    boot = json['boot'] != null ? new Front.fromJson(json['boot']) : null;
    bumperFront = json['bumperFront'] != null
        ? new Front.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? new Front.fromJson(json['bumperRear'])
        : null;
    chassisExtension = json['chassisExtension'] != null
        ? new Front.fromJson(json['chassisExtension'])
        : null;
    dickyDoor = json['dickyDoor'] != null
        ? new Front.fromJson(json['dickyDoor'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? new Front.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? new Front.fromJson(json['doorFrontRight'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? new Front.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? new Front.fromJson(json['doorGlassRight'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? new Front.fromJson(json['doorRearLeft'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? new Front.fromJson(json['doorRearRight'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? new Front.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? new Front.fromJson(json['fenderRight'])
        : null;
    firewall =
    json['firewall'] != null ? new Front.fromJson(json['firewall']) : null;
    fogLightLeft = json['fogLightLeft'] != null
        ? new Front.fromJson(json['fogLightLeft'])
        : null;
    fogLightRight = json['fogLightRight'] != null
        ? new Front.fromJson(json['fogLightRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? new Front.fromJson(json['frontTyreLeft'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? new Front.fromJson(json['frontTyreRight'])
        : null;
    frontWindShield = json['frontWindShield'] != null
        ? new Front.fromJson(json['frontWindShield'])
        : null;
    fuelLid =
    json['fuelLid'] != null ? new Front.fromJson(json['fuelLid']) : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    grill = json['grill'] != null ? new Front.fromJson(json['grill']) : null;
    headLightLeft = json['headLightLeft'] != null
        ? new Front.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? new Front.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? new Front.fromJson(json['headLightSupport'])
        : null;
    jackAndTool = json['jackAndTool'];
    leftApillar = json['leftApillar'] != null
        ? new Front.fromJson(json['leftApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? new Front.fromJson(json['leftBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? new Front.fromJson(json['leftCpillar'])
        : null;
    leftImage = json['leftImage'] != null
        ? new Front.fromJson(json['leftImage'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? new Front.fromJson(json['lowerCrossMember'])
        : null;
    missingParts = json['missingParts'];
    quarterGlass = json['quarterGlass'] != null
        ? new Front.fromJson(json['quarterGlass'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? new Front.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? new Front.fromJson(json['quarterPanelRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? new Front.fromJson(json['rearTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? new Front.fromJson(json['rearTyreRight'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? new Front.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? new Front.fromJson(json['rearViewMirrorRight'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? new Front.fromJson(json['rearWindShield'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? new Front.fromJson(json['rearWiper'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? new Front.fromJson(json['rightApillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? new Front.fromJson(json['rightBpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? new Front.fromJson(json['rightCpillar'])
        : null;
    rightImage = json['rightImage'] != null
        ? new Front.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? new Front.fromJson(json['roof']) : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? new Front.fromJson(json['runnningBorderLeft'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? new Front.fromJson(json['runnningBorderRight'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? new Front.fromJson(json['spareWheel'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? new Front.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? new Front.fromJson(json['tailLightRight'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? new Front.fromJson(json['upperCrossMember'])
        : null;
    cowlTop =
    json['cowlTop'] != null ? new Front.fromJson(json['cowlTop']) : null;
    evaluationStatusForInterior = json['evaluationStatusForInterior'];
    transmission = json['transmission'];
    evaluationStatusForTestDrive = json['evaluationStatusForTestDrive'];
    evaluationStatusForFeature = json['evaluationStatusForFeature'];
    evaluationStatusForAc = json['evaluationStatusForAc'];
    carCondition = json['carCondition'];
    specialComments = json['specialComments'];
    carElectrical = json['carElectrical'].cast<String>();
    clusterPanel = json['clusterPanel'].cast<String>();
    combitionSwitch = json['combitionSwitch'];
    dashboardCondition = json['dashboardCondition'];
    dashboardSwitch = json['dashboardSwitch'];
    handBreak = json['handBreak'].cast<String>();
    interiorStar = json['interiorStar'];
    interiorView = json['interiorView'] != null
        ? new Front.fromJson(json['interiorView'])
        : null;
    key = json['key'];
    platform = json['platform'].cast<String>();
    powerWindowCentalLock = json['powerWindowCentalLock'].cast<String>();
    pushButton = json['pushButton'];
    rearViewMirror = json['rearViewMirror'].cast<String>();
    secondKey = json['secondKey'];
    warningDetails = json['warningDetails'];
    brakes = json['brakes'];
    clutchSystem = json['clutchSystem'];
    cruiseControl = json['cruiseControl'];
    seatAdjustment = json['seatAdjustment'];
    shocker = json['shocker'];
    steeringAdjustment = json['steeringAdjustment'];
    steeringMountedAudioControl = json['steeringMountedAudioControl'];
    steeringSystem = json['steeringSystem'];
    steeringWheel = json['steeringWheel'].cast<String>();
    suspension = json['suspension'].cast<String>();
    transmissionAutomatic = json['transmissionAutomatic'].cast<String>();
    transmissionManual = json['transmissionManual'];
    vehicleHorn = json['vehicleHorn'].cast<String>();
    absEbd = json['absEbd'].cast<String>();
    airbag = json['airbag'].cast<String>();
    alloyWheels = json['alloyWheels'].cast<String>();
    anyInteriorModifications = json['anyInteriorModifications'];
    fogLamps = json['fogLamps'];
    gloveBox = json['gloveBox'].cast<String>();
    gpsNavigation = json['gpsNavigation'];
    keylessEntry = json['keylessEntry'].cast<String>();
    rearDefogger = json['rearDefogger'];
    rearParkingSensor = json['rearParkingSensor'];
    remoteCentalLock = json['remoteCentalLock'];
    seatBelt = json['seatBelt'];
    stereoBrand = json['stereoBrand'];
    sunroof = json['sunroof'].cast<String>();
    toolKit = json['toolKit'];
    acBlowerGrill = json['acBlowerGrill'];
    acCompressor = json['acCompressor'];
    acCondensor = json['acCondensor'].cast<String>();
    acFilterDamaged = json['acFilterDamaged'];
    acWorking = json['acWorking'];
    airCooling = json['airCooling'].cast<String>();
    climateControl = json['climateControl'];
    heater = json['heater'];
    engineStar = json['engineStar'];
    exteriorStar = json['exteriorStar'];
    testDriveStar = json['testDriveStar'];
    dashboardImage = json['dashboardImage'] != null
        ? new Front.fromJson(json['dashboardImage'])
        : null;
    frontSeatImage = json['frontSeatImage'] != null
        ? new Front.fromJson(json['frontSeatImage'])
        : null;
    handbreakImage = json['handbreakImage'] != null
        ? new EngineTappetVideo.fromJson(json['handbreakImage'])
        : null;
    odometerImage = json['odometerImage'] != null
        ? new EngineTappetVideo.fromJson(json['odometerImage'])
        : null;
    powerWindowDriverImage = json['powerWindowDriverImage'] != null
        ? new Front.fromJson(json['powerWindowDriverImage'])
        : null;
    pushWindowDriverImage = json['pushWindowDriverImage'] != null
        ? new Front.fromJson(json['pushWindowDriverImage'])
        : null;
    rearSeatImage = json['rearSeatImage'] != null
        ? new Front.fromJson(json['rearSeatImage'])
        : null;
    electricalStar = json['electricalStar'];
    cngKitImage = json['cngKitImage'] != null
        ? new Front.fromJson(json['cngKitImage'])
        : null;
    stereoImage = json['stereoImage'] != null
        ? new Front.fromJson(json['stereoImage'])
        : null;
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['engineCylinder'] = this.engineCylinder;
    data['evaluationStatusForEngine'] = this.evaluationStatusForEngine;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['battery'] = this.battery;
    data['blowBy'] = this.blowBy;
    data['clutch'] = this.clutch;
    data['engineComment'] = this.engineComment;
    if (this.engineCompartment != null) {
      data['engineCompartment'] = this.engineCompartment!.toJson();
    }
    data['engineCondition'] = this.engineCondition;
    data['engineOil'] = this.engineOil;
    data['engineSound'] = this.engineSound;
    if (this.engineTappetVideo != null) {
      data['engineTappetVideo'] = this.engineTappetVideo!.toJson();
    }
    data['exhaustSmoke'] = this.exhaustSmoke;
    data['gearBox'] = this.gearBox;
    data['radiator'] = this.radiator;
    data['silencer'] = this.silencer;
    data['compression'] = this.compression;
    data['coolant'] = this.coolant;
    data['gearBoxLeakage'] = this.gearBoxLeakage;
    data['mount'] = this.mount;
    if (this.startVideo != null) {
      data['startVideo'] = this.startVideo!.toJson();
    }
    data['startingMotor'] = this.startingMotor;
    data['summary'] = this.summary;
    data['sump'] = this.sump;
    data['turboCharger'] = this.turboCharger;
    data['evaluationStatusForExterior'] = this.evaluationStatusForExterior;
    if (this.apronLeft != null) {
      data['apronLeft'] = this.apronLeft!.toJson();
    }
    if (this.apronRight != null) {
      data['apronRight'] = this.apronRight!.toJson();
    }
    if (this.bonnetPatti != null) {
      data['bonnetPatti'] = this.bonnetPatti!.toJson();
    }
    if (this.boot != null) {
      data['boot'] = this.boot!.toJson();
    }
    if (this.bumperFront != null) {
      data['bumperFront'] = this.bumperFront!.toJson();
    }
    if (this.bumperRear != null) {
      data['bumperRear'] = this.bumperRear!.toJson();
    }
    if (this.chassisExtension != null) {
      data['chassisExtension'] = this.chassisExtension!.toJson();
    }
    if (this.dickyDoor != null) {
      data['dickyDoor'] = this.dickyDoor!.toJson();
    }
    if (this.doorFrontLeft != null) {
      data['doorFrontLeft'] = this.doorFrontLeft!.toJson();
    }
    if (this.doorFrontRight != null) {
      data['doorFrontRight'] = this.doorFrontRight!.toJson();
    }
    if (this.doorGlassLeft != null) {
      data['doorGlassLeft'] = this.doorGlassLeft!.toJson();
    }
    if (this.doorGlassRight != null) {
      data['doorGlassRight'] = this.doorGlassRight!.toJson();
    }
    if (this.doorRearLeft != null) {
      data['doorRearLeft'] = this.doorRearLeft!.toJson();
    }
    if (this.doorRearRight != null) {
      data['doorRearRight'] = this.doorRearRight!.toJson();
    }
    if (this.fenderLeft != null) {
      data['fenderLeft'] = this.fenderLeft!.toJson();
    }
    if (this.fenderRight != null) {
      data['fenderRight'] = this.fenderRight!.toJson();
    }
    if (this.firewall != null) {
      data['firewall'] = this.firewall!.toJson();
    }
    if (this.fogLightLeft != null) {
      data['fogLightLeft'] = this.fogLightLeft!.toJson();
    }
    if (this.fogLightRight != null) {
      data['fogLightRight'] = this.fogLightRight!.toJson();
    }
    if (this.frontTyreLeft != null) {
      data['frontTyreLeft'] = this.frontTyreLeft!.toJson();
    }
    if (this.frontTyreRight != null) {
      data['frontTyreRight'] = this.frontTyreRight!.toJson();
    }
    if (this.frontWindShield != null) {
      data['frontWindShield'] = this.frontWindShield!.toJson();
    }
    if (this.fuelLid != null) {
      data['fuelLid'] = this.fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = this.fullBodyRepaint;
    if (this.grill != null) {
      data['grill'] = this.grill!.toJson();
    }
    if (this.headLightLeft != null) {
      data['headLightLeft'] = this.headLightLeft!.toJson();
    }
    if (this.headLightRight != null) {
      data['headLightRight'] = this.headLightRight!.toJson();
    }
    if (this.headLightSupport != null) {
      data['headLightSupport'] = this.headLightSupport!.toJson();
    }
    data['jackAndTool'] = this.jackAndTool;
    if (this.leftApillar != null) {
      data['leftApillar'] = this.leftApillar!.toJson();
    }
    if (this.leftBpillar != null) {
      data['leftBpillar'] = this.leftBpillar!.toJson();
    }
    if (this.leftCpillar != null) {
      data['leftCpillar'] = this.leftCpillar!.toJson();
    }
    if (this.leftImage != null) {
      data['leftImage'] = this.leftImage!.toJson();
    }
    if (this.lowerCrossMember != null) {
      data['lowerCrossMember'] = this.lowerCrossMember!.toJson();
    }
    data['missingParts'] = this.missingParts;
    if (this.quarterGlass != null) {
      data['quarterGlass'] = this.quarterGlass!.toJson();
    }
    if (this.quarterPanelLeft != null) {
      data['quarterPanelLeft'] = this.quarterPanelLeft!.toJson();
    }
    if (this.quarterPanelRight != null) {
      data['quarterPanelRight'] = this.quarterPanelRight!.toJson();
    }
    if (this.rearTyreLeft != null) {
      data['rearTyreLeft'] = this.rearTyreLeft!.toJson();
    }
    if (this.rearTyreRight != null) {
      data['rearTyreRight'] = this.rearTyreRight!.toJson();
    }
    if (this.rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = this.rearViewMirrorLeft!.toJson();
    }
    if (this.rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = this.rearViewMirrorRight!.toJson();
    }
    if (this.rearWindShield != null) {
      data['rearWindShield'] = this.rearWindShield!.toJson();
    }
    if (this.rearWiper != null) {
      data['rearWiper'] = this.rearWiper!.toJson();
    }
    if (this.rightApillar != null) {
      data['rightApillar'] = this.rightApillar!.toJson();
    }
    if (this.rightBpillar != null) {
      data['rightBpillar'] = this.rightBpillar!.toJson();
    }
    if (this.rightCpillar != null) {
      data['rightCpillar'] = this.rightCpillar!.toJson();
    }
    if (this.rightImage != null) {
      data['rightImage'] = this.rightImage!.toJson();
    }
    if (this.roof != null) {
      data['roof'] = this.roof!.toJson();
    }
    if (this.runnningBorderLeft != null) {
      data['runnningBorderLeft'] = this.runnningBorderLeft!.toJson();
    }
    if (this.runnningBorderRight != null) {
      data['runnningBorderRight'] = this.runnningBorderRight!.toJson();
    }
    if (this.spareWheel != null) {
      data['spareWheel'] = this.spareWheel!.toJson();
    }
    if (this.tailLightLeft != null) {
      data['tailLightLeft'] = this.tailLightLeft!.toJson();
    }
    if (this.tailLightRight != null) {
      data['tailLightRight'] = this.tailLightRight!.toJson();
    }
    if (this.upperCrossMember != null) {
      data['upperCrossMember'] = this.upperCrossMember!.toJson();
    }
    if (this.cowlTop != null) {
      data['cowlTop'] = this.cowlTop!.toJson();
    }
    data['evaluationStatusForInterior'] = this.evaluationStatusForInterior;
    data['transmission'] = this.transmission;
    data['evaluationStatusForTestDrive'] = this.evaluationStatusForTestDrive;
    data['evaluationStatusForFeature'] = this.evaluationStatusForFeature;
    data['evaluationStatusForAc'] = this.evaluationStatusForAc;
    data['carCondition'] = this.carCondition;
    data['specialComments'] = this.specialComments;
    data['carElectrical'] = this.carElectrical;
    data['clusterPanel'] = this.clusterPanel;
    data['combitionSwitch'] = this.combitionSwitch;
    data['dashboardCondition'] = this.dashboardCondition;
    data['dashboardSwitch'] = this.dashboardSwitch;
    data['handBreak'] = this.handBreak;
    data['interiorStar'] = this.interiorStar;
    if (this.interiorView != null) {
      data['interiorView'] = this.interiorView!.toJson();
    }
    data['key'] = this.key;
    data['platform'] = this.platform;
    data['powerWindowCentalLock'] = this.powerWindowCentalLock;
    data['pushButton'] = this.pushButton;
    data['rearViewMirror'] = this.rearViewMirror;
    data['secondKey'] = this.secondKey;
    data['warningDetails'] = this.warningDetails;
    data['brakes'] = this.brakes;
    data['clutchSystem'] = this.clutchSystem;
    data['cruiseControl'] = this.cruiseControl;
    data['seatAdjustment'] = this.seatAdjustment;
    data['shocker'] = this.shocker;
    data['steeringAdjustment'] = this.steeringAdjustment;
    data['steeringMountedAudioControl'] = this.steeringMountedAudioControl;
    data['steeringSystem'] = this.steeringSystem;
    data['steeringWheel'] = this.steeringWheel;
    data['suspension'] = this.suspension;
    data['transmissionAutomatic'] = this.transmissionAutomatic;
    data['transmissionManual'] = this.transmissionManual;
    data['vehicleHorn'] = this.vehicleHorn;
    data['absEbd'] = this.absEbd;
    data['airbag'] = this.airbag;
    data['alloyWheels'] = this.alloyWheels;
    data['anyInteriorModifications'] = this.anyInteriorModifications;
    data['fogLamps'] = this.fogLamps;
    data['gloveBox'] = this.gloveBox;
    data['gpsNavigation'] = this.gpsNavigation;
    data['keylessEntry'] = this.keylessEntry;
    data['rearDefogger'] = this.rearDefogger;
    data['rearParkingSensor'] = this.rearParkingSensor;
    data['remoteCentalLock'] = this.remoteCentalLock;
    data['seatBelt'] = this.seatBelt;
    data['stereoBrand'] = this.stereoBrand;
    data['sunroof'] = this.sunroof;
    data['toolKit'] = this.toolKit;
    data['acBlowerGrill'] = this.acBlowerGrill;
    data['acCompressor'] = this.acCompressor;
    data['acCondensor'] = this.acCondensor;
    data['acFilterDamaged'] = this.acFilterDamaged;
    data['acWorking'] = this.acWorking;
    data['airCooling'] = this.airCooling;
    data['climateControl'] = this.climateControl;
    data['heater'] = this.heater;
    data['engineStar'] = this.engineStar;
    data['exteriorStar'] = this.exteriorStar;
    data['testDriveStar'] = this.testDriveStar;
    if (this.dashboardImage != null) {
      data['dashboardImage'] = this.dashboardImage!.toJson();
    }
    if (this.frontSeatImage != null) {
      data['frontSeatImage'] = this.frontSeatImage!.toJson();
    }
    if (this.handbreakImage != null) {
      data['handbreakImage'] = this.handbreakImage!.toJson();
    }
    if (this.odometerImage != null) {
      data['odometerImage'] = this.odometerImage!.toJson();
    }
    if (this.powerWindowDriverImage != null) {
      data['powerWindowDriverImage'] = this.powerWindowDriverImage!.toJson();
    }
    if (this.pushWindowDriverImage != null) {
      data['pushWindowDriverImage'] = this.pushWindowDriverImage!.toJson();
    }
    if (this.rearSeatImage != null) {
      data['rearSeatImage'] = this.rearSeatImage!.toJson();
    }
    data['electricalStar'] = this.electricalStar;
    if (this.cngKitImage != null) {
      data['cngKitImage'] = this.cngKitImage!.toJson();
    }
    if (this.stereoImage != null) {
      data['stereoImage'] = this.stereoImage!.toJson();
    }
    data['interiorAndElectricalStar'] = this.interiorAndElectricalStar;
    return data;
  }
}

class EngineTappetVideo {
  String? name;
  String? url;
  String? remarks;

  EngineTappetVideo({this.name, this.url, this.remarks});

  EngineTappetVideo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['remarks'] = this.remarks;
    return data;
  }
}

class Meta {
  String? access;
  String? refresh;

  Meta({this.access, this.refresh});

  Meta.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = this.access;
    data['refresh'] = this.refresh;
    return data;
  }
}
