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
    String? chasisNumber;
    String? monthAndYearOfManufacture;
    String? regDate;
    String? bodyType;
    String? color;
    int? odometerReading;
    String? rcAvailability;
    String? insurance;
    String? form35;
    String? regNumber;
    String? customerPrice;

    Data(
        {this.sId,
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
            this.regNumber,
            this.customerPrice});

    Data.fromJson(Map<String, dynamic> json) {
        sId = json['_id'];
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
        regNumber = json['regNumber'];
        customerPrice = json['customerPrice'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.sId;
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
    Battery? battery;
    Battery? blowBy;
    Battery? clutch;
    String? coolant;
    Battery? engine;
    String? engineComment;
    Battery? engineCompartment;
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
    Battery? apronLeft;
    Battery? apronRight;
    Battery? bonnetPatti;
    Battery? boot;
    Battery? bumperFront;
    Battery? bumperRear;
    Battery? chassisExtension;
    Battery? cowlTop;
    Battery? dickyDoor;
    Battery? doorFrontLeft;
    Battery? doorFrontRight;
    Battery? doorGlassLeft;
    Battery? doorGlassRight;
    Battery? doorRearLeft;
    Battery? doorRearRight;
    Battery? fenderLeft;
    Battery? fenderRight;
    Battery? firewall;
    Battery? frontTyreLeft;
    Battery? frontTyreRight;
    Battery? frontWindShield;
    Battery? fuelLid;
    String? fullBodyRepaint;
    Battery? grill;
    Battery? headLightLeft;
    Battery? headLightRight;
    Battery? headLightSupport;
    String? jackAndTool;
    Battery? leftApillar;
    Battery? leftBpillar;
    Battery? leftCpillar;
    Battery? leftImage;
    Battery? lowerCrossMember;
    String? missingParts;
    Battery? quarterGlass;
    Battery? quarterPanelLeft;
    Battery? quarterPanelRight;
    Battery? rearTyreLeft;
    Battery? rearTyreRight;
    Battery? rearViewMirrorLeft;
    Battery? rearViewMirrorRight;
    Battery? rearWindShield;
    Battery? rearWiper;
    Battery? rightApillar;
    Battery? rightBpillar;
    Battery? rightCpillar;
    Battery? rightImage;
    Battery? roof;
    Battery? runnningBorderLeft;
    Battery? runnningBorderRight;
    Battery? spareWheel;
    Battery? tailLightLeft;
    Battery? tailLightRight;
    Battery? upperCrossMember;
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
    Battery? carElectrical;
    ClusterPanel? clusterPanel;
    Battery? cngKitImage;
    String? combitionSwitch;
    String? dashboardCondition;
    Battery? dashboardImage;
    String? dashboardSwitch;
    Battery? frontSeatImage;
    Battery? interiorView;
    String? key;
    Battery? platformImage;
    ClusterPanel? powerWindowCentalLock;
    Battery? powerWindowDriverImage;
    String? pushButton;
    Battery? pushWindowDriverImage;
    Battery? rearSeatImage;
    ClusterPanel? rearViewMirror;
    String? secondKey;
    String? warningDetails;
    String? brakes;
    String? clutchSystem;
    String? cruiseControl;
    String? seatAdjustment;
    String? steeringAdjustment;
    String? steeringMountedAudioControl;
    String? steeringSystem;
    String? transmissionManual;
    ClusterPanel? absEbd;
    ClusterPanel? airbag;
    ClusterPanel? alloyWheels;
    String? anyInteriorModifications;
    String? fogLamps;
    ClusterPanel? gloveBox;
    String? gpsNavigation;
    ClusterPanel? keylessEntry;
    String? rearDefogger;
    String? rearParkingSensor;
    String? seatBelt;
    String? stereoBrand;
    Battery? stereoImage;
    ClusterPanel? sunroof;
    String? acBlowerGrill;
    String? acFilterDamaged;
    String? acWorking;
    String? climateControl;
    String? heater;
    String? carCondition;
    String? specialComments;
    int? engineStar;
    int? exteriorStar;
    double? interiorAndElectricalStar;
    int? testDriveStar;
    int? uniqueId;
    String? make;
    String? model;
    String? variant;
    String? maskedRegNumber;
    String? vehicleLocation;
    String? ownershipNumber;
    String? fuelType;
    String? qcStatus;
    int? highestBid;
    int? totalBidder;
    String? status;
    Battery? front;
    Battery? frontLeft;
    Battery? frontRight;
    Battery? rear;
    Battery? rearLeft;
    Battery? rearRight;

    AllCarInfo(
        {this.engineCylinder,
            this.evaluationStatusForEngine,
            this.createdAt,
            this.updatedAt,
            this.battery,
            this.blowBy,
            this.clutch,
            this.coolant,
            this.engine,
            this.engineComment,
            this.engineCompartment,
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
            this.apronLeft,
            this.apronRight,
            this.bonnetPatti,
            this.boot,
            this.bumperFront,
            this.bumperRear,
            this.chassisExtension,
            this.cowlTop,
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
            this.carElectrical,
            this.clusterPanel,
            this.cngKitImage,
            this.combitionSwitch,
            this.dashboardCondition,
            this.dashboardImage,
            this.dashboardSwitch,
            this.frontSeatImage,
            this.interiorView,
            this.key,
            this.platformImage,
            this.powerWindowCentalLock,
            this.powerWindowDriverImage,
            this.pushButton,
            this.pushWindowDriverImage,
            this.rearSeatImage,
            this.rearViewMirror,
            this.secondKey,
            this.warningDetails,
            this.brakes,
            this.clutchSystem,
            this.cruiseControl,
            this.seatAdjustment,
            this.steeringAdjustment,
            this.steeringMountedAudioControl,
            this.steeringSystem,
            this.transmissionManual,
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
            this.seatBelt,
            this.stereoBrand,
            this.stereoImage,
            this.sunroof,
            this.acBlowerGrill,
            this.acFilterDamaged,
            this.acWorking,
            this.climateControl,
            this.heater,
            this.carCondition,
            this.specialComments,
            this.engineStar,
            this.exteriorStar,
            this.interiorAndElectricalStar,
            this.testDriveStar,
            this.uniqueId,
            this.make,
            this.model,
            this.variant,
            this.maskedRegNumber,
            this.vehicleLocation,
            this.ownershipNumber,
            this.fuelType,
            this.qcStatus,
            this.highestBid,
            this.totalBidder,
            this.status,
            this.front,
            this.frontLeft,
            this.frontRight,
            this.rear,
            this.rearLeft,
            this.rearRight});

    AllCarInfo.fromJson(Map<String, dynamic> json) {
        engineCylinder = json['engineCylinder'];
        evaluationStatusForEngine = json['evaluationStatusForEngine'];
        createdAt = json['createdAt'];
        updatedAt = json['updatedAt'];
        battery =
        json['battery'] != null ? new Battery.fromJson(json['battery']) : null;
        blowBy =
        json['blowBy'] != null ? new Battery.fromJson(json['blowBy']) : null;
        clutch =
        json['clutch'] != null ? new Battery.fromJson(json['clutch']) : null;
        coolant = json['coolant'];
        engine =
        json['engine'] != null ? new Battery.fromJson(json['engine']) : null;
        engineComment = json['engineComment'];
        engineCompartment = json['engineCompartment'] != null
            ? new Battery.fromJson(json['engineCompartment'])
            : null;
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
        apronLeft = json['apronLeft'] != null
            ? new Battery.fromJson(json['apronLeft'])
            : null;
        apronRight = json['apronRight'] != null
            ? new Battery.fromJson(json['apronRight'])
            : null;
        bonnetPatti = json['bonnetPatti'] != null
            ? new Battery.fromJson(json['bonnetPatti'])
            : null;
        boot = json['boot'] != null ? new Battery.fromJson(json['boot']) : null;
        bumperFront = json['bumperFront'] != null
            ? new Battery.fromJson(json['bumperFront'])
            : null;
        bumperRear = json['bumperRear'] != null
            ? new Battery.fromJson(json['bumperRear'])
            : null;
        chassisExtension = json['chassisExtension'] != null
            ? new Battery.fromJson(json['chassisExtension'])
            : null;
        cowlTop =
        json['cowlTop'] != null ? new Battery.fromJson(json['cowlTop']) : null;
        dickyDoor = json['dickyDoor'] != null
            ? new Battery.fromJson(json['dickyDoor'])
            : null;
        doorFrontLeft = json['doorFrontLeft'] != null
            ? new Battery.fromJson(json['doorFrontLeft'])
            : null;
        doorFrontRight = json['doorFrontRight'] != null
            ? new Battery.fromJson(json['doorFrontRight'])
            : null;
        doorGlassLeft = json['doorGlassLeft'] != null
            ? new Battery.fromJson(json['doorGlassLeft'])
            : null;
        doorGlassRight = json['doorGlassRight'] != null
            ? new Battery.fromJson(json['doorGlassRight'])
            : null;
        doorRearLeft = json['doorRearLeft'] != null
            ? new Battery.fromJson(json['doorRearLeft'])
            : null;
        doorRearRight = json['doorRearRight'] != null
            ? new Battery.fromJson(json['doorRearRight'])
            : null;
        fenderLeft = json['fenderLeft'] != null
            ? new Battery.fromJson(json['fenderLeft'])
            : null;
        fenderRight = json['fenderRight'] != null
            ? new Battery.fromJson(json['fenderRight'])
            : null;
        firewall = json['firewall'] != null
            ? new Battery.fromJson(json['firewall'])
            : null;
        frontTyreLeft = json['frontTyreLeft'] != null
            ? new Battery.fromJson(json['frontTyreLeft'])
            : null;
        frontTyreRight = json['frontTyreRight'] != null
            ? new Battery.fromJson(json['frontTyreRight'])
            : null;
        frontWindShield = json['frontWindShield'] != null
            ? new Battery.fromJson(json['frontWindShield'])
            : null;
        fuelLid =
        json['fuelLid'] != null ? new Battery.fromJson(json['fuelLid']) : null;
        fullBodyRepaint = json['fullBodyRepaint'];
        grill = json['grill'] != null ? new Battery.fromJson(json['grill']) : null;
        headLightLeft = json['headLightLeft'] != null
            ? new Battery.fromJson(json['headLightLeft'])
            : null;
        headLightRight = json['headLightRight'] != null
            ? new Battery.fromJson(json['headLightRight'])
            : null;
        headLightSupport = json['headLightSupport'] != null
            ? new Battery.fromJson(json['headLightSupport'])
            : null;
        jackAndTool = json['jackAndTool'];
        leftApillar = json['leftApillar'] != null
            ? new Battery.fromJson(json['leftApillar'])
            : null;
        leftBpillar = json['leftBpillar'] != null
            ? new Battery.fromJson(json['leftBpillar'])
            : null;
        leftCpillar = json['leftCpillar'] != null
            ? new Battery.fromJson(json['leftCpillar'])
            : null;
        leftImage = json['leftImage'] != null
            ? new Battery.fromJson(json['leftImage'])
            : null;
        lowerCrossMember = json['lowerCrossMember'] != null
            ? new Battery.fromJson(json['lowerCrossMember'])
            : null;
        missingParts = json['missingParts'];
        quarterGlass = json['quarterGlass'] != null
            ? new Battery.fromJson(json['quarterGlass'])
            : null;
        quarterPanelLeft = json['quarterPanelLeft'] != null
            ? new Battery.fromJson(json['quarterPanelLeft'])
            : null;
        quarterPanelRight = json['quarterPanelRight'] != null
            ? new Battery.fromJson(json['quarterPanelRight'])
            : null;
        rearTyreLeft = json['rearTyreLeft'] != null
            ? new Battery.fromJson(json['rearTyreLeft'])
            : null;
        rearTyreRight = json['rearTyreRight'] != null
            ? new Battery.fromJson(json['rearTyreRight'])
            : null;
        rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
            ? new Battery.fromJson(json['rearViewMirrorLeft'])
            : null;
        rearViewMirrorRight = json['rearViewMirrorRight'] != null
            ? new Battery.fromJson(json['rearViewMirrorRight'])
            : null;
        rearWindShield = json['rearWindShield'] != null
            ? new Battery.fromJson(json['rearWindShield'])
            : null;
        rearWiper = json['rearWiper'] != null
            ? new Battery.fromJson(json['rearWiper'])
            : null;
        rightApillar = json['rightApillar'] != null
            ? new Battery.fromJson(json['rightApillar'])
            : null;
        rightBpillar = json['rightBpillar'] != null
            ? new Battery.fromJson(json['rightBpillar'])
            : null;
        rightCpillar = json['rightCpillar'] != null
            ? new Battery.fromJson(json['rightCpillar'])
            : null;
        rightImage = json['rightImage'] != null
            ? new Battery.fromJson(json['rightImage'])
            : null;
        roof = json['roof'] != null ? new Battery.fromJson(json['roof']) : null;
        runnningBorderLeft = json['runnningBorderLeft'] != null
            ? new Battery.fromJson(json['runnningBorderLeft'])
            : null;
        runnningBorderRight = json['runnningBorderRight'] != null
            ? new Battery.fromJson(json['runnningBorderRight'])
            : null;
        spareWheel = json['spareWheel'] != null
            ? new Battery.fromJson(json['spareWheel'])
            : null;
        tailLightLeft = json['tailLightLeft'] != null
            ? new Battery.fromJson(json['tailLightLeft'])
            : null;
        tailLightRight = json['tailLightRight'] != null
            ? new Battery.fromJson(json['tailLightRight'])
            : null;
        upperCrossMember = json['upperCrossMember'] != null
            ? new Battery.fromJson(json['upperCrossMember'])
            : null;
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
        carElectrical = json['carElectrical'] != null
            ? new Battery.fromJson(json['carElectrical'])
            : null;
        clusterPanel = json['clusterPanel'] != null
            ? new ClusterPanel.fromJson(json['clusterPanel'])
            : null;
        cngKitImage = json['cngKitImage'] != null
            ? new Battery.fromJson(json['cngKitImage'])
            : null;
        combitionSwitch = json['combitionSwitch'];
        dashboardCondition = json['dashboardCondition'];
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
        key = json['key'];
        platformImage = json['platformImage'] != null
            ? new Battery.fromJson(json['platformImage'])
            : null;
        powerWindowCentalLock = json['powerWindowCentalLock'] != null
            ? new ClusterPanel.fromJson(json['powerWindowCentalLock'])
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
            ? new ClusterPanel.fromJson(json['rearViewMirror'])
            : null;
        secondKey = json['secondKey'];
        warningDetails = json['warningDetails'];
        brakes = json['brakes'];
        clutchSystem = json['clutchSystem'];
        cruiseControl = json['cruiseControl'];
        seatAdjustment = json['seatAdjustment'];
        steeringAdjustment = json['steeringAdjustment'];
        steeringMountedAudioControl = json['steeringMountedAudioControl'];
        steeringSystem = json['steeringSystem'];
        transmissionManual = json['transmissionManual'];
        absEbd = json['absEbd'] != null
            ? new ClusterPanel.fromJson(json['absEbd'])
            : null;
        airbag = json['airbag'] != null
            ? new ClusterPanel.fromJson(json['airbag'])
            : null;
        alloyWheels = json['alloyWheels'] != null
            ? new ClusterPanel.fromJson(json['alloyWheels'])
            : null;
        anyInteriorModifications = json['anyInteriorModifications'];
        fogLamps = json['fogLamps'];
        gloveBox = json['gloveBox'] != null
            ? new ClusterPanel.fromJson(json['gloveBox'])
            : null;
        gpsNavigation = json['gpsNavigation'];
        keylessEntry = json['keylessEntry'] != null
            ? new ClusterPanel.fromJson(json['keylessEntry'])
            : null;
        rearDefogger = json['rearDefogger'];
        rearParkingSensor = json['rearParkingSensor'];
        seatBelt = json['seatBelt'];
        stereoBrand = json['stereoBrand'];
        stereoImage = json['stereoImage'] != null
            ? new Battery.fromJson(json['stereoImage'])
            : null;
        sunroof = json['sunroof'] != null
            ? new ClusterPanel.fromJson(json['sunroof'])
            : null;
        acBlowerGrill = json['acBlowerGrill'];
        acFilterDamaged = json['acFilterDamaged'];
        acWorking = json['acWorking'];
        climateControl = json['climateControl'];
        heater = json['heater'];
        carCondition = json['carCondition'];
        specialComments = json['specialComments'];
        engineStar = json['engineStar'];
        exteriorStar = json['exteriorStar'];
        interiorAndElectricalStar = json['interiorAndElectricalStar'];
        testDriveStar = json['testDriveStar'];
        uniqueId = json['uniqueId'];
        make = json['make'];
        model = json['model'];
        variant = json['variant'];
        maskedRegNumber = json['maskedRegNumber'];
        vehicleLocation = json['vehicleLocation'];
        ownershipNumber = json['ownershipNumber'];
        fuelType = json['fuelType'];
        qcStatus = json['qcStatus'];
        highestBid = json['highestBid'];
        totalBidder = json['totalBidder'];
        status = json['status'];
        front = json['front'] != null ? new Battery.fromJson(json['front']) : null;
        frontLeft = json['frontLeft'] != null
            ? new Battery.fromJson(json['frontLeft'])
            : null;
        frontRight = json['frontRight'] != null
            ? new Battery.fromJson(json['frontRight'])
            : null;
        rear = json['rear'] != null ? new Battery.fromJson(json['rear']) : null;
        rearLeft = json['rearLeft'] != null
            ? new Battery.fromJson(json['rearLeft'])
            : null;
        rearRight = json['rearRight'] != null
            ? new Battery.fromJson(json['rearRight'])
            : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['engineCylinder'] = this.engineCylinder;
        data['evaluationStatusForEngine'] = this.evaluationStatusForEngine;
        data['createdAt'] = this.createdAt;
        data['updatedAt'] = this.updatedAt;
        if (this.battery != null) {
            data['battery'] = this.battery!.toJson();
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
        if (this.engineCompartment != null) {
            data['engineCompartment'] = this.engineCompartment!.toJson();
        }
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
        if (this.cowlTop != null) {
            data['cowlTop'] = this.cowlTop!.toJson();
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
        if (this.carElectrical != null) {
            data['carElectrical'] = this.carElectrical!.toJson();
        }
        if (this.clusterPanel != null) {
            data['clusterPanel'] = this.clusterPanel!.toJson();
        }
        if (this.cngKitImage != null) {
            data['cngKitImage'] = this.cngKitImage!.toJson();
        }
        data['combitionSwitch'] = this.combitionSwitch;
        data['dashboardCondition'] = this.dashboardCondition;
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
        data['key'] = this.key;
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
        data['brakes'] = this.brakes;
        data['clutchSystem'] = this.clutchSystem;
        data['cruiseControl'] = this.cruiseControl;
        data['seatAdjustment'] = this.seatAdjustment;
        data['steeringAdjustment'] = this.steeringAdjustment;
        data['steeringMountedAudioControl'] = this.steeringMountedAudioControl;
        data['steeringSystem'] = this.steeringSystem;
        data['transmissionManual'] = this.transmissionManual;
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
        data['rearDefogger'] = this.rearDefogger;
        data['rearParkingSensor'] = this.rearParkingSensor;
        data['seatBelt'] = this.seatBelt;
        data['stereoBrand'] = this.stereoBrand;
        if (this.stereoImage != null) {
            data['stereoImage'] = this.stereoImage!.toJson();
        }
        if (this.sunroof != null) {
            data['sunroof'] = this.sunroof!.toJson();
        }
        data['acBlowerGrill'] = this.acBlowerGrill;
        data['acFilterDamaged'] = this.acFilterDamaged;
        data['acWorking'] = this.acWorking;
        data['climateControl'] = this.climateControl;
        data['heater'] = this.heater;
        data['carCondition'] = this.carCondition;
        data['specialComments'] = this.specialComments;
        data['engineStar'] = this.engineStar;
        data['exteriorStar'] = this.exteriorStar;
        data['interiorAndElectricalStar'] = this.interiorAndElectricalStar;
        data['testDriveStar'] = this.testDriveStar;
        data['uniqueId'] = this.uniqueId;
        data['make'] = this.make;
        data['model'] = this.model;
        data['variant'] = this.variant;
        data['maskedRegNumber'] = this.maskedRegNumber;
        data['vehicleLocation'] = this.vehicleLocation;
        data['ownershipNumber'] = this.ownershipNumber;
        data['fuelType'] = this.fuelType;
        data['qcStatus'] = this.qcStatus;
        data['highestBid'] = this.highestBid;
        data['totalBidder'] = this.totalBidder;
        data['status'] = this.status;
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

class ClusterPanel {
    String? name;
    String? url;
    List<String>? condition;

    ClusterPanel({this.name, this.url, this.condition});

    ClusterPanel.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        url = json['url'];
        condition = json['condition'].cast<String>();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['url'] = this.url;
        data['condition'] = this.condition;
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
