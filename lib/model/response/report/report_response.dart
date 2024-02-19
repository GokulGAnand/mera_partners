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
  String? evaluationStatusForExterior;
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
  int? interiorStar;
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
  int? engineStar;
  int? exteriorStar;
  int? testDriveStar;

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
        this.evaluationStatusForExterior,
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
        this.testDriveStar});

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
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['evaluationStatusForExterior'] = evaluationStatusForExterior;
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
    return data;
  }
}

class EngineCompartment {
  String? name;
  String? url;

  EngineCompartment({this.name, this.url});

  EngineCompartment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
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
