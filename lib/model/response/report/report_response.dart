class ReportResponse {
  String? status;
  String? message;
  Data? data;
  Meta? meta;

  ReportResponse({this.status, this.message, this.data, this.meta});

  ReportResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
        ? AllCarInfo.fromJson(json['allCarInfo'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['make'] = make;
    data['model'] = model;
    data['vehicleLocation'] = vehicleLocation;
    data['ownershipNumber'] = ownershipNumber;
    data['fuelType'] = fuelType;
    if (allCarInfo != null) {
      data['allCarInfo'] = allCarInfo!.toJson();
    }
    data['chasisNumber'] = chasisNumber;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['regDate'] = regDate;
    data['bodyType'] = bodyType;
    data['color'] = color;
    data['odometerReading'] = odometerReading;
    data['rcAvailability'] = rcAvailability;
    data['insurance'] = insurance;
    data['form35'] = form35;
    data['transmissionAutomatic'] = transmissionAutomatic;
    data['transmissionManual'] = transmissionManual;
    data['specialComments'] = specialComments;
    data['regNumber'] = regNumber;
    data['customerPrice'] = customerPrice;
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
        ? EngineCompartment.fromJson(json['engineCompartment'])
        : null;
    engineCondition = json['engineCondition'];
    engineOil = json['engineOil'];
    engineSound = json['engineSound'];
    engineTappetVideo = json['engineTappetVideo'] != null
        ? EngineCompartment.fromJson(json['engineTappetVideo'])
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
        ? EngineCompartment.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    summary = json['summary'];
    sump = json['sump'];
    turboCharger = json['turboCharger'];
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
    apronLeft = json['apronLeft'] != null
        ? ApronLeft.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? ApronLeft.fromJson(json['apronRight'])
        : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? ApronLeft.fromJson(json['bonnetPatti'])
        : null;
    boot = json['boot'] != null ? ApronLeft.fromJson(json['boot']) : null;
    bumperFront = json['bumperFront'] != null
        ? ApronLeft.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? ApronLeft.fromJson(json['bumperRear'])
        : null;
    chassisExtension = json['chassisExtension'] != null
        ? ApronLeft.fromJson(json['chassisExtension'])
        : null;
    dickyDoor = json['dickyDoor'] != null
        ? ApronLeft.fromJson(json['dickyDoor'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? ApronLeft.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? ApronLeft.fromJson(json['doorFrontRight'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? ApronLeft.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? ApronLeft.fromJson(json['doorGlassRight'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? ApronLeft.fromJson(json['doorRearLeft'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? ApronLeft.fromJson(json['doorRearRight'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? ApronLeft.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? ApronLeft.fromJson(json['fenderRight'])
        : null;
    firewall = json['firewall'] != null
        ? ApronLeft.fromJson(json['firewall'])
        : null;
    fogLightLeft = json['fogLightLeft'] != null
        ? ApronLeft.fromJson(json['fogLightLeft'])
        : null;
    fogLightRight = json['fogLightRight'] != null
        ? ApronLeft.fromJson(json['fogLightRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? ApronLeft.fromJson(json['frontTyreLeft'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? ApronLeft.fromJson(json['frontTyreRight'])
        : null;
    frontWindShield = json['frontWindShield'] != null
        ? ApronLeft.fromJson(json['frontWindShield'])
        : null;
    fuelLid = json['fuelLid'] != null
        ? ApronLeft.fromJson(json['fuelLid'])
        : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    grill =
    json['grill'] != null ? ApronLeft.fromJson(json['grill']) : null;
    headLightLeft = json['headLightLeft'] != null
        ? ApronLeft.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? ApronLeft.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? ApronLeft.fromJson(json['headLightSupport'])
        : null;
    jackAndTool = json['jackAndTool'];
    leftApillar = json['leftApillar'] != null
        ? ApronLeft.fromJson(json['leftApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? ApronLeft.fromJson(json['leftBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? ApronLeft.fromJson(json['leftCpillar'])
        : null;
    leftImage = json['leftImage'] != null
        ? ApronLeft.fromJson(json['leftImage'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? ApronLeft.fromJson(json['lowerCrossMember'])
        : null;
    missingParts = json['missingParts'];
    quarterGlass = json['quarterGlass'] != null
        ? ApronLeft.fromJson(json['quarterGlass'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? ApronLeft.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? ApronLeft.fromJson(json['quarterPanelRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? ApronLeft.fromJson(json['rearTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? ApronLeft.fromJson(json['rearTyreRight'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? ApronLeft.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? ApronLeft.fromJson(json['rearViewMirrorRight'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? ApronLeft.fromJson(json['rearWindShield'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? ApronLeft.fromJson(json['rearWiper'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? ApronLeft.fromJson(json['rightApillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? ApronLeft.fromJson(json['rightBpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? ApronLeft.fromJson(json['rightCpillar'])
        : null;
    rightImage = json['rightImage'] != null
        ? ApronLeft.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? ApronLeft.fromJson(json['roof']) : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? ApronLeft.fromJson(json['runnningBorderLeft'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? ApronLeft.fromJson(json['runnningBorderRight'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? ApronLeft.fromJson(json['spareWheel'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? ApronLeft.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? ApronLeft.fromJson(json['tailLightRight'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? ApronLeft.fromJson(json['upperCrossMember'])
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
        ? EngineCompartment.fromJson(json['dashboardImage'])
        : null;
    frontSeatImage = json['frontSeatImage'] != null
        ? EngineCompartment.fromJson(json['frontSeatImage'])
        : null;
    handbreakImage = json['handbreakImage'] != null
        ? EngineCompartment.fromJson(json['handbreakImage'])
        : null;
    odometerImage = json['odometerImage'] != null
        ? EngineCompartment.fromJson(json['odometerImage'])
        : null;
    powerWindowDriverImage = json['powerWindowDriverImage'] != null
        ? EngineCompartment.fromJson(json['powerWindowDriverImage'])
        : null;
    pushWindowDriverImage = json['pushWindowDriverImage'] != null
        ? EngineCompartment.fromJson(json['pushWindowDriverImage'])
        : null;
    rearSeatImage = json['rearSeatImage'] != null
        ? EngineCompartment.fromJson(json['rearSeatImage'])
        : null;
    electricalStar = json['electricalStar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['engineCylinder'] = engineCylinder;
    data['evaluationStatusForEngine'] = evaluationStatusForEngine;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['battery'] = battery;
    data['blowBy'] = blowBy;
    data['clutch'] = clutch;
    data['engineComment'] = engineComment;
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    data['engineCondition'] = engineCondition;
    data['engineOil'] = engineOil;
    data['engineSound'] = engineSound;
    if (engineTappetVideo != null) {
      data['engineTappetVideo'] = engineTappetVideo!.toJson();
    }
    data['exhaustSmoke'] = exhaustSmoke;
    data['gearBox'] = gearBox;
    data['radiator'] = radiator;
    data['silencer'] = silencer;
    data['compression'] = compression;
    data['coolant'] = coolant;
    data['gearBoxLeakage'] = gearBoxLeakage;
    data['mount'] = mount;
    if (startVideo != null) {
      data['startVideo'] = startVideo!.toJson();
    }
    data['startingMotor'] = startingMotor;
    data['summary'] = summary;
    data['sump'] = sump;
    data['turboCharger'] = turboCharger;
    data['evaluationStatusForExterior'] = evaluationStatusForExterior;
    if (apronLeft != null) {
      data['apronLeft'] = apronLeft!.toJson();
    }
    if (apronRight != null) {
      data['apronRight'] = apronRight!.toJson();
    }
    if (bonnetPatti != null) {
      data['bonnetPatti'] = bonnetPatti!.toJson();
    }
    if (boot != null) {
      data['boot'] = boot!.toJson();
    }
    if (bumperFront != null) {
      data['bumperFront'] = bumperFront!.toJson();
    }
    if (bumperRear != null) {
      data['bumperRear'] = bumperRear!.toJson();
    }
    if (chassisExtension != null) {
      data['chassisExtension'] = chassisExtension!.toJson();
    }
    if (dickyDoor != null) {
      data['dickyDoor'] = dickyDoor!.toJson();
    }
    if (doorFrontLeft != null) {
      data['doorFrontLeft'] = doorFrontLeft!.toJson();
    }
    if (doorFrontRight != null) {
      data['doorFrontRight'] = doorFrontRight!.toJson();
    }
    if (doorGlassLeft != null) {
      data['doorGlassLeft'] = doorGlassLeft!.toJson();
    }
    if (doorGlassRight != null) {
      data['doorGlassRight'] = doorGlassRight!.toJson();
    }
    if (doorRearLeft != null) {
      data['doorRearLeft'] = doorRearLeft!.toJson();
    }
    if (doorRearRight != null) {
      data['doorRearRight'] = doorRearRight!.toJson();
    }
    if (fenderLeft != null) {
      data['fenderLeft'] = fenderLeft!.toJson();
    }
    if (fenderRight != null) {
      data['fenderRight'] = fenderRight!.toJson();
    }
    if (firewall != null) {
      data['firewall'] = firewall!.toJson();
    }
    if (fogLightLeft != null) {
      data['fogLightLeft'] = fogLightLeft!.toJson();
    }
    if (fogLightRight != null) {
      data['fogLightRight'] = fogLightRight!.toJson();
    }
    if (frontTyreLeft != null) {
      data['frontTyreLeft'] = frontTyreLeft!.toJson();
    }
    if (frontTyreRight != null) {
      data['frontTyreRight'] = frontTyreRight!.toJson();
    }
    if (frontWindShield != null) {
      data['frontWindShield'] = frontWindShield!.toJson();
    }
    if (fuelLid != null) {
      data['fuelLid'] = fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = fullBodyRepaint;
    if (grill != null) {
      data['grill'] = grill!.toJson();
    }
    if (headLightLeft != null) {
      data['headLightLeft'] = headLightLeft!.toJson();
    }
    if (headLightRight != null) {
      data['headLightRight'] = headLightRight!.toJson();
    }
    if (headLightSupport != null) {
      data['headLightSupport'] = headLightSupport!.toJson();
    }
    data['jackAndTool'] = jackAndTool;
    if (leftApillar != null) {
      data['leftApillar'] = leftApillar!.toJson();
    }
    if (leftBpillar != null) {
      data['leftBpillar'] = leftBpillar!.toJson();
    }
    if (leftCpillar != null) {
      data['leftCpillar'] = leftCpillar!.toJson();
    }
    if (leftImage != null) {
      data['leftImage'] = leftImage!.toJson();
    }
    if (lowerCrossMember != null) {
      data['lowerCrossMember'] = lowerCrossMember!.toJson();
    }
    data['missingParts'] = missingParts;
    if (quarterGlass != null) {
      data['quarterGlass'] = quarterGlass!.toJson();
    }
    if (quarterPanelLeft != null) {
      data['quarterPanelLeft'] = quarterPanelLeft!.toJson();
    }
    if (quarterPanelRight != null) {
      data['quarterPanelRight'] = quarterPanelRight!.toJson();
    }
    if (rearTyreLeft != null) {
      data['rearTyreLeft'] = rearTyreLeft!.toJson();
    }
    if (rearTyreRight != null) {
      data['rearTyreRight'] = rearTyreRight!.toJson();
    }
    if (rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = rearViewMirrorLeft!.toJson();
    }
    if (rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = rearViewMirrorRight!.toJson();
    }
    if (rearWindShield != null) {
      data['rearWindShield'] = rearWindShield!.toJson();
    }
    if (rearWiper != null) {
      data['rearWiper'] = rearWiper!.toJson();
    }
    if (rightApillar != null) {
      data['rightApillar'] = rightApillar!.toJson();
    }
    if (rightBpillar != null) {
      data['rightBpillar'] = rightBpillar!.toJson();
    }
    if (rightCpillar != null) {
      data['rightCpillar'] = rightCpillar!.toJson();
    }
    if (rightImage != null) {
      data['rightImage'] = rightImage!.toJson();
    }
    if (roof != null) {
      data['roof'] = roof!.toJson();
    }
    if (runnningBorderLeft != null) {
      data['runnningBorderLeft'] = runnningBorderLeft!.toJson();
    }
    if (runnningBorderRight != null) {
      data['runnningBorderRight'] = runnningBorderRight!.toJson();
    }
    if (spareWheel != null) {
      data['spareWheel'] = spareWheel!.toJson();
    }
    if (tailLightLeft != null) {
      data['tailLightLeft'] = tailLightLeft!.toJson();
    }
    if (tailLightRight != null) {
      data['tailLightRight'] = tailLightRight!.toJson();
    }
    if (upperCrossMember != null) {
      data['upperCrossMember'] = upperCrossMember!.toJson();
    }
    data['evaluationStatusForInterior'] = evaluationStatusForInterior;
    data['transmission'] = transmission;
    data['evaluationStatusForTestDrive'] = evaluationStatusForTestDrive;
    data['evaluationStatusForFeature'] = evaluationStatusForFeature;
    data['evaluationStatusForAc'] = evaluationStatusForAc;
    data['carCondition'] = carCondition;
    data['specialComments'] = specialComments;
    data['carElectrical'] = carElectrical;
    data['clusterPanel'] = clusterPanel;
    data['combitionSwitch'] = combitionSwitch;
    data['dashboardCondition'] = dashboardCondition;
    data['dashboardSwitch'] = dashboardSwitch;
    data['handBreak'] = handBreak;
    data['interiorStar'] = interiorStar;
    data['interiorView'] = interiorView;
    data['key'] = key;
    data['platform'] = platform;
    data['powerWindowCentalLock'] = powerWindowCentalLock;
    data['pushButton'] = pushButton;
    data['rearViewMirror'] = rearViewMirror;
    data['secondKey'] = secondKey;
    data['warningDetails'] = warningDetails;
    data['brakes'] = brakes;
    data['clutchSystem'] = clutchSystem;
    data['cruiseControl'] = cruiseControl;
    data['seatAdjustment'] = seatAdjustment;
    data['shocker'] = shocker;
    data['steeringAdjustment'] = steeringAdjustment;
    data['steeringMountedAudioControl'] = steeringMountedAudioControl;
    data['steeringSystem'] = steeringSystem;
    data['steeringWheel'] = steeringWheel;
    data['suspension'] = suspension;
    data['transmissionAutomatic'] = transmissionAutomatic;
    data['transmissionManual'] = transmissionManual;
    data['vehicleHorn'] = vehicleHorn;
    data['absEbd'] = absEbd;
    data['airbag'] = airbag;
    data['alloyWheels'] = alloyWheels;
    data['anyInteriorModifications'] = anyInteriorModifications;
    data['fogLamps'] = fogLamps;
    data['gloveBox'] = gloveBox;
    data['gpsNavigation'] = gpsNavigation;
    data['keylessEntry'] = keylessEntry;
    data['rearDefogger'] = rearDefogger;
    data['rearParkingSensor'] = rearParkingSensor;
    data['remoteCentalLock'] = remoteCentalLock;
    data['seatBelt'] = seatBelt;
    data['stereoBrand'] = stereoBrand;
    data['sunroof'] = sunroof;
    data['toolKit'] = toolKit;
    data['acBlowerGrill'] = acBlowerGrill;
    data['acCompressor'] = acCompressor;
    data['acCondensor'] = acCondensor;
    data['acFilterDamaged'] = acFilterDamaged;
    data['acWorking'] = acWorking;
    data['airCooling'] = airCooling;
    data['climateControl'] = climateControl;
    data['heater'] = heater;
    data['engineStar'] = engineStar;
    data['exteriorStar'] = exteriorStar;
    data['testDriveStar'] = testDriveStar;
    if (dashboardImage != null) {
      data['dashboardImage'] = dashboardImage!.toJson();
    }
    if (frontSeatImage != null) {
      data['frontSeatImage'] = frontSeatImage!.toJson();
    }
    if (handbreakImage != null) {
      data['handbreakImage'] = handbreakImage!.toJson();
    }
    if (odometerImage != null) {
      data['odometerImage'] = odometerImage!.toJson();
    }
    if (powerWindowDriverImage != null) {
      data['powerWindowDriverImage'] = powerWindowDriverImage!.toJson();
    }
    if (pushWindowDriverImage != null) {
      data['pushWindowDriverImage'] = pushWindowDriverImage!.toJson();
    }
    if (rearSeatImage != null) {
      data['rearSeatImage'] = rearSeatImage!.toJson();
    }
    data['electricalStar'] = electricalStar;
    return data;
  }
}

class EngineCompartment {
  String? name;
  String? url;
  String? remarks;

  EngineCompartment({this.name, this.url, remarks});

  EngineCompartment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['remarks'] = remarks;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['condition'] = condition;
    data['remarks'] = remarks;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access'] = access;
    data['refresh'] = refresh;
    return data;
  }
}
