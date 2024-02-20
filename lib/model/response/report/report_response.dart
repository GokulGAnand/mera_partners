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
  String? transmissionAutomatic;
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
    transmissionAutomatic = json['transmissionAutomatic'];
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

class AllCarInfo {
  int? engineCylinder;
  String? evaluationStatusForEngine;
  String? createdAt;
  String? updatedAt;
  String? battery;
  String? blowBy;
  String? clutch;
  String? engineComment;
  EngineCompartment? engineCompartment;
  String? engineCondition;
  String? engineOil;
  String? engineSound;
  EngineCompartment? engineTappetVideo;
  String? exhaustSmoke;
  String? gearBox;
  String? radiator;
  String? silencer;
  String? compression;
  String? coolant;
  String? gearBoxLeakage;
  String? mount;
  EngineCompartment? startVideo;
  String? startingMotor;
  String? summary;
  String? sump;
  String? turboCharger;
  String? evaluationStatusForExterior;
  ApronLeft? apronLeft;
  ApronLeft? apronRight;
  ApronLeft? bonnetPatti;
  ApronLeft? boot;
  ApronLeft? bumperFront;
  ApronLeft? bumperRear;
  ApronLeft? chassisExtension;
  ApronLeft? dickyDoor;
  ApronLeft? doorFrontLeft;
  ApronLeft? doorFrontRight;
  ApronLeft? doorGlassLeft;
  ApronLeft? doorGlassRight;
  ApronLeft? doorRearLeft;
  ApronLeft? doorRearRight;
  ApronLeft? fenderLeft;
  ApronLeft? fenderRight;
  ApronLeft? firewall;
  ApronLeft? fogLightLeft;
  ApronLeft? fogLightRight;
  ApronLeft? frontTyreLeft;
  ApronLeft? frontTyreRight;
  ApronLeft? frontWindShield;
  ApronLeft? fuelLid;
  String? fullBodyRepaint;
  ApronLeft? grill;
  ApronLeft? headLightLeft;
  ApronLeft? headLightRight;
  ApronLeft? headLightSupport;
  String? jackAndTool;
  ApronLeft? leftApillar;
  ApronLeft? leftBpillar;
  ApronLeft? leftCpillar;
  ApronLeft? leftImage;
  ApronLeft? lowerCrossMember;
  String? missingParts;
  ApronLeft? quarterGlass;
  ApronLeft? quarterPanelLeft;
  ApronLeft? quarterPanelRight;
  ApronLeft? rearTyreLeft;
  ApronLeft? rearTyreRight;
  ApronLeft? rearViewMirrorLeft;
  ApronLeft? rearViewMirrorRight;
  ApronLeft? rearWindShield;
  ApronLeft? rearWiper;
  ApronLeft? rightApillar;
  ApronLeft? rightBpillar;
  ApronLeft? rightCpillar;
  ApronLeft? rightImage;
  ApronLeft? roof;
  ApronLeft? runnningBorderLeft;
  ApronLeft? runnningBorderRight;
  ApronLeft? spareWheel;
  ApronLeft? tailLightLeft;
  ApronLeft? tailLightRight;
  ApronLeft? upperCrossMember;
  String? evaluationStatusForInterior;
  String? transmission;
  String? evaluationStatusForTestDrive;
  String? evaluationStatusForFeature;
  String? evaluationStatusForAc;
  String? carCondition;
  String? specialComments;
  String? carElectrical;
  String? clusterPanel;
  String? combitionSwitch;
  String? dashboardCondition;
  String? dashboardSwitch;
  String? handBreak;
  num? interiorStar;
  String? interiorView;
  String? key;
  String? platform;
  String? powerWindowCentalLock;
  String? pushButton;
  String? rearViewMirror;
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
  String? steeringWheel;
  String? suspension;
  String? transmissionAutomatic;
  String? transmissionManual;
  String? vehicleHorn;
  String? absEbd;
  String? airbag;
  String? alloyWheels;
  String? anyInteriorModifications;
  String? fogLamps;
  String? gloveBox;
  String? gpsNavigation;
  String? keylessEntry;
  String? rearDefogger;
  String? rearParkingSensor;
  String? remoteCentalLock;
  String? seatBelt;
  String? stereoBrand;
  String? sunroof;
  String? toolKit;
  String? acBlowerGrill;
  String? acCompressor;
  String? acCondensor;
  String? acFilterDamaged;
  String? acWorking;
  String? airCooling;
  String? climateControl;
  String? heater;
  num? engineStar;
  num? exteriorStar;
  num? testDriveStar;
  EngineCompartment? dashboardImage;
  EngineCompartment? frontSeatImage;
  EngineCompartment? handbreakImage;
  EngineCompartment? odometerImage;
  EngineCompartment? powerWindowDriverImage;
  EngineCompartment? pushWindowDriverImage;
  EngineCompartment? rearSeatImage;
  num? electricalStar;

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
        this.electricalStar});

  AllCarInfo.fromJson(Map<String, dynamic> json) {
    engineCylinder = json['engineCylinder'];
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    battery = json['battery'];
    blowBy = json['blowBy'];
    clutch = json['clutch'];
    engineComment = json['engineComment'];
    engineCompartment = json['engineCompartment'] != null
        ? new EngineCompartment.fromJson(json['engineCompartment'])
        : null;
    engineCondition = json['engineCondition'];
    engineOil = json['engineOil'];
    engineSound = json['engineSound'];
    engineTappetVideo = json['engineTappetVideo'] != null
        ? new EngineCompartment.fromJson(json['engineTappetVideo'])
        : null;
    exhaustSmoke = json['exhaustSmoke'];
    gearBox = json['gearBox'];
    radiator = json['radiator'];
    silencer = json['silencer'];
    compression = json['compression'];
    coolant = json['coolant'];
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'];
    startVideo = json['startVideo'] != null
        ? new EngineCompartment.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    summary = json['summary'];
    sump = json['sump'];
    turboCharger = json['turboCharger'];
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
    apronLeft = json['apronLeft'] != null
        ? new ApronLeft.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? new ApronLeft.fromJson(json['apronRight'])
        : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? new ApronLeft.fromJson(json['bonnetPatti'])
        : null;
    boot = json['boot'] != null ? new ApronLeft.fromJson(json['boot']) : null;
    bumperFront = json['bumperFront'] != null
        ? new ApronLeft.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? new ApronLeft.fromJson(json['bumperRear'])
        : null;
    chassisExtension = json['chassisExtension'] != null
        ? new ApronLeft.fromJson(json['chassisExtension'])
        : null;
    dickyDoor = json['dickyDoor'] != null
        ? new ApronLeft.fromJson(json['dickyDoor'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? new ApronLeft.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? new ApronLeft.fromJson(json['doorFrontRight'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? new ApronLeft.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? new ApronLeft.fromJson(json['doorGlassRight'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? new ApronLeft.fromJson(json['doorRearLeft'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? new ApronLeft.fromJson(json['doorRearRight'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? new ApronLeft.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? new ApronLeft.fromJson(json['fenderRight'])
        : null;
    firewall = json['firewall'] != null
        ? new ApronLeft.fromJson(json['firewall'])
        : null;
    fogLightLeft = json['fogLightLeft'] != null
        ? new ApronLeft.fromJson(json['fogLightLeft'])
        : null;
    fogLightRight = json['fogLightRight'] != null
        ? new ApronLeft.fromJson(json['fogLightRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? new ApronLeft.fromJson(json['frontTyreLeft'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? new ApronLeft.fromJson(json['frontTyreRight'])
        : null;
    frontWindShield = json['frontWindShield'] != null
        ? new ApronLeft.fromJson(json['frontWindShield'])
        : null;
    fuelLid = json['fuelLid'] != null
        ? new ApronLeft.fromJson(json['fuelLid'])
        : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    grill =
    json['grill'] != null ? new ApronLeft.fromJson(json['grill']) : null;
    headLightLeft = json['headLightLeft'] != null
        ? new ApronLeft.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? new ApronLeft.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? new ApronLeft.fromJson(json['headLightSupport'])
        : null;
    jackAndTool = json['jackAndTool'];
    leftApillar = json['leftApillar'] != null
        ? new ApronLeft.fromJson(json['leftApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? new ApronLeft.fromJson(json['leftBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? new ApronLeft.fromJson(json['leftCpillar'])
        : null;
    leftImage = json['leftImage'] != null
        ? new ApronLeft.fromJson(json['leftImage'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? new ApronLeft.fromJson(json['lowerCrossMember'])
        : null;
    missingParts = json['missingParts'];
    quarterGlass = json['quarterGlass'] != null
        ? new ApronLeft.fromJson(json['quarterGlass'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? new ApronLeft.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? new ApronLeft.fromJson(json['quarterPanelRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? new ApronLeft.fromJson(json['rearTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? new ApronLeft.fromJson(json['rearTyreRight'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? new ApronLeft.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? new ApronLeft.fromJson(json['rearViewMirrorRight'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? new ApronLeft.fromJson(json['rearWindShield'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? new ApronLeft.fromJson(json['rearWiper'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? new ApronLeft.fromJson(json['rightApillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? new ApronLeft.fromJson(json['rightBpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? new ApronLeft.fromJson(json['rightCpillar'])
        : null;
    rightImage = json['rightImage'] != null
        ? new ApronLeft.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? new ApronLeft.fromJson(json['roof']) : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? new ApronLeft.fromJson(json['runnningBorderLeft'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? new ApronLeft.fromJson(json['runnningBorderRight'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? new ApronLeft.fromJson(json['spareWheel'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? new ApronLeft.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? new ApronLeft.fromJson(json['tailLightRight'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? new ApronLeft.fromJson(json['upperCrossMember'])
        : null;
    evaluationStatusForInterior = json['evaluationStatusForInterior'];
    transmission = json['transmission'];
    evaluationStatusForTestDrive = json['evaluationStatusForTestDrive'];
    evaluationStatusForFeature = json['evaluationStatusForFeature'];
    evaluationStatusForAc = json['evaluationStatusForAc'];
    carCondition = json['carCondition'];
    specialComments = json['specialComments'];
    carElectrical = json['carElectrical'];
    clusterPanel = json['clusterPanel'];
    combitionSwitch = json['combitionSwitch'];
    dashboardCondition = json['dashboardCondition'];
    dashboardSwitch = json['dashboardSwitch'];
    handBreak = json['handBreak'];
    interiorStar = json['interiorStar'];
    interiorView = json['interiorView'];
    key = json['key'];
    platform = json['platform'];
    powerWindowCentalLock = json['powerWindowCentalLock'];
    pushButton = json['pushButton'];
    rearViewMirror = json['rearViewMirror'];
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
    steeringWheel = json['steeringWheel'];
    suspension = json['suspension'];
    transmissionAutomatic = json['transmissionAutomatic'];
    transmissionManual = json['transmissionManual'];
    vehicleHorn = json['vehicleHorn'];
    absEbd = json['absEbd'];
    airbag = json['airbag'];
    alloyWheels = json['alloyWheels'];
    anyInteriorModifications = json['anyInteriorModifications'];
    fogLamps = json['fogLamps'];
    gloveBox = json['gloveBox'];
    gpsNavigation = json['gpsNavigation'];
    keylessEntry = json['keylessEntry'];
    rearDefogger = json['rearDefogger'];
    rearParkingSensor = json['rearParkingSensor'];
    remoteCentalLock = json['remoteCentalLock'];
    seatBelt = json['seatBelt'];
    stereoBrand = json['stereoBrand'];
    sunroof = json['sunroof'];
    toolKit = json['toolKit'];
    acBlowerGrill = json['acBlowerGrill'];
    acCompressor = json['acCompressor'];
    acCondensor = json['acCondensor'];
    acFilterDamaged = json['acFilterDamaged'];
    acWorking = json['acWorking'];
    airCooling = json['airCooling'];
    climateControl = json['climateControl'];
    heater = json['heater'];
    engineStar = json['engineStar'];
    exteriorStar = json['exteriorStar'];
    testDriveStar = json['testDriveStar'];
    dashboardImage = json['dashboardImage'] != null
        ? new EngineCompartment.fromJson(json['dashboardImage'])
        : null;
    frontSeatImage = json['frontSeatImage'] != null
        ? new EngineCompartment.fromJson(json['frontSeatImage'])
        : null;
    handbreakImage = json['handbreakImage'] != null
        ? new EngineCompartment.fromJson(json['handbreakImage'])
        : null;
    odometerImage = json['odometerImage'] != null
        ? new EngineCompartment.fromJson(json['odometerImage'])
        : null;
    powerWindowDriverImage = json['powerWindowDriverImage'] != null
        ? new EngineCompartment.fromJson(json['powerWindowDriverImage'])
        : null;
    pushWindowDriverImage = json['pushWindowDriverImage'] != null
        ? new EngineCompartment.fromJson(json['pushWindowDriverImage'])
        : null;
    rearSeatImage = json['rearSeatImage'] != null
        ? new EngineCompartment.fromJson(json['rearSeatImage'])
        : null;
    electricalStar = json['electricalStar'];
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
    data['interiorView'] = this.interiorView;
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
    return data;
  }
}

class EngineCompartment {
  String? name;
  String? url;
  String? remarks;

  EngineCompartment({this.name, this.url, this.remarks});

  EngineCompartment.fromJson(Map<String, dynamic> json) {
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

class ApronLeft {
  String? name;
  String? url;
  String? condition;
  String? remarks;

  ApronLeft({this.name, this.url, this.condition, this.remarks});

  ApronLeft.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    condition = json['condition'];
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
