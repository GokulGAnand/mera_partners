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
  AllCarInfo? allCarInfo;
  String? evaluatorId;
  String? userId;
  String? evaluatorName;
  String? chasisNumber;
  String? regDate;
  String? bodyType;
  String? color;
  String? rcAvailability;
  String? rcMismatch;
  String? loanNoc;
  String? loanStatus;
  String? ncb;
  String? hypothecation;
  String? regValidity;
  String? engineNumber;
  String? insurance;
  String? form35;
  String? taxValidity;
  String? regState;
  String? rto;
  String? engineCC;
  String? vehicleUsage;
  String? seats;
  String? duplicateKey;
  String? odometerWorking;
  String? accidential;
  String? oemWarrantyRemain;
  num? oemMonthRemain;
  String? oemKmRemain;
  String? regNumber;
  String? customerPrice;
  num? sellerMobileNumber;
  num? rcOwnerMobileNumber;
  String? sellerName;
  String? rcOwnerName;
  String? sellerAddress;
  String? isCarRegistered;

  Data(
      {this.sId,
        this.allCarInfo,
        this.evaluatorId,
        this.userId,
        this.evaluatorName,
        this.chasisNumber,
        this.regDate,
        this.bodyType,
        this.color,
        this.rcAvailability,
        this.rcMismatch,
        this.loanNoc,
        this.loanStatus,
        this.ncb,
        this.hypothecation,
        this.regValidity,
        this.engineNumber,
        this.insurance,
        this.form35,
        this.taxValidity,
        this.regState,
        this.rto,
        this.engineCC,
        this.vehicleUsage,
        this.seats,
        this.duplicateKey,
        this.odometerWorking,
        this.accidential,
        this.oemWarrantyRemain,
        this.oemMonthRemain,
        this.oemKmRemain,
        this.regNumber,
        this.customerPrice,
        this.sellerMobileNumber,
        this.rcOwnerMobileNumber,
        this.sellerName,
        this.rcOwnerName,
        this.sellerAddress,
        this.isCarRegistered});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    allCarInfo = json['allCarInfo'] != null
        ? AllCarInfo.fromJson(json['allCarInfo'])
        : null;
    evaluatorId = json['evaluatorId'];
    userId = json['userId'];
    evaluatorName = json['evaluatorName'];
    chasisNumber = json['chasisNumber'];
    regDate = json['regDate'];
    bodyType = json['bodyType'];
    color = json['color'];
    rcAvailability = json['rcAvailability'];
    rcMismatch = json['rcMismatch'];
    loanNoc = json['loanNoc'];
    loanStatus = json['loanStatus'];
    ncb = json['ncb'];
    hypothecation = json['hypothecation'];
    regValidity = json['regValidity'];
    engineNumber = json['engineNumber'];
    insurance = json['insurance'];
    form35 = json['form35'];
    taxValidity = json['taxValidity'];
    regState = json['regState'];
    rto = json['rto'];
    engineCC = json['engineCC'];
    vehicleUsage = json['vehicleUsage'];
    seats = json['seats'];
    duplicateKey = json['duplicateKey'];
    odometerWorking = json['odometerWorking'];
    accidential = json['accidential'];
    oemWarrantyRemain = json['oemWarrantyRemain'];
    oemMonthRemain = json['oemMonthRemain'];
    oemKmRemain = json['oemKmRemain'];
    regNumber = json['regNumber'];
    customerPrice = json['customerPrice'];
    sellerMobileNumber = json['sellerMobileNumber'];
    rcOwnerMobileNumber = json['rcOwnerMobileNumber'];
    sellerName = json['sellerName'];
    rcOwnerName = json['rcOwnerName'];
    sellerAddress = json['sellerAddress'];
    isCarRegistered = json['isCarRegistered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (allCarInfo != null) {
      data['allCarInfo'] = allCarInfo!.toJson();
    }
    data['evaluatorId'] = evaluatorId;
    data['userId'] = userId;
    data['evaluatorName'] = evaluatorName;
    data['chasisNumber'] = chasisNumber;
    data['regDate'] = regDate;
    data['bodyType'] = bodyType;
    data['color'] = color;
    data['rcAvailability'] = rcAvailability;
    data['rcMismatch'] = rcMismatch;
    data['loanNoc'] = loanNoc;
    data['loanStatus'] = loanStatus;
    data['ncb'] = ncb;
    data['hypothecation'] = hypothecation;
    data['regValidity'] = regValidity;
    data['engineNumber'] = engineNumber;
    data['insurance'] = insurance;
    data['form35'] = form35;
    data['taxValidity'] = taxValidity;
    data['regState'] = regState;
    data['rto'] = rto;
    data['engineCC'] = engineCC;
    data['vehicleUsage'] = vehicleUsage;
    data['seats'] = seats;
    data['duplicateKey'] = duplicateKey;
    data['odometerWorking'] = odometerWorking;
    data['accidential'] = accidential;
    data['oemWarrantyRemain'] = oemWarrantyRemain;
    data['oemMonthRemain'] = oemMonthRemain;
    data['oemKmRemain'] = oemKmRemain;
    data['regNumber'] = regNumber;
    data['customerPrice'] = customerPrice;
    data['sellerMobileNumber'] = sellerMobileNumber;
    data['rcOwnerMobileNumber'] = rcOwnerMobileNumber;
    data['sellerName'] = sellerName;
    data['rcOwnerName'] = rcOwnerName;
    data['sellerAddress'] = sellerAddress;
    data['isCarRegistered'] = isCarRegistered;
    return data;
  }
}

class AllCarInfo {
  num? engineCylinder;
  String? evaluationStatusForEngine;
  Battery? firewall;
  String? dashboardCondition;
  String? createdAt;
  String? updatedAt;
  Battery? battery;
  Battery? blowBy;
  Battery? clutch;
  String? coolant;
  Battery? engine;
  String? engineComment;
  Battery? engineOil;
  String? engineSound;
  String? exhaustSmoke;
  Battery? gearBox;
  String? gearBoxLeakage;
  Battery? mount;
  String? radiator;
  String? silencer;
  Battery? startVideo;
  String? startingMotor;
  Battery? sump;
  Battery? turboCharger;
  String? evaluationStatusForExterior;
  Battery? leftImage;
  Battery? rightImage;
  Battery? roof;
  Battery? frontWindShield;
  Battery? rearWindShield;
  Battery? doorGlassLeft;
  Battery? doorGlassRight;
  Battery? quarterGlass;
  Battery? headLightLeft;
  Battery? headLightRight;
  Battery? headLightSupport;
  Battery? bumperFront;
  Battery? bumperRear;
  Battery? grill;
  Battery? bonnetPatti;
  Battery? upperCrossMember;
  Battery? lowerCrossMember;
  Battery? apronLeft;
  Battery? apronRight;
  Battery? cowlTop;
  Battery? chassisExtension;
  FrontTyreRight? frontTyreRight;
  FrontTyreRight? frontTyreLeft;
  FrontTyreRight? rearTyreRight;
  FrontTyreRight? rearTyreLeft;
  Battery? fenderLeft;
  Battery? fenderRight;
  Battery? quarterPanelLeft;
  Battery? quarterPanelRight;
  Battery? doorFrontLeft;
  Battery? doorFrontRight;
  Battery? doorRearRight;
  Battery? leftApillar;
  Battery? doorRearLeft;
  Battery? rightApillar;
  Battery? leftBpillar;
  Battery? rightBpillar;
  Battery? leftCpillar;
  Battery? rightCpillar;
  Battery? runnningBorderLeft;
  Battery? tailLightLeft;
  Battery? tailLightRight;
  Battery? rearWiper;
  Battery? runnningBorderRight;
  Battery? boot;
  Battery? dickyDoor;
  Battery? spareWheel;
  Battery? rearViewMirrorLeft;
  Battery? rearViewMirrorRight;
  Battery? fuelLid;
  String? fullBodyRepaint;
  String? jackAndTool;
  String? missingParts;
  List<String>? handBreak;
  String? evaluationStatusForInterior;
  List<String>? steeringWheel;
  List<String>? suspension;
  List<String>? transmissionAutomatic;
  List<String>? vehicleHorn;
  String? evaluationStatusForTestDrive;
  String? evaluationStatusForFeature;
  List<String>? airCooling;
  List<String>? acCondensor;
  String? evaluationStatusForAc;
  String? carCondition;
  String? brakes;
  String? clutchSystem;
  String? cruiseControl;
  String? seatAdjustment;
  String? steeringAdjustment;
  String? steeringMountedAudioControl;
  String? steeringSystem;
  String? transmissionManual;
  String? acBlowerGrill;
  String? acFilterDamaged;
  String? acWorking;
  String? climateControl;
  String? heater;
  String? rearDefogger;
  FrontTyreRight? absEbd;
  FrontTyreRight? airbag;
  FrontTyreRight? alloyWheels;
  String? anyInteriorModifications;
  String? fogLamps;
  FrontTyreRight? gloveBox;
  String? gpsNavigation;
  FrontTyreRight? keylessEntry;
  String? rearParkingSensor;
  String? seatBelt;
  String? stereoBrand;
  Battery? stereoImage;
  Sunroof? sunroof;
  Battery? carElectrical;
  Sunroof? clusterPanel;
  Battery? cngKitImage;
  Battery? dashboardImage;
  String? dashboardSwitch;
  Battery? frontSeatImage;
  Battery? interiorView;
  FrontTyreRight? platformImage;
  Sunroof? powerWindowCentalLock;
  Battery? powerWindowDriverImage;
  String? pushButton;
  Battery? pushWindowDriverImage;
  Battery? rearSeatImage;
  FrontTyreRight? rearViewMirror;
  String? secondKey;
  String? warningDetails;
  num? uniqueId;
  String? make;
  String? model;
  String? variant;
  String? maskedRegNumber;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  String? monthAndYearOfManufacture;
  num? odometerReading;
  String? transmission;
  bool? bidClosed;
  String? qcStatus;
  num? highestBid;
  num? totalBidder;
  String? status;
  List<LeaderBoard>? leaderBoard;
  String? specialComments;
  Battery? front;
  Battery? frontLeft;
  Battery? frontRight;
  Battery? rearLeft;
  Battery? rear;
  Battery? rearRight;
  Battery? engineCompartment;
  num? engineStar;
  num? exteriorStar;
  num? interiorAndElectricalStar;
  num? testDriveStar;
  String? bidEndTime;
  String? bidStartTime;
  num? realValue;
  String? winner;

  AllCarInfo(
      {this.engineCylinder,
        this.evaluationStatusForEngine,
        this.firewall,
        this.dashboardCondition,
        this.createdAt,
        this.updatedAt,
        this.battery,
        this.blowBy,
        this.clutch,
        this.coolant,
        this.engine,
        this.engineComment,
        this.engineOil,
        this.engineSound,
        this.exhaustSmoke,
        this.gearBox,
        this.gearBoxLeakage,
        this.mount,
        this.radiator,
        this.silencer,
        this.startVideo,
        this.startingMotor,
        this.sump,
        this.turboCharger,
        this.evaluationStatusForExterior,
        this.leftImage,
        this.rightImage,
        this.roof,
        this.frontWindShield,
        this.rearWindShield,
        this.doorGlassLeft,
        this.doorGlassRight,
        this.quarterGlass,
        this.headLightLeft,
        this.headLightRight,
        this.headLightSupport,
        this.bumperFront,
        this.bumperRear,
        this.grill,
        this.bonnetPatti,
        this.upperCrossMember,
        this.lowerCrossMember,
        this.apronLeft,
        this.apronRight,
        this.cowlTop,
        this.chassisExtension,
        this.frontTyreRight,
        this.frontTyreLeft,
        this.rearTyreRight,
        this.rearTyreLeft,
        this.fenderLeft,
        this.fenderRight,
        this.quarterPanelLeft,
        this.quarterPanelRight,
        this.doorFrontLeft,
        this.doorFrontRight,
        this.doorRearRight,
        this.leftApillar,
        this.doorRearLeft,
        this.rightApillar,
        this.leftBpillar,
        this.rightBpillar,
        this.leftCpillar,
        this.rightCpillar,
        this.runnningBorderLeft,
        this.tailLightLeft,
        this.tailLightRight,
        this.rearWiper,
        this.runnningBorderRight,
        this.boot,
        this.dickyDoor,
        this.spareWheel,
        this.rearViewMirrorLeft,
        this.rearViewMirrorRight,
        this.fuelLid,
        this.fullBodyRepaint,
        this.jackAndTool,
        this.missingParts,
        this.handBreak,
        this.evaluationStatusForInterior,
        this.steeringWheel,
        this.suspension,
        this.transmissionAutomatic,
        this.vehicleHorn,
        this.evaluationStatusForTestDrive,
        this.evaluationStatusForFeature,
        this.airCooling,
        this.acCondensor,
        this.evaluationStatusForAc,
        this.carCondition,
        this.brakes,
        this.clutchSystem,
        this.cruiseControl,
        this.seatAdjustment,
        this.steeringAdjustment,
        this.steeringMountedAudioControl,
        this.steeringSystem,
        this.transmissionManual,
        this.acBlowerGrill,
        this.acFilterDamaged,
        this.acWorking,
        this.climateControl,
        this.heater,
        this.rearDefogger,
        this.absEbd,
        this.airbag,
        this.alloyWheels,
        this.anyInteriorModifications,
        this.fogLamps,
        this.gloveBox,
        this.gpsNavigation,
        this.keylessEntry,
        this.rearParkingSensor,
        this.seatBelt,
        this.stereoBrand,
        this.stereoImage,
        this.sunroof,
        this.carElectrical,
        this.clusterPanel,
        this.cngKitImage,
        this.dashboardImage,
        this.dashboardSwitch,
        this.frontSeatImage,
        this.interiorView,
        this.platformImage,
        this.powerWindowCentalLock,
        this.powerWindowDriverImage,
        this.pushButton,
        this.pushWindowDriverImage,
        this.rearSeatImage,
        this.rearViewMirror,
        this.secondKey,
        this.warningDetails,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.maskedRegNumber,
        this.vehicleLocation,
        this.ownershipNumber,
        this.fuelType,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.transmission,
        this.bidClosed,
        this.qcStatus,
        this.highestBid,
        this.totalBidder,
        this.status,
        this.leaderBoard,
        this.specialComments,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rearLeft,
        this.rear,
        this.rearRight,
        this.engineCompartment,
        this.engineStar,
        this.exteriorStar,
        this.interiorAndElectricalStar,
        this.testDriveStar,
        this.bidEndTime,
        this.bidStartTime,
        this.realValue,
        this.winner});

  AllCarInfo.fromJson(Map<String, dynamic> json) {
    engineCylinder = json['engineCylinder'];
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    dashboardCondition = json['dashboardCondition'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    battery =
    json['firewall'] != null ? Battery.fromJson(json['firewall']) : null;
    json['battery'] != null ? Battery.fromJson(json['battery']) : null;
    blowBy =
    json['blowBy'] != null ? Battery.fromJson(json['blowBy']) : null;
    clutch =
    json['clutch'] != null ? Battery.fromJson(json['clutch']) : null;
    coolant = json['coolant'];
    engine =
    json['engine'] != null ? Battery.fromJson(json['engine']) : null;
    engineComment = json['engineComment'];
    engineOil = json['engineOil'] != null
        ? Battery.fromJson(json['engineOil'])
        : null;
    engineSound = json['engineSound'];
    exhaustSmoke = json['exhaustSmoke'];
    gearBox =
    json['gearBox'] != null ? Battery.fromJson(json['gearBox']) : null;
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'] != null ? Battery.fromJson(json['mount']) : null;
    radiator = json['radiator'];
    silencer = json['silencer'];
    startVideo = json['startVideo'] != null
        ? Battery.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    sump = json['sump'] != null ? Battery.fromJson(json['sump']) : null;
    turboCharger = json['turboCharger'] != null
        ? Battery.fromJson(json['turboCharger'])
        : null;
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
    leftImage = json['leftImage'] != null
        ? Battery.fromJson(json['leftImage'])
        : null;
    rightImage = json['rightImage'] != null
        ? Battery.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? Battery.fromJson(json['roof']) : null;
    frontWindShield = json['frontWindShield'] != null
        ? Battery.fromJson(json['frontWindShield'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? Battery.fromJson(json['rearWindShield'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? Battery.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? Battery.fromJson(json['doorGlassRight'])
        : null;
    quarterGlass = json['quarterGlass'] != null
        ? Battery.fromJson(json['quarterGlass'])
        : null;
    headLightLeft = json['headLightLeft'] != null
        ? Battery.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? Battery.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? Battery.fromJson(json['headLightSupport'])
        : null;
    bumperFront = json['bumperFront'] != null
        ? Battery.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? Battery.fromJson(json['bumperRear'])
        : null;
    grill = json['grill'] != null ? Battery.fromJson(json['grill']) : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? Battery.fromJson(json['bonnetPatti'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? Battery.fromJson(json['upperCrossMember'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? Battery.fromJson(json['lowerCrossMember'])
        : null;
    apronLeft = json['apronLeft'] != null
        ? Battery.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? Battery.fromJson(json['apronRight'])
        : null;
    cowlTop =
    json['cowlTop'] != null ? Battery.fromJson(json['cowlTop']) : null;
    chassisExtension = json['chassisExtension'] != null
        ? Battery.fromJson(json['chassisExtension'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? FrontTyreRight.fromJson(json['frontTyreRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? FrontTyreRight.fromJson(json['frontTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? FrontTyreRight.fromJson(json['rearTyreRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? FrontTyreRight.fromJson(json['rearTyreLeft'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? Battery.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? Battery.fromJson(json['fenderRight'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? Battery.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? Battery.fromJson(json['quarterPanelRight'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? Battery.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? Battery.fromJson(json['doorFrontRight'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? Battery.fromJson(json['doorRearRight'])
        : null;
    leftApillar = json['leftApillar'] != null
        ? Battery.fromJson(json['leftApillar'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? Battery.fromJson(json['doorRearLeft'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? Battery.fromJson(json['rightApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? Battery.fromJson(json['leftBpillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? Battery.fromJson(json['rightBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? Battery.fromJson(json['leftCpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? Battery.fromJson(json['rightCpillar'])
        : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? Battery.fromJson(json['runnningBorderLeft'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? Battery.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? Battery.fromJson(json['tailLightRight'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? Battery.fromJson(json['rearWiper'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? Battery.fromJson(json['runnningBorderRight'])
        : null;
    boot = json['boot'] != null ? Battery.fromJson(json['boot']) : null;
    dickyDoor = json['dickyDoor'] != null
        ? Battery.fromJson(json['dickyDoor'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? Battery.fromJson(json['spareWheel'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? Battery.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? Battery.fromJson(json['rearViewMirrorRight'])
        : null;
    fuelLid =
    json['fuelLid'] != null ? Battery.fromJson(json['fuelLid']) : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    jackAndTool = json['jackAndTool'];
    missingParts = json['missingParts'];
    handBreak = json['handBreak'].cast<String>();
    evaluationStatusForInterior = json['evaluationStatusForInterior'];
    steeringWheel = json['steeringWheel'].cast<String>();
    suspension = json['suspension'].cast<String>();
    transmissionAutomatic = json['transmissionAutomatic'].cast<String>();
    vehicleHorn = json['vehicleHorn'].cast<String>();
    evaluationStatusForTestDrive = json['evaluationStatusForTestDrive'];
    evaluationStatusForFeature = json['evaluationStatusForFeature'];
    airCooling = json['airCooling'].cast<String>();
    acCondensor = json['acCondensor'].cast<String>();
    evaluationStatusForAc = json['evaluationStatusForAc'];
    carCondition = json['carCondition'];
    brakes = json['brakes'];
    clutchSystem = json['clutchSystem'];
    cruiseControl = json['cruiseControl'];
    seatAdjustment = json['seatAdjustment'];
    steeringAdjustment = json['steeringAdjustment'];
    steeringMountedAudioControl = json['steeringMountedAudioControl'];
    steeringSystem = json['steeringSystem'];
    transmissionManual = json['transmissionManual'];
    acBlowerGrill = json['acBlowerGrill'];
    acFilterDamaged = json['acFilterDamaged'];
    acWorking = json['acWorking'];
    climateControl = json['climateControl'];
    heater = json['heater'];
    rearDefogger = json['rearDefogger'];
    absEbd = json['absEbd'] != null
        ? FrontTyreRight.fromJson(json['absEbd'])
        : null;
    airbag = json['airbag'] != null
        ? FrontTyreRight.fromJson(json['airbag'])
        : null;
    alloyWheels = json['alloyWheels'] != null
        ? FrontTyreRight.fromJson(json['alloyWheels'])
        : null;
    anyInteriorModifications = json['anyInteriorModifications'];
    fogLamps = json['fogLamps'];
    gloveBox = json['gloveBox'] != null
        ? FrontTyreRight.fromJson(json['gloveBox'])
        : null;
    gpsNavigation = json['gpsNavigation'];
    keylessEntry = json['keylessEntry'] != null
        ? FrontTyreRight.fromJson(json['keylessEntry'])
        : null;
    rearParkingSensor = json['rearParkingSensor'];
    seatBelt = json['seatBelt'];
    stereoBrand = json['stereoBrand'];
    stereoImage = json['stereoImage'] != null
        ? Battery.fromJson(json['stereoImage'])
        : null;
    sunroof =
    json['sunroof'] != null ? Sunroof.fromJson(json['sunroof']) : null;
    carElectrical = json['carElectrical'] != null
        ? Battery.fromJson(json['carElectrical'])
        : null;
    clusterPanel = json['clusterPanel'] != null
        ? Sunroof.fromJson(json['clusterPanel'])
        : null;
    cngKitImage = json['cngKitImage'] != null
        ? Battery.fromJson(json['cngKitImage'])
        : null;
    dashboardImage = json['dashboardImage'] != null
        ? Battery.fromJson(json['dashboardImage'])
        : null;
    dashboardSwitch = json['dashboardSwitch'];
    frontSeatImage = json['frontSeatImage'] != null
        ? Battery.fromJson(json['frontSeatImage'])
        : null;
    interiorView = json['interiorView'] != null
        ? Battery.fromJson(json['interiorView'])
        : null;
    platformImage = json['platformImage'] != null
        ? FrontTyreRight.fromJson(json['platformImage'])
        : null;
    powerWindowCentalLock = json['powerWindowCentalLock'] != null
        ? Sunroof.fromJson(json['powerWindowCentalLock'])
        : null;
    powerWindowDriverImage = json['powerWindowDriverImage'] != null
        ? Battery.fromJson(json['powerWindowDriverImage'])
        : null;
    pushButton = json['pushButton'];
    pushWindowDriverImage = json['pushWindowDriverImage'] != null
        ? Battery.fromJson(json['pushWindowDriverImage'])
        : null;
    rearSeatImage = json['rearSeatImage'] != null
        ? Battery.fromJson(json['rearSeatImage'])
        : null;
    rearViewMirror = json['rearViewMirror'] != null
        ? FrontTyreRight.fromJson(json['rearViewMirror'])
        : null;
    secondKey = json['secondKey'];
    warningDetails = json['warningDetails'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    maskedRegNumber = json['maskedRegNumber'];
    vehicleLocation = json['vehicleLocation'];
    ownershipNumber = json['ownershipNumber'];
    fuelType = json['fuelType'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    odometerReading = json['odometerReading'];
    transmission = json['transmission'];
    bidClosed = json['bidClosed'];
    qcStatus = json['qcStatus'];
    highestBid = json['highestBid'];
    totalBidder = json['totalBidder'];
    status = json['status'];
    if (json['leaderBoard'] != null) {
      leaderBoard = <LeaderBoard>[];
      json['leaderBoard'].forEach((v) {
        leaderBoard!.add(LeaderBoard.fromJson(v));
      });
    }
    specialComments = json['specialComments'];
    front = json['front'] != null ? Battery.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? Battery.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? Battery.fromJson(json['frontRight'])
        : null;
    rearLeft = json['rearLeft'] != null
        ? Battery.fromJson(json['rearLeft'])
        : null;
    rear = json['rear'] != null ? Battery.fromJson(json['rear']) : null;
    rearRight = json['rearRight'] != null
        ? Battery.fromJson(json['rearRight'])
        : null;
    engineCompartment = json['engineCompartment'] != null
        ? Battery.fromJson(json['engineCompartment'])
        : null;
    engineStar = json['engineStar'];
    exteriorStar = json['exteriorStar'];
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
    testDriveStar = json['testDriveStar'];
    bidEndTime = json['bidEndTime'];
    bidStartTime = json['bidStartTime'];
    realValue = json['realValue'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['engineCylinder'] = engineCylinder;
    data['evaluationStatusForEngine'] = evaluationStatusForEngine;
    data['firewall'] = firewall;
    data['dashboardCondition'] = dashboardCondition;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (battery != null) {
      data['battery'] = battery!.toJson();
    }
    if (firewall != null) {
      data['firewall'] = firewall!.toJson();
    }
    if (blowBy != null) {
      data['blowBy'] = blowBy!.toJson();
    }
    if (clutch != null) {
      data['clutch'] = clutch!.toJson();
    }
    data['coolant'] = coolant;
    if (engine != null) {
      data['engine'] = engine!.toJson();
    }
    data['engineComment'] = engineComment;
    if (engineOil != null) {
      data['engineOil'] = engineOil!.toJson();
    }
    data['engineSound'] = engineSound;
    data['exhaustSmoke'] = exhaustSmoke;
    if (gearBox != null) {
      data['gearBox'] = gearBox!.toJson();
    }
    data['gearBoxLeakage'] = gearBoxLeakage;
    if (mount != null) {
      data['mount'] = mount!.toJson();
    }
    data['radiator'] = radiator;
    data['silencer'] = silencer;
    if (startVideo != null) {
      data['startVideo'] = startVideo!.toJson();
    }
    data['startingMotor'] = startingMotor;
    if (sump != null) {
      data['sump'] = sump!.toJson();
    }
    if (turboCharger != null) {
      data['turboCharger'] = turboCharger!.toJson();
    }
    data['evaluationStatusForExterior'] = evaluationStatusForExterior;
    if (leftImage != null) {
      data['leftImage'] = leftImage!.toJson();
    }
    if (rightImage != null) {
      data['rightImage'] = rightImage!.toJson();
    }
    if (roof != null) {
      data['roof'] = roof!.toJson();
    }
    if (frontWindShield != null) {
      data['frontWindShield'] = frontWindShield!.toJson();
    }
    if (rearWindShield != null) {
      data['rearWindShield'] = rearWindShield!.toJson();
    }
    if (doorGlassLeft != null) {
      data['doorGlassLeft'] = doorGlassLeft!.toJson();
    }
    if (doorGlassRight != null) {
      data['doorGlassRight'] = doorGlassRight!.toJson();
    }
    if (quarterGlass != null) {
      data['quarterGlass'] = quarterGlass!.toJson();
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
    if (bumperFront != null) {
      data['bumperFront'] = bumperFront!.toJson();
    }
    if (bumperRear != null) {
      data['bumperRear'] = bumperRear!.toJson();
    }
    if (grill != null) {
      data['grill'] = grill!.toJson();
    }
    if (bonnetPatti != null) {
      data['bonnetPatti'] = bonnetPatti!.toJson();
    }
    if (upperCrossMember != null) {
      data['upperCrossMember'] = upperCrossMember!.toJson();
    }
    if (lowerCrossMember != null) {
      data['lowerCrossMember'] = lowerCrossMember!.toJson();
    }
    if (apronLeft != null) {
      data['apronLeft'] = apronLeft!.toJson();
    }
    if (apronRight != null) {
      data['apronRight'] = apronRight!.toJson();
    }
    if (cowlTop != null) {
      data['cowlTop'] = cowlTop!.toJson();
    }
    if (chassisExtension != null) {
      data['chassisExtension'] = chassisExtension!.toJson();
    }
    if (frontTyreRight != null) {
      data['frontTyreRight'] = frontTyreRight!.toJson();
    }
    if (frontTyreLeft != null) {
      data['frontTyreLeft'] = frontTyreLeft!.toJson();
    }
    if (rearTyreRight != null) {
      data['rearTyreRight'] = rearTyreRight!.toJson();
    }
    if (rearTyreLeft != null) {
      data['rearTyreLeft'] = rearTyreLeft!.toJson();
    }
    if (fenderLeft != null) {
      data['fenderLeft'] = fenderLeft!.toJson();
    }
    if (fenderRight != null) {
      data['fenderRight'] = fenderRight!.toJson();
    }
    if (quarterPanelLeft != null) {
      data['quarterPanelLeft'] = quarterPanelLeft!.toJson();
    }
    if (quarterPanelRight != null) {
      data['quarterPanelRight'] = quarterPanelRight!.toJson();
    }
    if (doorFrontLeft != null) {
      data['doorFrontLeft'] = doorFrontLeft!.toJson();
    }
    if (doorFrontRight != null) {
      data['doorFrontRight'] = doorFrontRight!.toJson();
    }
    if (doorRearRight != null) {
      data['doorRearRight'] = doorRearRight!.toJson();
    }
    if (leftApillar != null) {
      data['leftApillar'] = leftApillar!.toJson();
    }
    if (doorRearLeft != null) {
      data['doorRearLeft'] = doorRearLeft!.toJson();
    }
    if (rightApillar != null) {
      data['rightApillar'] = rightApillar!.toJson();
    }
    if (leftBpillar != null) {
      data['leftBpillar'] = leftBpillar!.toJson();
    }
    if (rightBpillar != null) {
      data['rightBpillar'] = rightBpillar!.toJson();
    }
    if (leftCpillar != null) {
      data['leftCpillar'] = leftCpillar!.toJson();
    }
    if (rightCpillar != null) {
      data['rightCpillar'] = rightCpillar!.toJson();
    }
    if (runnningBorderLeft != null) {
      data['runnningBorderLeft'] = runnningBorderLeft!.toJson();
    }
    if (tailLightLeft != null) {
      data['tailLightLeft'] = tailLightLeft!.toJson();
    }
    if (tailLightRight != null) {
      data['tailLightRight'] = tailLightRight!.toJson();
    }
    if (rearWiper != null) {
      data['rearWiper'] = rearWiper!.toJson();
    }
    if (runnningBorderRight != null) {
      data['runnningBorderRight'] = runnningBorderRight!.toJson();
    }
    if (boot != null) {
      data['boot'] = boot!.toJson();
    }
    if (dickyDoor != null) {
      data['dickyDoor'] = dickyDoor!.toJson();
    }
    if (spareWheel != null) {
      data['spareWheel'] = spareWheel!.toJson();
    }
    if (rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = rearViewMirrorLeft!.toJson();
    }
    if (rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = rearViewMirrorRight!.toJson();
    }
    if (fuelLid != null) {
      data['fuelLid'] = fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = fullBodyRepaint;
    data['jackAndTool'] = jackAndTool;
    data['missingParts'] = missingParts;
    data['handBreak'] = handBreak;
    data['evaluationStatusForInterior'] = evaluationStatusForInterior;
    data['steeringWheel'] = steeringWheel;
    data['suspension'] = suspension;
    data['transmissionAutomatic'] = transmissionAutomatic;
    data['vehicleHorn'] = vehicleHorn;
    data['evaluationStatusForTestDrive'] = evaluationStatusForTestDrive;
    data['evaluationStatusForFeature'] = evaluationStatusForFeature;
    data['airCooling'] = airCooling;
    data['acCondensor'] = acCondensor;
    data['evaluationStatusForAc'] = evaluationStatusForAc;
    data['carCondition'] = carCondition;
    data['brakes'] = brakes;
    data['clutchSystem'] = clutchSystem;
    data['cruiseControl'] = cruiseControl;
    data['seatAdjustment'] = seatAdjustment;
    data['steeringAdjustment'] = steeringAdjustment;
    data['steeringMountedAudioControl'] = steeringMountedAudioControl;
    data['steeringSystem'] = steeringSystem;
    data['transmissionManual'] = transmissionManual;
    data['acBlowerGrill'] = acBlowerGrill;
    data['acFilterDamaged'] = acFilterDamaged;
    data['acWorking'] = acWorking;
    data['climateControl'] = climateControl;
    data['heater'] = heater;
    data['rearDefogger'] = rearDefogger;
    if (absEbd != null) {
      data['absEbd'] = absEbd!.toJson();
    }
    if (airbag != null) {
      data['airbag'] = airbag!.toJson();
    }
    if (alloyWheels != null) {
      data['alloyWheels'] = alloyWheels!.toJson();
    }
    data['anyInteriorModifications'] = anyInteriorModifications;
    data['fogLamps'] = fogLamps;
    if (gloveBox != null) {
      data['gloveBox'] = gloveBox!.toJson();
    }
    data['gpsNavigation'] = gpsNavigation;
    if (keylessEntry != null) {
      data['keylessEntry'] = keylessEntry!.toJson();
    }
    data['rearParkingSensor'] = rearParkingSensor;
    data['seatBelt'] = seatBelt;
    data['stereoBrand'] = stereoBrand;
    if (stereoImage != null) {
      data['stereoImage'] = stereoImage!.toJson();
    }
    if (sunroof != null) {
      data['sunroof'] = sunroof!.toJson();
    }
    if (carElectrical != null) {
      data['carElectrical'] = carElectrical!.toJson();
    }
    if (clusterPanel != null) {
      data['clusterPanel'] = clusterPanel!.toJson();
    }
    if (cngKitImage != null) {
      data['cngKitImage'] = cngKitImage!.toJson();
    }
    if (dashboardImage != null) {
      data['dashboardImage'] = dashboardImage!.toJson();
    }
    data['dashboardSwitch'] = dashboardSwitch;
    if (frontSeatImage != null) {
      data['frontSeatImage'] = frontSeatImage!.toJson();
    }
    if (interiorView != null) {
      data['interiorView'] = interiorView!.toJson();
    }
    if (platformImage != null) {
      data['platformImage'] = platformImage!.toJson();
    }
    if (powerWindowCentalLock != null) {
      data['powerWindowCentalLock'] = powerWindowCentalLock!.toJson();
    }
    if (powerWindowDriverImage != null) {
      data['powerWindowDriverImage'] = powerWindowDriverImage!.toJson();
    }
    data['pushButton'] = pushButton;
    if (pushWindowDriverImage != null) {
      data['pushWindowDriverImage'] = pushWindowDriverImage!.toJson();
    }
    if (rearSeatImage != null) {
      data['rearSeatImage'] = rearSeatImage!.toJson();
    }
    if (rearViewMirror != null) {
      data['rearViewMirror'] = rearViewMirror!.toJson();
    }
    data['secondKey'] = secondKey;
    data['warningDetails'] = warningDetails;
    data['uniqueId'] = uniqueId;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['maskedRegNumber'] = maskedRegNumber;
    data['vehicleLocation'] = vehicleLocation;
    data['ownershipNumber'] = ownershipNumber;
    data['fuelType'] = fuelType;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['odometerReading'] = odometerReading;
    data['transmission'] = transmission;
    data['bidClosed'] = bidClosed;
    data['qcStatus'] = qcStatus;
    data['highestBid'] = highestBid;
    data['totalBidder'] = totalBidder;
    data['status'] = status;
    if (leaderBoard != null) {
      data['leaderBoard'] = leaderBoard!.map((v) => v.toJson()).toList();
    }
    data['specialComments'] = specialComments;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
    }
    if (rearLeft != null) {
      data['rearLeft'] = rearLeft!.toJson();
    }
    if (rear != null) {
      data['rear'] = rear!.toJson();
    }
    if (rearRight != null) {
      data['rearRight'] = rearRight!.toJson();
    }
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    data['engineStar'] = engineStar;
    data['exteriorStar'] = exteriorStar;
    data['interiorAndElectricalStar'] = interiorAndElectricalStar;
    data['testDriveStar'] = testDriveStar;
    data['bidEndTime'] = bidEndTime;
    data['bidStartTime'] = bidStartTime;
    data['realValue'] = realValue;
    data['winner'] = winner;
    return data;
  }
}

class Battery {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  Battery({this.name, this.url, this.condition, this.remarks});

  Battery.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    condition = json['condition'].cast<String>();
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

class FrontTyreRight {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  FrontTyreRight({this.name, this.url, this.condition, this.remarks});

  FrontTyreRight.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    condition = json['condition'].cast<String>();
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

class Sunroof {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  Sunroof({this.name, this.url, this.condition, this.remarks});

  Sunroof.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    remarks = json['remarks'];
    condition = json['condition'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['remarks'] = remarks;
    data['condition'] = condition;
    return data;
  }
}

class LeaderBoard {
  num? amount;
  String? userId;
  String? uniqueId;
  bool? isAutobid;
  num? contactNo;
  String? fullname;
  bool? isRejected;
  String? sId;

  LeaderBoard(
      {this.amount,
        this.userId,
        this.uniqueId,
        this.isAutobid,
        this.contactNo,
        this.fullname,
        this.isRejected,
        this.sId});

  LeaderBoard.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    userId = json['userId'];
    uniqueId = json['uniqueId'];
    isAutobid = json['isAutobid'];
    contactNo = json['contactNo'];
    fullname = json['fullname'];
    isRejected = json['isRejected'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['userId'] = userId;
    data['uniqueId'] = uniqueId;
    data['isAutobid'] = isAutobid;
    data['contactNo'] = contactNo;
    data['fullname'] = fullname;
    data['isRejected'] = isRejected;
    data['_id'] = sId;
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
