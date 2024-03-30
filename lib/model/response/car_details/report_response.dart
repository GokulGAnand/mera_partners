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
    String? chasisNumber;
    String? monthAndYearOfManufacture;
    String? regDate;
    String? rto;
    String? bodyType;
    String? color;
    num? odometerReading;
    String? rcAvailability;
    String? insurance;
    String? ncb;
    String? hypothecation;
    String? loanStatus;
    String? loanNoc;
    String? form35;
    String? rcMismatch;
    String? duplicateKey;
    String? regNumber;
    String? customerPrice;

    Data(
        {this.sId,
            this.allCarInfo,
            this.chasisNumber,
            this.monthAndYearOfManufacture,
            this.regDate,
            this.rto,
            this.bodyType,
            this.color,
            this.odometerReading,
            this.rcAvailability,
            this.insurance,
            this.ncb,
            this.hypothecation,
            this.loanStatus,
            this.loanNoc,
            this.form35,
            this.rcMismatch,
            this.duplicateKey,
            this.regNumber,
            this.customerPrice});

    Data.fromJson(Map<String, dynamic> json) {
        sId = json['_id'];
        allCarInfo = json['allCarInfo'] != null
            ? AllCarInfo.fromJson(json['allCarInfo'])
            : null;
        chasisNumber = json['chasisNumber'];
        monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
        regDate = json['regDate'];
        rto = json['rto'];
        bodyType = json['bodyType'];
        color = json['color'];
        odometerReading = json['odometerReading'];
        rcAvailability = json['rcAvailability'];
        insurance = json['insurance'];
        ncb = json['ncb'];
        hypothecation = json['hypothecation'];
        loanStatus = json['loanStatus'];
        loanNoc = json['loanNoc'];
        form35 = json['form35'];
        rcMismatch = json['rcMismatch'];
        duplicateKey = json['duplicateKey'];
        regNumber = json['regNumber'];
        customerPrice = json['customerPrice'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['_id'] = sId;
        if (allCarInfo != null) {
            data['allCarInfo'] = allCarInfo!.toJson();
        }
        data['chasisNumber'] = chasisNumber;
        data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
        data['regDate'] = regDate;
        data['rto'] = rto;
        data['bodyType'] = bodyType;
        data['color'] = color;
        data['odometerReading'] = odometerReading;
        data['rcAvailability'] = rcAvailability;
        data['insurance'] = insurance;
        data['ncb'] = ncb;
        data['hypothecation'] = hypothecation;
        data['loanStatus'] = loanStatus;
        data['loanNoc'] = loanNoc;
        data['form35'] = form35;
        data['rcMismatch'] = rcMismatch;
        data['duplicateKey'] = duplicateKey;
        data['regNumber'] = regNumber;
        data['customerPrice'] = customerPrice;
        return data;
    }
}

class AllCarInfo {
    num? engineCylinder;
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
    num? realValue;
    String? specialComments;
    num? engineStar;
    num? exteriorStar;
    num? interiorAndElectricalStar;
    num? testDriveStar;
    num? uniqueId;
    String? make;
    String? model;
    String? variant;
    String? maskedRegNumber;
    String? vehicleLocation;
    String? ownershipNumber;
    String? fuelType;
    String? transmission;
    String? qcStatus;
    num? highestBid;
    num? totalBidder;
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
            this.realValue,
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
            this.transmission,
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
        json['battery'] != null ? Battery.fromJson(json['battery']) : null;
        blowBy =
        json['blowBy'] != null ? Battery.fromJson(json['blowBy']) : null;
        clutch =
        json['clutch'] != null ? Battery.fromJson(json['clutch']) : null;
        coolant = json['coolant'];
        engine =
        json['engine'] != null ? Battery.fromJson(json['engine']) : null;
        engineComment = json['engineComment'];
        engineCompartment = json['engineCompartment'] != null
            ? Battery.fromJson(json['engineCompartment'])
            : null;
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
        apronLeft = json['apronLeft'] != null
            ? Battery.fromJson(json['apronLeft'])
            : null;
        apronRight = json['apronRight'] != null
            ? Battery.fromJson(json['apronRight'])
            : null;
        bonnetPatti = json['bonnetPatti'] != null
            ? Battery.fromJson(json['bonnetPatti'])
            : null;
        boot = json['boot'] != null ? Battery.fromJson(json['boot']) : null;
        bumperFront = json['bumperFront'] != null
            ? Battery.fromJson(json['bumperFront'])
            : null;
        bumperRear = json['bumperRear'] != null
            ? Battery.fromJson(json['bumperRear'])
            : null;
        chassisExtension = json['chassisExtension'] != null
            ? Battery.fromJson(json['chassisExtension'])
            : null;
        cowlTop =
        json['cowlTop'] != null ? Battery.fromJson(json['cowlTop']) : null;
        dickyDoor = json['dickyDoor'] != null
            ? Battery.fromJson(json['dickyDoor'])
            : null;
        doorFrontLeft = json['doorFrontLeft'] != null
            ? Battery.fromJson(json['doorFrontLeft'])
            : null;
        doorFrontRight = json['doorFrontRight'] != null
            ? Battery.fromJson(json['doorFrontRight'])
            : null;
        doorGlassLeft = json['doorGlassLeft'] != null
            ? Battery.fromJson(json['doorGlassLeft'])
            : null;
        doorGlassRight = json['doorGlassRight'] != null
            ? Battery.fromJson(json['doorGlassRight'])
            : null;
        doorRearLeft = json['doorRearLeft'] != null
            ? Battery.fromJson(json['doorRearLeft'])
            : null;
        doorRearRight = json['doorRearRight'] != null
            ? Battery.fromJson(json['doorRearRight'])
            : null;
        fenderLeft = json['fenderLeft'] != null
            ? Battery.fromJson(json['fenderLeft'])
            : null;
        fenderRight = json['fenderRight'] != null
            ? Battery.fromJson(json['fenderRight'])
            : null;
        firewall = json['firewall'] != null
            ? Battery.fromJson(json['firewall'])
            : null;
        frontTyreLeft = json['frontTyreLeft'] != null
            ? Battery.fromJson(json['frontTyreLeft'])
            : null;
        frontTyreRight = json['frontTyreRight'] != null
            ? Battery.fromJson(json['frontTyreRight'])
            : null;
        frontWindShield = json['frontWindShield'] != null
            ? Battery.fromJson(json['frontWindShield'])
            : null;
        fuelLid =
        json['fuelLid'] != null ? Battery.fromJson(json['fuelLid']) : null;
        fullBodyRepaint = json['fullBodyRepaint'];
        grill = json['grill'] != null ? Battery.fromJson(json['grill']) : null;
        headLightLeft = json['headLightLeft'] != null
            ? Battery.fromJson(json['headLightLeft'])
            : null;
        headLightRight = json['headLightRight'] != null
            ? Battery.fromJson(json['headLightRight'])
            : null;
        headLightSupport = json['headLightSupport'] != null
            ? Battery.fromJson(json['headLightSupport'])
            : null;
        jackAndTool = json['jackAndTool'];
        leftApillar = json['leftApillar'] != null
            ? Battery.fromJson(json['leftApillar'])
            : null;
        leftBpillar = json['leftBpillar'] != null
            ? Battery.fromJson(json['leftBpillar'])
            : null;
        leftCpillar = json['leftCpillar'] != null
            ? Battery.fromJson(json['leftCpillar'])
            : null;
        leftImage = json['leftImage'] != null
            ? Battery.fromJson(json['leftImage'])
            : null;
        lowerCrossMember = json['lowerCrossMember'] != null
            ? Battery.fromJson(json['lowerCrossMember'])
            : null;
        missingParts = json['missingParts'];
        quarterGlass = json['quarterGlass'] != null
            ? Battery.fromJson(json['quarterGlass'])
            : null;
        quarterPanelLeft = json['quarterPanelLeft'] != null
            ? Battery.fromJson(json['quarterPanelLeft'])
            : null;
        quarterPanelRight = json['quarterPanelRight'] != null
            ? Battery.fromJson(json['quarterPanelRight'])
            : null;
        rearTyreLeft = json['rearTyreLeft'] != null
            ? Battery.fromJson(json['rearTyreLeft'])
            : null;
        rearTyreRight = json['rearTyreRight'] != null
            ? Battery.fromJson(json['rearTyreRight'])
            : null;
        rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
            ? Battery.fromJson(json['rearViewMirrorLeft'])
            : null;
        rearViewMirrorRight = json['rearViewMirrorRight'] != null
            ? Battery.fromJson(json['rearViewMirrorRight'])
            : null;
        rearWindShield = json['rearWindShield'] != null
            ? Battery.fromJson(json['rearWindShield'])
            : null;
        rearWiper = json['rearWiper'] != null
            ? Battery.fromJson(json['rearWiper'])
            : null;
        rightApillar = json['rightApillar'] != null
            ? Battery.fromJson(json['rightApillar'])
            : null;
        rightBpillar = json['rightBpillar'] != null
            ? Battery.fromJson(json['rightBpillar'])
            : null;
        rightCpillar = json['rightCpillar'] != null
            ? Battery.fromJson(json['rightCpillar'])
            : null;
        rightImage = json['rightImage'] != null
            ? Battery.fromJson(json['rightImage'])
            : null;
        roof = json['roof'] != null ? Battery.fromJson(json['roof']) : null;
        runnningBorderLeft = json['runnningBorderLeft'] != null
            ? Battery.fromJson(json['runnningBorderLeft'])
            : null;
        runnningBorderRight = json['runnningBorderRight'] != null
            ? Battery.fromJson(json['runnningBorderRight'])
            : null;
        spareWheel = json['spareWheel'] != null
            ? Battery.fromJson(json['spareWheel'])
            : null;
        tailLightLeft = json['tailLightLeft'] != null
            ? Battery.fromJson(json['tailLightLeft'])
            : null;
        tailLightRight = json['tailLightRight'] != null
            ? Battery.fromJson(json['tailLightRight'])
            : null;
        upperCrossMember = json['upperCrossMember'] != null
            ? Battery.fromJson(json['upperCrossMember'])
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
            ? Battery.fromJson(json['carElectrical'])
            : null;
        clusterPanel = json['clusterPanel'] != null
            ? ClusterPanel.fromJson(json['clusterPanel'])
            : null;
        cngKitImage = json['cngKitImage'] != null
            ? Battery.fromJson(json['cngKitImage'])
            : null;
        combitionSwitch = json['combitionSwitch'];
        dashboardCondition = json['dashboardCondition'];
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
        key = json['key'];
        platformImage = json['platformImage'] != null
            ? Battery.fromJson(json['platformImage'])
            : null;
        powerWindowCentalLock = json['powerWindowCentalLock'] != null
            ? ClusterPanel.fromJson(json['powerWindowCentalLock'])
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
            ? ClusterPanel.fromJson(json['rearViewMirror'])
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
            ? ClusterPanel.fromJson(json['absEbd'])
            : null;
        airbag = json['airbag'] != null
            ? ClusterPanel.fromJson(json['airbag'])
            : null;
        alloyWheels = json['alloyWheels'] != null
            ? ClusterPanel.fromJson(json['alloyWheels'])
            : null;
        anyInteriorModifications = json['anyInteriorModifications'];
        fogLamps = json['fogLamps'];
        gloveBox = json['gloveBox'] != null
            ? ClusterPanel.fromJson(json['gloveBox'])
            : null;
        gpsNavigation = json['gpsNavigation'];
        keylessEntry = json['keylessEntry'] != null
            ? ClusterPanel.fromJson(json['keylessEntry'])
            : null;
        rearDefogger = json['rearDefogger'];
        rearParkingSensor = json['rearParkingSensor'];
        seatBelt = json['seatBelt'];
        stereoBrand = json['stereoBrand'];
        stereoImage = json['stereoImage'] != null
            ? Battery.fromJson(json['stereoImage'])
            : null;
        sunroof = json['sunroof'] != null
            ? ClusterPanel.fromJson(json['sunroof'])
            : null;
        acBlowerGrill = json['acBlowerGrill'];
        acFilterDamaged = json['acFilterDamaged'];
        acWorking = json['acWorking'];
        climateControl = json['climateControl'];
        heater = json['heater'];
        carCondition = json['carCondition'];
        realValue = json['realValue'];
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
        transmission = json['transmission'];
        qcStatus = json['qcStatus'];
        highestBid = json['highestBid'];
        totalBidder = json['totalBidder'];
        status = json['status'];
        front = json['front'] != null ? Battery.fromJson(json['front']) : null;
        frontLeft = json['frontLeft'] != null
            ? Battery.fromJson(json['frontLeft'])
            : null;
        frontRight = json['frontRight'] != null
            ? Battery.fromJson(json['frontRight'])
            : null;
        rear = json['rear'] != null ? Battery.fromJson(json['rear']) : null;
        rearLeft = json['rearLeft'] != null
            ? Battery.fromJson(json['rearLeft'])
            : null;
        rearRight = json['rearRight'] != null
            ? Battery.fromJson(json['rearRight'])
            : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['engineCylinder'] = engineCylinder;
        data['evaluationStatusForEngine'] = evaluationStatusForEngine;
        data['createdAt'] = createdAt;
        data['updatedAt'] = updatedAt;
        if (battery != null) {
            data['battery'] = battery!.toJson();
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
        if (engineCompartment != null) {
            data['engineCompartment'] = engineCompartment!.toJson();
        }
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
        if (cowlTop != null) {
            data['cowlTop'] = cowlTop!.toJson();
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
        if (carElectrical != null) {
            data['carElectrical'] = carElectrical!.toJson();
        }
        if (clusterPanel != null) {
            data['clusterPanel'] = clusterPanel!.toJson();
        }
        if (cngKitImage != null) {
            data['cngKitImage'] = cngKitImage!.toJson();
        }
        data['combitionSwitch'] = combitionSwitch;
        data['dashboardCondition'] = dashboardCondition;
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
        data['key'] = key;
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
        data['brakes'] = brakes;
        data['clutchSystem'] = clutchSystem;
        data['cruiseControl'] = cruiseControl;
        data['seatAdjustment'] = seatAdjustment;
        data['steeringAdjustment'] = steeringAdjustment;
        data['steeringMountedAudioControl'] = steeringMountedAudioControl;
        data['steeringSystem'] = steeringSystem;
        data['transmissionManual'] = transmissionManual;
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
        data['rearDefogger'] = rearDefogger;
        data['rearParkingSensor'] = rearParkingSensor;
        data['seatBelt'] = seatBelt;
        data['stereoBrand'] = stereoBrand;
        if (stereoImage != null) {
            data['stereoImage'] = stereoImage!.toJson();
        }
        if (sunroof != null) {
            data['sunroof'] = sunroof!.toJson();
        }
        data['acBlowerGrill'] = acBlowerGrill;
        data['acFilterDamaged'] = acFilterDamaged;
        data['acWorking'] = acWorking;
        data['climateControl'] = climateControl;
        data['heater'] = heater;
        data['carCondition'] = carCondition;
        data['realValue'] = realValue;
        data['specialComments'] = specialComments;
        data['engineStar'] = engineStar;
        data['exteriorStar'] = exteriorStar;
        data['interiorAndElectricalStar'] = interiorAndElectricalStar;
        data['testDriveStar'] = testDriveStar;
        data['uniqueId'] = uniqueId;
        data['make'] = make;
        data['model'] = model;
        data['variant'] = variant;
        data['maskedRegNumber'] = maskedRegNumber;
        data['vehicleLocation'] = vehicleLocation;
        data['ownershipNumber'] = ownershipNumber;
        data['fuelType'] = fuelType;
        data['transmission'] = transmission;
        data['qcStatus'] = qcStatus;
        data['highestBid'] = highestBid;
        data['totalBidder'] = totalBidder;
        data['status'] = status;
        if (front != null) {
            data['front'] = front!.toJson();
        }
        if (frontLeft != null) {
            data['frontLeft'] = frontLeft!.toJson();
        }
        if (frontRight != null) {
            data['frontRight'] = frontRight!.toJson();
        }
        if (rear != null) {
            data['rear'] = rear!.toJson();
        }
        if (rearLeft != null) {
            data['rearLeft'] = rearLeft!.toJson();
        }
        if (rearRight != null) {
            data['rearRight'] = rearRight!.toJson();
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data['name'] = name;
        data['url'] = url;
        data['condition'] = condition;
        data['remarks'] = remarks;
        return data;
    }
}

class ClusterPanel {
    String? name;
    String? url;
    String? remarks;
    List<String>? condition;

    ClusterPanel({this.name, this.url, this.remarks, this.condition});

    ClusterPanel.fromJson(Map<String, dynamic> json) {
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
