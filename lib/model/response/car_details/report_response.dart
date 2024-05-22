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
  int? oemMonthRemain;
  String? oemKmRemain;
  String? regNumber;
  String? customerPrice;
  int? sellerMobileNumber;
  int? rcOwnerMobileNumber;
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
        ? new AllCarInfo.fromJson(json['allCarInfo'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.allCarInfo != null) {
      data['allCarInfo'] = this.allCarInfo!.toJson();
    }
    data['evaluatorId'] = this.evaluatorId;
    data['userId'] = this.userId;
    data['evaluatorName'] = this.evaluatorName;
    data['chasisNumber'] = this.chasisNumber;
    data['regDate'] = this.regDate;
    data['bodyType'] = this.bodyType;
    data['color'] = this.color;
    data['rcAvailability'] = this.rcAvailability;
    data['rcMismatch'] = this.rcMismatch;
    data['loanNoc'] = this.loanNoc;
    data['loanStatus'] = this.loanStatus;
    data['ncb'] = this.ncb;
    data['hypothecation'] = this.hypothecation;
    data['regValidity'] = this.regValidity;
    data['engineNumber'] = this.engineNumber;
    data['insurance'] = this.insurance;
    data['form35'] = this.form35;
    data['taxValidity'] = this.taxValidity;
    data['regState'] = this.regState;
    data['rto'] = this.rto;
    data['engineCC'] = this.engineCC;
    data['vehicleUsage'] = this.vehicleUsage;
    data['seats'] = this.seats;
    data['duplicateKey'] = this.duplicateKey;
    data['odometerWorking'] = this.odometerWorking;
    data['accidential'] = this.accidential;
    data['oemWarrantyRemain'] = this.oemWarrantyRemain;
    data['oemMonthRemain'] = this.oemMonthRemain;
    data['oemKmRemain'] = this.oemKmRemain;
    data['regNumber'] = this.regNumber;
    data['customerPrice'] = this.customerPrice;
    data['sellerMobileNumber'] = this.sellerMobileNumber;
    data['rcOwnerMobileNumber'] = this.rcOwnerMobileNumber;
    data['sellerName'] = this.sellerName;
    data['rcOwnerName'] = this.rcOwnerName;
    data['sellerAddress'] = this.sellerAddress;
    data['isCarRegistered'] = this.isCarRegistered;
    return data;
  }
}

class AllCarInfo {
  int? engineCylinder;
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
  int? uniqueId;
  String? make;
  String? model;
  String? variant;
  String? maskedRegNumber;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  String? monthAndYearOfManufacture;
  int? odometerReading;
  String? transmission;
  bool? bidClosed;
  String? qcStatus;
  int? highestBid;
  int? totalBidder;
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
  int? engineStar;
  double? exteriorStar;
  int? interiorAndElectricalStar;
  int? testDriveStar;
  String? bidEndTime;
  String? bidStartTime;
  int? realValue;
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
    json['firewall'] != null ? new Battery.fromJson(json['firewall']) : null;
    json['battery'] != null ? new Battery.fromJson(json['battery']) : null;
    blowBy =
    json['blowBy'] != null ? new Battery.fromJson(json['blowBy']) : null;
    clutch =
    json['clutch'] != null ? new Battery.fromJson(json['clutch']) : null;
    coolant = json['coolant'];
    engine =
    json['engine'] != null ? new Battery.fromJson(json['engine']) : null;
    engineComment = json['engineComment'];
    engineOil = json['engineOil'] != null
        ? new Battery.fromJson(json['engineOil'])
        : null;
    engineSound = json['engineSound'];
    exhaustSmoke = json['exhaustSmoke'];
    gearBox =
    json['gearBox'] != null ? new Battery.fromJson(json['gearBox']) : null;
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'] != null ? new Battery.fromJson(json['mount']) : null;
    radiator = json['radiator'];
    silencer = json['silencer'];
    startVideo = json['startVideo'] != null
        ? new Battery.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    sump = json['sump'] != null ? new Battery.fromJson(json['sump']) : null;
    turboCharger = json['turboCharger'] != null
        ? new Battery.fromJson(json['turboCharger'])
        : null;
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
    leftImage = json['leftImage'] != null
        ? new Battery.fromJson(json['leftImage'])
        : null;
    rightImage = json['rightImage'] != null
        ? new Battery.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? new Battery.fromJson(json['roof']) : null;
    frontWindShield = json['frontWindShield'] != null
        ? new Battery.fromJson(json['frontWindShield'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? new Battery.fromJson(json['rearWindShield'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? new Battery.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? new Battery.fromJson(json['doorGlassRight'])
        : null;
    quarterGlass = json['quarterGlass'] != null
        ? new Battery.fromJson(json['quarterGlass'])
        : null;
    headLightLeft = json['headLightLeft'] != null
        ? new Battery.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? new Battery.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? new Battery.fromJson(json['headLightSupport'])
        : null;
    bumperFront = json['bumperFront'] != null
        ? new Battery.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? new Battery.fromJson(json['bumperRear'])
        : null;
    grill = json['grill'] != null ? new Battery.fromJson(json['grill']) : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? new Battery.fromJson(json['bonnetPatti'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? new Battery.fromJson(json['upperCrossMember'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? new Battery.fromJson(json['lowerCrossMember'])
        : null;
    apronLeft = json['apronLeft'] != null
        ? new Battery.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? new Battery.fromJson(json['apronRight'])
        : null;
    cowlTop =
    json['cowlTop'] != null ? new Battery.fromJson(json['cowlTop']) : null;
    chassisExtension = json['chassisExtension'] != null
        ? new Battery.fromJson(json['chassisExtension'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? new FrontTyreRight.fromJson(json['frontTyreRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? new FrontTyreRight.fromJson(json['frontTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? new FrontTyreRight.fromJson(json['rearTyreRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? new FrontTyreRight.fromJson(json['rearTyreLeft'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? new Battery.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? new Battery.fromJson(json['fenderRight'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? new Battery.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? new Battery.fromJson(json['quarterPanelRight'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? new Battery.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? new Battery.fromJson(json['doorFrontRight'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? new Battery.fromJson(json['doorRearRight'])
        : null;
    leftApillar = json['leftApillar'] != null
        ? new Battery.fromJson(json['leftApillar'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? new Battery.fromJson(json['doorRearLeft'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? new Battery.fromJson(json['rightApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? new Battery.fromJson(json['leftBpillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? new Battery.fromJson(json['rightBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? new Battery.fromJson(json['leftCpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? new Battery.fromJson(json['rightCpillar'])
        : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? new Battery.fromJson(json['runnningBorderLeft'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? new Battery.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? new Battery.fromJson(json['tailLightRight'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? new Battery.fromJson(json['rearWiper'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? new Battery.fromJson(json['runnningBorderRight'])
        : null;
    boot = json['boot'] != null ? new Battery.fromJson(json['boot']) : null;
    dickyDoor = json['dickyDoor'] != null
        ? new Battery.fromJson(json['dickyDoor'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? new Battery.fromJson(json['spareWheel'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? new Battery.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? new Battery.fromJson(json['rearViewMirrorRight'])
        : null;
    fuelLid =
    json['fuelLid'] != null ? new Battery.fromJson(json['fuelLid']) : null;
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
        ? new FrontTyreRight.fromJson(json['absEbd'])
        : null;
    airbag = json['airbag'] != null
        ? new FrontTyreRight.fromJson(json['airbag'])
        : null;
    alloyWheels = json['alloyWheels'] != null
        ? new FrontTyreRight.fromJson(json['alloyWheels'])
        : null;
    anyInteriorModifications = json['anyInteriorModifications'];
    fogLamps = json['fogLamps'];
    gloveBox = json['gloveBox'] != null
        ? new FrontTyreRight.fromJson(json['gloveBox'])
        : null;
    gpsNavigation = json['gpsNavigation'];
    keylessEntry = json['keylessEntry'] != null
        ? new FrontTyreRight.fromJson(json['keylessEntry'])
        : null;
    rearParkingSensor = json['rearParkingSensor'];
    seatBelt = json['seatBelt'];
    stereoBrand = json['stereoBrand'];
    stereoImage = json['stereoImage'] != null
        ? new Battery.fromJson(json['stereoImage'])
        : null;
    sunroof =
    json['sunroof'] != null ? new Sunroof.fromJson(json['sunroof']) : null;
    carElectrical = json['carElectrical'] != null
        ? new Battery.fromJson(json['carElectrical'])
        : null;
    clusterPanel = json['clusterPanel'] != null
        ? new Sunroof.fromJson(json['clusterPanel'])
        : null;
    cngKitImage = json['cngKitImage'] != null
        ? new Battery.fromJson(json['cngKitImage'])
        : null;
    dashboardImage = json['dashboardImage'] != null
        ? new Battery.fromJson(json['dashboardImage'])
        : null;
    dashboardSwitch = json['dashboardSwitch'];
    frontSeatImage = json['frontSeatImage'] != null
        ? new Battery.fromJson(json['frontSeatImage'])
        : null;
    interiorView = json['interiorView'] != null
        ? new Battery.fromJson(json['interiorView'])
        : null;
    platformImage = json['platformImage'] != null
        ? new FrontTyreRight.fromJson(json['platformImage'])
        : null;
    powerWindowCentalLock = json['powerWindowCentalLock'] != null
        ? new Sunroof.fromJson(json['powerWindowCentalLock'])
        : null;
    powerWindowDriverImage = json['powerWindowDriverImage'] != null
        ? new Battery.fromJson(json['powerWindowDriverImage'])
        : null;
    pushButton = json['pushButton'];
    pushWindowDriverImage = json['pushWindowDriverImage'] != null
        ? new Battery.fromJson(json['pushWindowDriverImage'])
        : null;
    rearSeatImage = json['rearSeatImage'] != null
        ? new Battery.fromJson(json['rearSeatImage'])
        : null;
    rearViewMirror = json['rearViewMirror'] != null
        ? new FrontTyreRight.fromJson(json['rearViewMirror'])
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
        leaderBoard!.add(new LeaderBoard.fromJson(v));
      });
    }
    specialComments = json['specialComments'];
    front = json['front'] != null ? new Battery.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? new Battery.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? new Battery.fromJson(json['frontRight'])
        : null;
    rearLeft = json['rearLeft'] != null
        ? new Battery.fromJson(json['rearLeft'])
        : null;
    rear = json['rear'] != null ? new Battery.fromJson(json['rear']) : null;
    rearRight = json['rearRight'] != null
        ? new Battery.fromJson(json['rearRight'])
        : null;
    engineCompartment = json['engineCompartment'] != null
        ? new Battery.fromJson(json['engineCompartment'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['engineCylinder'] = this.engineCylinder;
    data['evaluationStatusForEngine'] = this.evaluationStatusForEngine;
    data['firewall'] = this.firewall;
    data['dashboardCondition'] = this.dashboardCondition;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.battery != null) {
      data['battery'] = this.battery!.toJson();
    }
    if (this.firewall != null) {
      data['firewall'] = this.firewall!.toJson();
    }
    if (this.blowBy != null) {
      data['blowBy'] = this.blowBy!.toJson();
    }
    if (this.clutch != null) {
      data['clutch'] = this.clutch!.toJson();
    }
    data['coolant'] = this.coolant;
    if (this.engine != null) {
      data['engine'] = this.engine!.toJson();
    }
    data['engineComment'] = this.engineComment;
    if (this.engineOil != null) {
      data['engineOil'] = this.engineOil!.toJson();
    }
    data['engineSound'] = this.engineSound;
    data['exhaustSmoke'] = this.exhaustSmoke;
    if (this.gearBox != null) {
      data['gearBox'] = this.gearBox!.toJson();
    }
    data['gearBoxLeakage'] = this.gearBoxLeakage;
    if (this.mount != null) {
      data['mount'] = this.mount!.toJson();
    }
    data['radiator'] = this.radiator;
    data['silencer'] = this.silencer;
    if (this.startVideo != null) {
      data['startVideo'] = this.startVideo!.toJson();
    }
    data['startingMotor'] = this.startingMotor;
    if (this.sump != null) {
      data['sump'] = this.sump!.toJson();
    }
    if (this.turboCharger != null) {
      data['turboCharger'] = this.turboCharger!.toJson();
    }
    data['evaluationStatusForExterior'] = this.evaluationStatusForExterior;
    if (this.leftImage != null) {
      data['leftImage'] = this.leftImage!.toJson();
    }
    if (this.rightImage != null) {
      data['rightImage'] = this.rightImage!.toJson();
    }
    if (this.roof != null) {
      data['roof'] = this.roof!.toJson();
    }
    if (this.frontWindShield != null) {
      data['frontWindShield'] = this.frontWindShield!.toJson();
    }
    if (this.rearWindShield != null) {
      data['rearWindShield'] = this.rearWindShield!.toJson();
    }
    if (this.doorGlassLeft != null) {
      data['doorGlassLeft'] = this.doorGlassLeft!.toJson();
    }
    if (this.doorGlassRight != null) {
      data['doorGlassRight'] = this.doorGlassRight!.toJson();
    }
    if (this.quarterGlass != null) {
      data['quarterGlass'] = this.quarterGlass!.toJson();
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
    if (this.bumperFront != null) {
      data['bumperFront'] = this.bumperFront!.toJson();
    }
    if (this.bumperRear != null) {
      data['bumperRear'] = this.bumperRear!.toJson();
    }
    if (this.grill != null) {
      data['grill'] = this.grill!.toJson();
    }
    if (this.bonnetPatti != null) {
      data['bonnetPatti'] = this.bonnetPatti!.toJson();
    }
    if (this.upperCrossMember != null) {
      data['upperCrossMember'] = this.upperCrossMember!.toJson();
    }
    if (this.lowerCrossMember != null) {
      data['lowerCrossMember'] = this.lowerCrossMember!.toJson();
    }
    if (this.apronLeft != null) {
      data['apronLeft'] = this.apronLeft!.toJson();
    }
    if (this.apronRight != null) {
      data['apronRight'] = this.apronRight!.toJson();
    }
    if (this.cowlTop != null) {
      data['cowlTop'] = this.cowlTop!.toJson();
    }
    if (this.chassisExtension != null) {
      data['chassisExtension'] = this.chassisExtension!.toJson();
    }
    if (this.frontTyreRight != null) {
      data['frontTyreRight'] = this.frontTyreRight!.toJson();
    }
    if (this.frontTyreLeft != null) {
      data['frontTyreLeft'] = this.frontTyreLeft!.toJson();
    }
    if (this.rearTyreRight != null) {
      data['rearTyreRight'] = this.rearTyreRight!.toJson();
    }
    if (this.rearTyreLeft != null) {
      data['rearTyreLeft'] = this.rearTyreLeft!.toJson();
    }
    if (this.fenderLeft != null) {
      data['fenderLeft'] = this.fenderLeft!.toJson();
    }
    if (this.fenderRight != null) {
      data['fenderRight'] = this.fenderRight!.toJson();
    }
    if (this.quarterPanelLeft != null) {
      data['quarterPanelLeft'] = this.quarterPanelLeft!.toJson();
    }
    if (this.quarterPanelRight != null) {
      data['quarterPanelRight'] = this.quarterPanelRight!.toJson();
    }
    if (this.doorFrontLeft != null) {
      data['doorFrontLeft'] = this.doorFrontLeft!.toJson();
    }
    if (this.doorFrontRight != null) {
      data['doorFrontRight'] = this.doorFrontRight!.toJson();
    }
    if (this.doorRearRight != null) {
      data['doorRearRight'] = this.doorRearRight!.toJson();
    }
    if (this.leftApillar != null) {
      data['leftApillar'] = this.leftApillar!.toJson();
    }
    if (this.doorRearLeft != null) {
      data['doorRearLeft'] = this.doorRearLeft!.toJson();
    }
    if (this.rightApillar != null) {
      data['rightApillar'] = this.rightApillar!.toJson();
    }
    if (this.leftBpillar != null) {
      data['leftBpillar'] = this.leftBpillar!.toJson();
    }
    if (this.rightBpillar != null) {
      data['rightBpillar'] = this.rightBpillar!.toJson();
    }
    if (this.leftCpillar != null) {
      data['leftCpillar'] = this.leftCpillar!.toJson();
    }
    if (this.rightCpillar != null) {
      data['rightCpillar'] = this.rightCpillar!.toJson();
    }
    if (this.runnningBorderLeft != null) {
      data['runnningBorderLeft'] = this.runnningBorderLeft!.toJson();
    }
    if (this.tailLightLeft != null) {
      data['tailLightLeft'] = this.tailLightLeft!.toJson();
    }
    if (this.tailLightRight != null) {
      data['tailLightRight'] = this.tailLightRight!.toJson();
    }
    if (this.rearWiper != null) {
      data['rearWiper'] = this.rearWiper!.toJson();
    }
    if (this.runnningBorderRight != null) {
      data['runnningBorderRight'] = this.runnningBorderRight!.toJson();
    }
    if (this.boot != null) {
      data['boot'] = this.boot!.toJson();
    }
    if (this.dickyDoor != null) {
      data['dickyDoor'] = this.dickyDoor!.toJson();
    }
    if (this.spareWheel != null) {
      data['spareWheel'] = this.spareWheel!.toJson();
    }
    if (this.rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = this.rearViewMirrorLeft!.toJson();
    }
    if (this.rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = this.rearViewMirrorRight!.toJson();
    }
    if (this.fuelLid != null) {
      data['fuelLid'] = this.fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = this.fullBodyRepaint;
    data['jackAndTool'] = this.jackAndTool;
    data['missingParts'] = this.missingParts;
    data['handBreak'] = this.handBreak;
    data['evaluationStatusForInterior'] = this.evaluationStatusForInterior;
    data['steeringWheel'] = this.steeringWheel;
    data['suspension'] = this.suspension;
    data['transmissionAutomatic'] = this.transmissionAutomatic;
    data['vehicleHorn'] = this.vehicleHorn;
    data['evaluationStatusForTestDrive'] = this.evaluationStatusForTestDrive;
    data['evaluationStatusForFeature'] = this.evaluationStatusForFeature;
    data['airCooling'] = this.airCooling;
    data['acCondensor'] = this.acCondensor;
    data['evaluationStatusForAc'] = this.evaluationStatusForAc;
    data['carCondition'] = this.carCondition;
    data['brakes'] = this.brakes;
    data['clutchSystem'] = this.clutchSystem;
    data['cruiseControl'] = this.cruiseControl;
    data['seatAdjustment'] = this.seatAdjustment;
    data['steeringAdjustment'] = this.steeringAdjustment;
    data['steeringMountedAudioControl'] = this.steeringMountedAudioControl;
    data['steeringSystem'] = this.steeringSystem;
    data['transmissionManual'] = this.transmissionManual;
    data['acBlowerGrill'] = this.acBlowerGrill;
    data['acFilterDamaged'] = this.acFilterDamaged;
    data['acWorking'] = this.acWorking;
    data['climateControl'] = this.climateControl;
    data['heater'] = this.heater;
    data['rearDefogger'] = this.rearDefogger;
    if (this.absEbd != null) {
      data['absEbd'] = this.absEbd!.toJson();
    }
    if (this.airbag != null) {
      data['airbag'] = this.airbag!.toJson();
    }
    if (this.alloyWheels != null) {
      data['alloyWheels'] = this.alloyWheels!.toJson();
    }
    data['anyInteriorModifications'] = this.anyInteriorModifications;
    data['fogLamps'] = this.fogLamps;
    if (this.gloveBox != null) {
      data['gloveBox'] = this.gloveBox!.toJson();
    }
    data['gpsNavigation'] = this.gpsNavigation;
    if (this.keylessEntry != null) {
      data['keylessEntry'] = this.keylessEntry!.toJson();
    }
    data['rearParkingSensor'] = this.rearParkingSensor;
    data['seatBelt'] = this.seatBelt;
    data['stereoBrand'] = this.stereoBrand;
    if (this.stereoImage != null) {
      data['stereoImage'] = this.stereoImage!.toJson();
    }
    if (this.sunroof != null) {
      data['sunroof'] = this.sunroof!.toJson();
    }
    if (this.carElectrical != null) {
      data['carElectrical'] = this.carElectrical!.toJson();
    }
    if (this.clusterPanel != null) {
      data['clusterPanel'] = this.clusterPanel!.toJson();
    }
    if (this.cngKitImage != null) {
      data['cngKitImage'] = this.cngKitImage!.toJson();
    }
    if (this.dashboardImage != null) {
      data['dashboardImage'] = this.dashboardImage!.toJson();
    }
    data['dashboardSwitch'] = this.dashboardSwitch;
    if (this.frontSeatImage != null) {
      data['frontSeatImage'] = this.frontSeatImage!.toJson();
    }
    if (this.interiorView != null) {
      data['interiorView'] = this.interiorView!.toJson();
    }
    if (this.platformImage != null) {
      data['platformImage'] = this.platformImage!.toJson();
    }
    if (this.powerWindowCentalLock != null) {
      data['powerWindowCentalLock'] = this.powerWindowCentalLock!.toJson();
    }
    if (this.powerWindowDriverImage != null) {
      data['powerWindowDriverImage'] = this.powerWindowDriverImage!.toJson();
    }
    data['pushButton'] = this.pushButton;
    if (this.pushWindowDriverImage != null) {
      data['pushWindowDriverImage'] = this.pushWindowDriverImage!.toJson();
    }
    if (this.rearSeatImage != null) {
      data['rearSeatImage'] = this.rearSeatImage!.toJson();
    }
    if (this.rearViewMirror != null) {
      data['rearViewMirror'] = this.rearViewMirror!.toJson();
    }
    data['secondKey'] = this.secondKey;
    data['warningDetails'] = this.warningDetails;
    data['uniqueId'] = this.uniqueId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['variant'] = this.variant;
    data['maskedRegNumber'] = this.maskedRegNumber;
    data['vehicleLocation'] = this.vehicleLocation;
    data['ownershipNumber'] = this.ownershipNumber;
    data['fuelType'] = this.fuelType;
    data['monthAndYearOfManufacture'] = this.monthAndYearOfManufacture;
    data['odometerReading'] = this.odometerReading;
    data['transmission'] = this.transmission;
    data['bidClosed'] = this.bidClosed;
    data['qcStatus'] = this.qcStatus;
    data['highestBid'] = this.highestBid;
    data['totalBidder'] = this.totalBidder;
    data['status'] = this.status;
    if (this.leaderBoard != null) {
      data['leaderBoard'] = this.leaderBoard!.map((v) => v.toJson()).toList();
    }
    data['specialComments'] = this.specialComments;
    if (this.front != null) {
      data['front'] = this.front!.toJson();
    }
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
    }
    if (this.frontRight != null) {
      data['frontRight'] = this.frontRight!.toJson();
    }
    if (this.rearLeft != null) {
      data['rearLeft'] = this.rearLeft!.toJson();
    }
    if (this.rear != null) {
      data['rear'] = this.rear!.toJson();
    }
    if (this.rearRight != null) {
      data['rearRight'] = this.rearRight!.toJson();
    }
    if (this.engineCompartment != null) {
      data['engineCompartment'] = this.engineCompartment!.toJson();
    }
    data['engineStar'] = this.engineStar;
    data['exteriorStar'] = this.exteriorStar;
    data['interiorAndElectricalStar'] = this.interiorAndElectricalStar;
    data['testDriveStar'] = this.testDriveStar;
    data['bidEndTime'] = this.bidEndTime;
    data['bidStartTime'] = this.bidStartTime;
    data['realValue'] = this.realValue;
    data['winner'] = this.winner;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['condition'] = this.condition;
    data['remarks'] = this.remarks;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['remarks'] = this.remarks;
    data['condition'] = this.condition;
    return data;
  }
}

class LeaderBoard {
  int? amount;
  String? userId;
  String? uniqueId;
  bool? isAutobid;
  int? contactNo;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['userId'] = this.userId;
    data['uniqueId'] = this.uniqueId;
    data['isAutobid'] = this.isAutobid;
    data['contactNo'] = this.contactNo;
    data['fullname'] = this.fullname;
    data['isRejected'] = this.isRejected;
    data['_id'] = this.sId;
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
