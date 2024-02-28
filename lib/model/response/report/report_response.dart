// To parse this JSON data, do
//
//     final reportResponse = reportResponseFromJson(jsonString);

import 'dart:convert';

ReportResponse reportResponseFromJson(String str) => ReportResponse.fromJson(json.decode(str));

String reportResponseToJson(ReportResponse data) => json.encode(data.toJson());

class ReportResponse {
    final String? status;
    final String? message;
    final Data? data;
    final Meta? meta;

    ReportResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory ReportResponse.fromJson(Map<String, dynamic> json) => ReportResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Data {
    final String? id;
    final AllCarInfo? allCarInfo;
    final String? chasisNumber;
    final String? monthAndYearOfManufacture;
    final String? regDate;
    final String? bodyType;
    final String? color;
    final int? odometerReading;
    final String? rcAvailability;
    final String? insurance;
    final String? form35;
    final String? regNumber;
    final String? customerPrice;

    Data({
        this.id,
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
        this.customerPrice,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        allCarInfo: json["allCarInfo"] == null ? null : AllCarInfo.fromJson(json["allCarInfo"]),
        chasisNumber: json["chasisNumber"],
        monthAndYearOfManufacture: json["monthAndYearOfManufacture"],
        regDate: json["regDate"],
        bodyType: json["bodyType"],
        color: json["color"],
        odometerReading: json["odometerReading"],
        rcAvailability: json["rcAvailability"],
        insurance: json["insurance"],
        form35: json["form35"],
        regNumber: json["regNumber"],
        customerPrice: json["customerPrice"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "allCarInfo": allCarInfo?.toJson(),
        "chasisNumber": chasisNumber,
        "monthAndYearOfManufacture": monthAndYearOfManufacture,
        "regDate": regDate,
        "bodyType": bodyType,
        "color": color,
        "odometerReading": odometerReading,
        "rcAvailability": rcAvailability,
        "insurance": insurance,
        "form35": form35,
        "regNumber": regNumber,
        "customerPrice": customerPrice,
    };
}

class AllCarInfo {
    final int? engineCylinder;
    final String? evaluationStatusForEngine;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final ApronLeft? battery;
    final ApronLeft? blowBy;
    final ApronLeft? clutch;
    final String? engineComment;
    final ApronLeft? engineCompartment;
    final List<String>? engineCondition;
    final ApronLeft? engineOil;
    final String? engineSound;
    final CngKitImage? engineTappetVideo;
    final String? exhaustSmoke;
    final ApronLeft? gearBox;
    final String? radiator;
    final String? silencer;
    final String? compression;
    final String? coolant;
    final String? gearBoxLeakage;
    final ApronLeft? mount;
    final ApronLeft? startVideo;
    final String? startingMotor;
    final String? summary;
    final ApronLeft? sump;
    final ApronLeft? turboCharger;
    final ApronLeft? engine;
    final String? evaluationStatusForExterior;
    final ApronLeft? apronLeft;
    final ApronLeft? apronRight;
    final ApronLeft? bonnetPatti;
    final ApronLeft? boot;
    final ApronLeft? bumperFront;
    final ApronLeft? bumperRear;
    final ApronLeft? chassisExtension;
    final ApronLeft? dickyDoor;
    final ApronLeft? doorFrontLeft;
    final ApronLeft? doorFrontRight;
    final ApronLeft? doorGlassLeft;
    final ApronLeft? doorGlassRight;
    final ApronLeft? doorRearLeft;
    final ApronLeft? doorRearRight;
    final ApronLeft? fenderLeft;
    final ApronLeft? fenderRight;
    final ApronLeft? firewall;
    final ApronLeft? fogLightLeft;
    final ApronLeft? fogLightRight;
    final FrontTyreLeft? frontTyreLeft;
    final FrontTyreLeft? frontTyreRight;
    final ApronLeft? frontWindShield;
    final ApronLeft? fuelLid;
    final String? fullBodyRepaint;
    final ApronLeft? grill;
    final ApronLeft? headLightLeft;
    final ApronLeft? headLightRight;
    final ApronLeft? headLightSupport;
    final String? jackAndTool;
    final ApronLeft? leftApillar;
    final ApronLeft? leftBpillar;
    final ApronLeft? leftCpillar;
    final CngKitImage? leftImage;
    final ApronLeft? lowerCrossMember;
    final String? missingParts;
    final ApronLeft? quarterGlass;
    final ApronLeft? quarterPanelLeft;
    final ApronLeft? quarterPanelRight;
    final FrontTyreLeft? rearTyreLeft;
    final FrontTyreLeft? rearTyreRight;
    final ApronLeft? rearViewMirrorLeft;
    final ApronLeft? rearViewMirrorRight;
    final ApronLeft? rearWindShield;
    final ApronLeft? rearWiper;
    final ApronLeft? rightApillar;
    final ApronLeft? rightBpillar;
    final ApronLeft? rightCpillar;
    final CngKitImage? rightImage;
    final ApronLeft? roof;
    final ApronLeft? runnningBorderLeft;
    final ApronLeft? runnningBorderRight;
    final ApronLeft? spareWheel;
    final ApronLeft? tailLightLeft;
    final ApronLeft? tailLightRight;
    final ApronLeft? upperCrossMember;
    final ApronLeft? cowlTop;
    final String? evaluationStatusForInterior;
    final String? transmission;
    final String? evaluationStatusForTestDrive;
    final String? evaluationStatusForFeature;
    final String? evaluationStatusForAc;
    final String? carCondition;
    final String? specialComments;
    final List<String>? carElectrical;
    final List<String>? clusterPanel;
    final String? combitionSwitch;
    final String? dashboardCondition;
    final String? dashboardSwitch;
    final List<String>? handBreak;
    final double? interiorStar;
    final CngKitImage? interiorView;
    final String? key;
    final List<String>? platform;
    final List<String>? powerWindowCentalLock;
    final String? pushButton;
    final List<String>? rearViewMirror;
    final String? secondKey;
    final String? warningDetails;
    final String? brakes;
    final String? clutchSystem;
    final String? cruiseControl;
    final String? seatAdjustment;
    final String? shocker;
    final String? steeringAdjustment;
    final String? steeringMountedAudioControl;
    final String? steeringSystem;
    final List<String>? steeringWheel;
    final List<String>? suspension;
    final List<String>? transmissionAutomatic;
    final String? transmissionManual;
    final List<String>? vehicleHorn;
    final List<String>? absEbd;
    final List<String>? airbag;
    final List<String>? alloyWheels;
    final String? anyInteriorModifications;
    final String? fogLamps;
    final List<String>? gloveBox;
    final String? gpsNavigation;
    final List<String>? keylessEntry;
    final String? rearDefogger;
    final String? rearParkingSensor;
    final String? remoteCentalLock;
    final String? seatBelt;
    final String? stereoBrand;
    final List<String>? sunroof;
    final String? toolKit;
    final String? acBlowerGrill;
    final String? acCompressor;
    final List<String>? acCondensor;
    final String? acFilterDamaged;
    final String? acWorking;
    final List<String>? airCooling;
    final String? climateControl;
    final String? heater;
    final int? engineStar;
    final int? exteriorStar;
    final int? testDriveStar;
    final ApronLeft? dashboardImage;
    final ApronLeft? frontSeatImage;
    final CngKitImage? handbreakImage;
    final CngKitImage? odometerImage;
    final CngKitImage? powerWindowDriverImage;
    final CngKitImage? pushWindowDriverImage;
    final ApronLeft? rearSeatImage;
    final double? electricalStar;
    final CngKitImage? cngKitImage;
    final CngKitImage? stereoImage;
    final double? interiorAndElectricalStar;
    final ApronLeft? platformImage;
    final int? uniqueId;
    final String? make;
    final String? model;
    final String? variant;
    final String? maskedRegNumber;
    final String? vehicleLocation;
    final String? ownershipNumber;
    final String? fuelType;
    final String? qcStatus;
    final int? highestBid;
    final int? totalBidder;
    final String? status;
    final CngKitImage? front;
    final CngKitImage? frontLeft;
    final CngKitImage? frontRight;
    final CngKitImage? frontWithHoodOpen;
    final CngKitImage? rear;
    final CngKitImage? rearBootOpen;
    final CngKitImage? rearLeft;
    final CngKitImage? rearRight;

    AllCarInfo({
        this.engineCylinder,
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
        this.engine,
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
        this.interiorAndElectricalStar,
        this.platformImage,
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
        this.frontWithHoodOpen,
        this.rear,
        this.rearBootOpen,
        this.rearLeft,
        this.rearRight,
    });

    factory AllCarInfo.fromJson(Map<String, dynamic> json) => AllCarInfo(
        engineCylinder: json["engineCylinder"],
        evaluationStatusForEngine: json["evaluationStatusForEngine"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        battery: json["battery"] == null ? null : ApronLeft.fromJson(json["battery"]),
        blowBy: json["blowBy"] == null ? null : ApronLeft.fromJson(json["blowBy"]),
        clutch: json["clutch"] == null ? null : ApronLeft.fromJson(json["clutch"]),
        engineComment: json["engineComment"],
        engineCompartment: json["engineCompartment"] == null ? null : ApronLeft.fromJson(json["engineCompartment"]),
        engineCondition: json["engineCondition"] == null ? [] : List<String>.from(json["engineCondition"]!.map((x) => x)),
        engineOil: json["engineOil"] == null ? null : ApronLeft.fromJson(json["engineOil"]),
        engineSound: json["engineSound"],
        engineTappetVideo: json["engineTappetVideo"] == null ? null : CngKitImage.fromJson(json["engineTappetVideo"]),
        exhaustSmoke: json["exhaustSmoke"],
        gearBox: json["gearBox"] == null ? null : ApronLeft.fromJson(json["gearBox"]),
        radiator: json["radiator"],
        silencer: json["silencer"],
        compression: json["compression"],
        coolant: json["coolant"],
        gearBoxLeakage: json["gearBoxLeakage"],
        mount: json["mount"] == null ? null : ApronLeft.fromJson(json["mount"]),
        startVideo: json["startVideo"] == null ? null : ApronLeft.fromJson(json["startVideo"]),
        startingMotor: json["startingMotor"],
        summary: json["summary"],
        sump: json["sump"] == null ? null : ApronLeft.fromJson(json["sump"]),
        turboCharger: json["turboCharger"] == null ? null : ApronLeft.fromJson(json["turboCharger"]),
        engine: json["engine"] == null ? null : ApronLeft.fromJson(json["engine"]),
        evaluationStatusForExterior: json["evaluationStatusForExterior"],
        apronLeft: json["apronLeft"] == null ? null : ApronLeft.fromJson(json["apronLeft"]),
        apronRight: json["apronRight"] == null ? null : ApronLeft.fromJson(json["apronRight"]),
        bonnetPatti: json["bonnetPatti"] == null ? null : ApronLeft.fromJson(json["bonnetPatti"]),
        boot: json["boot"] == null ? null : ApronLeft.fromJson(json["boot"]),
        bumperFront: json["bumperFront"] == null ? null : ApronLeft.fromJson(json["bumperFront"]),
        bumperRear: json["bumperRear"] == null ? null : ApronLeft.fromJson(json["bumperRear"]),
        chassisExtension: json["chassisExtension"] == null ? null : ApronLeft.fromJson(json["chassisExtension"]),
        dickyDoor: json["dickyDoor"] == null ? null : ApronLeft.fromJson(json["dickyDoor"]),
        doorFrontLeft: json["doorFrontLeft"] == null ? null : ApronLeft.fromJson(json["doorFrontLeft"]),
        doorFrontRight: json["doorFrontRight"] == null ? null : ApronLeft.fromJson(json["doorFrontRight"]),
        doorGlassLeft: json["doorGlassLeft"] == null ? null : ApronLeft.fromJson(json["doorGlassLeft"]),
        doorGlassRight: json["doorGlassRight"] == null ? null : ApronLeft.fromJson(json["doorGlassRight"]),
        doorRearLeft: json["doorRearLeft"] == null ? null : ApronLeft.fromJson(json["doorRearLeft"]),
        doorRearRight: json["doorRearRight"] == null ? null : ApronLeft.fromJson(json["doorRearRight"]),
        fenderLeft: json["fenderLeft"] == null ? null : ApronLeft.fromJson(json["fenderLeft"]),
        fenderRight: json["fenderRight"] == null ? null : ApronLeft.fromJson(json["fenderRight"]),
        firewall: json["firewall"] == null ? null : ApronLeft.fromJson(json["firewall"]),
        fogLightLeft: json["fogLightLeft"] == null ? null : ApronLeft.fromJson(json["fogLightLeft"]),
        fogLightRight: json["fogLightRight"] == null ? null : ApronLeft.fromJson(json["fogLightRight"]),
        frontTyreLeft: json["frontTyreLeft"] == null ? null : FrontTyreLeft.fromJson(json["frontTyreLeft"]),
        frontTyreRight: json["frontTyreRight"] == null ? null : FrontTyreLeft.fromJson(json["frontTyreRight"]),
        frontWindShield: json["frontWindShield"] == null ? null : ApronLeft.fromJson(json["frontWindShield"]),
        fuelLid: json["fuelLid"] == null ? null : ApronLeft.fromJson(json["fuelLid"]),
        fullBodyRepaint: json["fullBodyRepaint"],
        grill: json["grill"] == null ? null : ApronLeft.fromJson(json["grill"]),
        headLightLeft: json["headLightLeft"] == null ? null : ApronLeft.fromJson(json["headLightLeft"]),
        headLightRight: json["headLightRight"] == null ? null : ApronLeft.fromJson(json["headLightRight"]),
        headLightSupport: json["headLightSupport"] == null ? null : ApronLeft.fromJson(json["headLightSupport"]),
        jackAndTool: json["jackAndTool"],
        leftApillar: json["leftApillar"] == null ? null : ApronLeft.fromJson(json["leftApillar"]),
        leftBpillar: json["leftBpillar"] == null ? null : ApronLeft.fromJson(json["leftBpillar"]),
        leftCpillar: json["leftCpillar"] == null ? null : ApronLeft.fromJson(json["leftCpillar"]),
        leftImage: json["leftImage"] == null ? null : CngKitImage.fromJson(json["leftImage"]),
        lowerCrossMember: json["lowerCrossMember"] == null ? null : ApronLeft.fromJson(json["lowerCrossMember"]),
        missingParts: json["missingParts"],
        quarterGlass: json["quarterGlass"] == null ? null : ApronLeft.fromJson(json["quarterGlass"]),
        quarterPanelLeft: json["quarterPanelLeft"] == null ? null : ApronLeft.fromJson(json["quarterPanelLeft"]),
        quarterPanelRight: json["quarterPanelRight"] == null ? null : ApronLeft.fromJson(json["quarterPanelRight"]),
        rearTyreLeft: json["rearTyreLeft"] == null ? null : FrontTyreLeft.fromJson(json["rearTyreLeft"]),
        rearTyreRight: json["rearTyreRight"] == null ? null : FrontTyreLeft.fromJson(json["rearTyreRight"]),
        rearViewMirrorLeft: json["rearViewMirrorLeft"] == null ? null : ApronLeft.fromJson(json["rearViewMirrorLeft"]),
        rearViewMirrorRight: json["rearViewMirrorRight"] == null ? null : ApronLeft.fromJson(json["rearViewMirrorRight"]),
        rearWindShield: json["rearWindShield"] == null ? null : ApronLeft.fromJson(json["rearWindShield"]),
        rearWiper: json["rearWiper"] == null ? null : ApronLeft.fromJson(json["rearWiper"]),
        rightApillar: json["rightApillar"] == null ? null : ApronLeft.fromJson(json["rightApillar"]),
        rightBpillar: json["rightBpillar"] == null ? null : ApronLeft.fromJson(json["rightBpillar"]),
        rightCpillar: json["rightCpillar"] == null ? null : ApronLeft.fromJson(json["rightCpillar"]),
        rightImage: json["rightImage"] == null ? null : CngKitImage.fromJson(json["rightImage"]),
        roof: json["roof"] == null ? null : ApronLeft.fromJson(json["roof"]),
        runnningBorderLeft: json["runnningBorderLeft"] == null ? null : ApronLeft.fromJson(json["runnningBorderLeft"]),
        runnningBorderRight: json["runnningBorderRight"] == null ? null : ApronLeft.fromJson(json["runnningBorderRight"]),
        spareWheel: json["spareWheel"] == null ? null : ApronLeft.fromJson(json["spareWheel"]),
        tailLightLeft: json["tailLightLeft"] == null ? null : ApronLeft.fromJson(json["tailLightLeft"]),
        tailLightRight: json["tailLightRight"] == null ? null : ApronLeft.fromJson(json["tailLightRight"]),
        upperCrossMember: json["upperCrossMember"] == null ? null : ApronLeft.fromJson(json["upperCrossMember"]),
        cowlTop: json["cowlTop"] == null ? null : ApronLeft.fromJson(json["cowlTop"]),
        evaluationStatusForInterior: json["evaluationStatusForInterior"],
        transmission: json["transmission"],
        evaluationStatusForTestDrive: json["evaluationStatusForTestDrive"],
        evaluationStatusForFeature: json["evaluationStatusForFeature"],
        evaluationStatusForAc: json["evaluationStatusForAc"],
        carCondition: json["carCondition"],
        specialComments: json["specialComments"],
        carElectrical: json["carElectrical"] == null ? [] : List<String>.from(json["carElectrical"]!.map((x) => x)),
        clusterPanel: json["clusterPanel"] == null ? [] : List<String>.from(json["clusterPanel"]!.map((x) => x)),
        combitionSwitch: json["combitionSwitch"],
        dashboardCondition: json["dashboardCondition"],
        dashboardSwitch: json["dashboardSwitch"],
        handBreak: json["handBreak"] == null ? [] : List<String>.from(json["handBreak"]!.map((x) => x)),
        interiorStar: json["interiorStar"]?.toDouble(),
        interiorView: json["interiorView"] == null ? null : CngKitImage.fromJson(json["interiorView"]),
        key: json["key"],
        platform: json["platform"] == null ? [] : List<String>.from(json["platform"]!.map((x) => x)),
        powerWindowCentalLock: json["powerWindowCentalLock"] == null ? [] : List<String>.from(json["powerWindowCentalLock"]!.map((x) => x)),
        pushButton: json["pushButton"],
        rearViewMirror: json["rearViewMirror"] == null ? [] : List<String>.from(json["rearViewMirror"]!.map((x) => x)),
        secondKey: json["secondKey"],
        warningDetails: json["warningDetails"],
        brakes: json["brakes"],
        clutchSystem: json["clutchSystem"],
        cruiseControl: json["cruiseControl"],
        seatAdjustment: json["seatAdjustment"],
        shocker: json["shocker"],
        steeringAdjustment: json["steeringAdjustment"],
        steeringMountedAudioControl: json["steeringMountedAudioControl"],
        steeringSystem: json["steeringSystem"],
        steeringWheel: json["steeringWheel"] == null ? [] : List<String>.from(json["steeringWheel"]!.map((x) => x)),
        suspension: json["suspension"] == null ? [] : List<String>.from(json["suspension"]!.map((x) => x)),
        transmissionAutomatic: json["transmissionAutomatic"] == null ? [] : List<String>.from(json["transmissionAutomatic"]!.map((x) => x)),
        transmissionManual: json["transmissionManual"],
        vehicleHorn: json["vehicleHorn"] == null ? [] : List<String>.from(json["vehicleHorn"]!.map((x) => x)),
        absEbd: json["absEbd"] == null ? [] : List<String>.from(json["absEbd"]!.map((x) => x)),
        airbag: json["airbag"] == null ? [] : List<String>.from(json["airbag"]!.map((x) => x)),
        alloyWheels: json["alloyWheels"] == null ? [] : List<String>.from(json["alloyWheels"]!.map((x) => x)),
        anyInteriorModifications: json["anyInteriorModifications"],
        fogLamps: json["fogLamps"],
        gloveBox: json["gloveBox"] == null ? [] : List<String>.from(json["gloveBox"]!.map((x) => x)),
        gpsNavigation: json["gpsNavigation"],
        keylessEntry: json["keylessEntry"] == null ? [] : List<String>.from(json["keylessEntry"]!.map((x) => x)),
        rearDefogger: json["rearDefogger"],
        rearParkingSensor: json["rearParkingSensor"],
        remoteCentalLock: json["remoteCentalLock"],
        seatBelt: json["seatBelt"],
        stereoBrand: json["stereoBrand"],
        sunroof: json["sunroof"] == null ? [] : List<String>.from(json["sunroof"]!.map((x) => x)),
        toolKit: json["toolKit"],
        acBlowerGrill: json["acBlowerGrill"],
        acCompressor: json["acCompressor"],
        acCondensor: json["acCondensor"] == null ? [] : List<String>.from(json["acCondensor"]!.map((x) => x)),
        acFilterDamaged: json["acFilterDamaged"],
        acWorking: json["acWorking"],
        airCooling: json["airCooling"] == null ? [] : List<String>.from(json["airCooling"]!.map((x) => x)),
        climateControl: json["climateControl"],
        heater: json["heater"],
        engineStar: json["engineStar"],
        exteriorStar: json["exteriorStar"],
        testDriveStar: json["testDriveStar"],
        dashboardImage: json["dashboardImage"] == null ? null : ApronLeft.fromJson(json["dashboardImage"]),
        frontSeatImage: json["frontSeatImage"] == null ? null : ApronLeft.fromJson(json["frontSeatImage"]),
        handbreakImage: json["handbreakImage"] == null ? null : CngKitImage.fromJson(json["handbreakImage"]),
        odometerImage: json["odometerImage"] == null ? null : CngKitImage.fromJson(json["odometerImage"]),
        powerWindowDriverImage: json["powerWindowDriverImage"] == null ? null : CngKitImage.fromJson(json["powerWindowDriverImage"]),
        pushWindowDriverImage: json["pushWindowDriverImage"] == null ? null : CngKitImage.fromJson(json["pushWindowDriverImage"]),
        rearSeatImage: json["rearSeatImage"] == null ? null : ApronLeft.fromJson(json["rearSeatImage"]),
        electricalStar: json["electricalStar"]?.toDouble(),
        cngKitImage: json["cngKitImage"] == null ? null : CngKitImage.fromJson(json["cngKitImage"]),
        stereoImage: json["stereoImage"] == null ? null : CngKitImage.fromJson(json["stereoImage"]),
        interiorAndElectricalStar: json["interiorAndElectricalStar"]?.toDouble(),
        platformImage: json["platformImage"] == null ? null : ApronLeft.fromJson(json["platformImage"]),
        uniqueId: json["uniqueId"],
        make: json["make"],
        model: json["model"],
        variant: json["variant"],
        maskedRegNumber: json["maskedRegNumber"],
        vehicleLocation: json["vehicleLocation"],
        ownershipNumber: json["ownershipNumber"],
        fuelType: json["fuelType"],
        qcStatus: json["qcStatus"],
        highestBid: json["highestBid"],
        totalBidder: json["totalBidder"],
        status: json["status"],
        front: json["front"] == null ? null : CngKitImage.fromJson(json["front"]),
        frontLeft: json["frontLeft"] == null ? null : CngKitImage.fromJson(json["frontLeft"]),
        frontRight: json["frontRight"] == null ? null : CngKitImage.fromJson(json["frontRight"]),
        frontWithHoodOpen: json["frontWithHoodOpen"] == null ? null : CngKitImage.fromJson(json["frontWithHoodOpen"]),
        rear: json["rear"] == null ? null : CngKitImage.fromJson(json["rear"]),
        rearBootOpen: json["rearBootOpen"] == null ? null : CngKitImage.fromJson(json["rearBootOpen"]),
        rearLeft: json["rearLeft"] == null ? null : CngKitImage.fromJson(json["rearLeft"]),
        rearRight: json["rearRight"] == null ? null : CngKitImage.fromJson(json["rearRight"]),
    );

    Map<String, dynamic> toJson() => {
        "engineCylinder": engineCylinder,
        "evaluationStatusForEngine": evaluationStatusForEngine,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "battery": battery?.toJson(),
        "blowBy": blowBy?.toJson(),
        "clutch": clutch?.toJson(),
        "engineComment": engineComment,
        "engineCompartment": engineCompartment?.toJson(),
        "engineCondition": engineCondition == null ? [] : List<dynamic>.from(engineCondition!.map((x) => x)),
        "engineOil": engineOil?.toJson(),
        "engineSound": engineSound,
        "engineTappetVideo": engineTappetVideo?.toJson(),
        "exhaustSmoke": exhaustSmoke,
        "gearBox": gearBox?.toJson(),
        "radiator": radiator,
        "silencer": silencer,
        "compression": compression,
        "coolant": coolant,
        "gearBoxLeakage": gearBoxLeakage,
        "mount": mount?.toJson(),
        "startVideo": startVideo?.toJson(),
        "startingMotor": startingMotor,
        "summary": summary,
        "sump": sump?.toJson(),
        "turboCharger": turboCharger?.toJson(),
        "engine": engine?.toJson(),
        "evaluationStatusForExterior": evaluationStatusForExterior,
        "apronLeft": apronLeft?.toJson(),
        "apronRight": apronRight?.toJson(),
        "bonnetPatti": bonnetPatti?.toJson(),
        "boot": boot?.toJson(),
        "bumperFront": bumperFront?.toJson(),
        "bumperRear": bumperRear?.toJson(),
        "chassisExtension": chassisExtension?.toJson(),
        "dickyDoor": dickyDoor?.toJson(),
        "doorFrontLeft": doorFrontLeft?.toJson(),
        "doorFrontRight": doorFrontRight?.toJson(),
        "doorGlassLeft": doorGlassLeft?.toJson(),
        "doorGlassRight": doorGlassRight?.toJson(),
        "doorRearLeft": doorRearLeft?.toJson(),
        "doorRearRight": doorRearRight?.toJson(),
        "fenderLeft": fenderLeft?.toJson(),
        "fenderRight": fenderRight?.toJson(),
        "firewall": firewall?.toJson(),
        "fogLightLeft": fogLightLeft?.toJson(),
        "fogLightRight": fogLightRight?.toJson(),
        "frontTyreLeft": frontTyreLeft?.toJson(),
        "frontTyreRight": frontTyreRight?.toJson(),
        "frontWindShield": frontWindShield?.toJson(),
        "fuelLid": fuelLid?.toJson(),
        "fullBodyRepaint": fullBodyRepaint,
        "grill": grill?.toJson(),
        "headLightLeft": headLightLeft?.toJson(),
        "headLightRight": headLightRight?.toJson(),
        "headLightSupport": headLightSupport?.toJson(),
        "jackAndTool": jackAndTool,
        "leftApillar": leftApillar?.toJson(),
        "leftBpillar": leftBpillar?.toJson(),
        "leftCpillar": leftCpillar?.toJson(),
        "leftImage": leftImage?.toJson(),
        "lowerCrossMember": lowerCrossMember?.toJson(),
        "missingParts": missingParts,
        "quarterGlass": quarterGlass?.toJson(),
        "quarterPanelLeft": quarterPanelLeft?.toJson(),
        "quarterPanelRight": quarterPanelRight?.toJson(),
        "rearTyreLeft": rearTyreLeft?.toJson(),
        "rearTyreRight": rearTyreRight?.toJson(),
        "rearViewMirrorLeft": rearViewMirrorLeft?.toJson(),
        "rearViewMirrorRight": rearViewMirrorRight?.toJson(),
        "rearWindShield": rearWindShield?.toJson(),
        "rearWiper": rearWiper?.toJson(),
        "rightApillar": rightApillar?.toJson(),
        "rightBpillar": rightBpillar?.toJson(),
        "rightCpillar": rightCpillar?.toJson(),
        "rightImage": rightImage?.toJson(),
        "roof": roof?.toJson(),
        "runnningBorderLeft": runnningBorderLeft?.toJson(),
        "runnningBorderRight": runnningBorderRight?.toJson(),
        "spareWheel": spareWheel?.toJson(),
        "tailLightLeft": tailLightLeft?.toJson(),
        "tailLightRight": tailLightRight?.toJson(),
        "upperCrossMember": upperCrossMember?.toJson(),
        "cowlTop": cowlTop?.toJson(),
        "evaluationStatusForInterior": evaluationStatusForInterior,
        "transmission": transmission,
        "evaluationStatusForTestDrive": evaluationStatusForTestDrive,
        "evaluationStatusForFeature": evaluationStatusForFeature,
        "evaluationStatusForAc": evaluationStatusForAc,
        "carCondition": carCondition,
        "specialComments": specialComments,
        "carElectrical": carElectrical == null ? [] : List<dynamic>.from(carElectrical!.map((x) => x)),
        "clusterPanel": clusterPanel == null ? [] : List<dynamic>.from(clusterPanel!.map((x) => x)),
        "combitionSwitch": combitionSwitch,
        "dashboardCondition": dashboardCondition,
        "dashboardSwitch": dashboardSwitch,
        "handBreak": handBreak == null ? [] : List<dynamic>.from(handBreak!.map((x) => x)),
        "interiorStar": interiorStar,
        "interiorView": interiorView?.toJson(),
        "key": key,
        "platform": platform == null ? [] : List<dynamic>.from(platform!.map((x) => x)),
        "powerWindowCentalLock": powerWindowCentalLock == null ? [] : List<dynamic>.from(powerWindowCentalLock!.map((x) => x)),
        "pushButton": pushButton,
        "rearViewMirror": rearViewMirror == null ? [] : List<dynamic>.from(rearViewMirror!.map((x) => x)),
        "secondKey": secondKey,
        "warningDetails": warningDetails,
        "brakes": brakes,
        "clutchSystem": clutchSystem,
        "cruiseControl": cruiseControl,
        "seatAdjustment": seatAdjustment,
        "shocker": shocker,
        "steeringAdjustment": steeringAdjustment,
        "steeringMountedAudioControl": steeringMountedAudioControl,
        "steeringSystem": steeringSystem,
        "steeringWheel": steeringWheel == null ? [] : List<dynamic>.from(steeringWheel!.map((x) => x)),
        "suspension": suspension == null ? [] : List<dynamic>.from(suspension!.map((x) => x)),
        "transmissionAutomatic": transmissionAutomatic == null ? [] : List<dynamic>.from(transmissionAutomatic!.map((x) => x)),
        "transmissionManual": transmissionManual,
        "vehicleHorn": vehicleHorn == null ? [] : List<dynamic>.from(vehicleHorn!.map((x) => x)),
        "absEbd": absEbd == null ? [] : List<dynamic>.from(absEbd!.map((x) => x)),
        "airbag": airbag == null ? [] : List<dynamic>.from(airbag!.map((x) => x)),
        "alloyWheels": alloyWheels == null ? [] : List<dynamic>.from(alloyWheels!.map((x) => x)),
        "anyInteriorModifications": anyInteriorModifications,
        "fogLamps": fogLamps,
        "gloveBox": gloveBox == null ? [] : List<dynamic>.from(gloveBox!.map((x) => x)),
        "gpsNavigation": gpsNavigation,
        "keylessEntry": keylessEntry == null ? [] : List<dynamic>.from(keylessEntry!.map((x) => x)),
        "rearDefogger": rearDefogger,
        "rearParkingSensor": rearParkingSensor,
        "remoteCentalLock": remoteCentalLock,
        "seatBelt": seatBelt,
        "stereoBrand": stereoBrand,
        "sunroof": sunroof == null ? [] : List<dynamic>.from(sunroof!.map((x) => x)),
        "toolKit": toolKit,
        "acBlowerGrill": acBlowerGrill,
        "acCompressor": acCompressor,
        "acCondensor": acCondensor == null ? [] : List<dynamic>.from(acCondensor!.map((x) => x)),
        "acFilterDamaged": acFilterDamaged,
        "acWorking": acWorking,
        "airCooling": airCooling == null ? [] : List<dynamic>.from(airCooling!.map((x) => x)),
        "climateControl": climateControl,
        "heater": heater,
        "engineStar": engineStar,
        "exteriorStar": exteriorStar,
        "testDriveStar": testDriveStar,
        "dashboardImage": dashboardImage?.toJson(),
        "frontSeatImage": frontSeatImage?.toJson(),
        "handbreakImage": handbreakImage?.toJson(),
        "odometerImage": odometerImage?.toJson(),
        "powerWindowDriverImage": powerWindowDriverImage?.toJson(),
        "pushWindowDriverImage": pushWindowDriverImage?.toJson(),
        "rearSeatImage": rearSeatImage?.toJson(),
        "electricalStar": electricalStar,
        "cngKitImage": cngKitImage?.toJson(),
        "stereoImage": stereoImage?.toJson(),
        "interiorAndElectricalStar": interiorAndElectricalStar,
        "platformImage": platformImage?.toJson(),
        "uniqueId": uniqueId,
        "make": make,
        "model": model,
        "variant": variant,
        "maskedRegNumber": maskedRegNumber,
        "vehicleLocation": vehicleLocation,
        "ownershipNumber": ownershipNumber,
        "fuelType": fuelType,
        "qcStatus": qcStatus,
        "highestBid": highestBid,
        "totalBidder": totalBidder,
        "status": status,
        "front": front?.toJson(),
        "frontLeft": frontLeft?.toJson(),
        "frontRight": frontRight?.toJson(),
        "frontWithHoodOpen": frontWithHoodOpen?.toJson(),
        "rear": rear?.toJson(),
        "rearBootOpen": rearBootOpen?.toJson(),
        "rearLeft": rearLeft?.toJson(),
        "rearRight": rearRight?.toJson(),
    };
}

class ApronLeft {
    final List<String>? condition;
    final String? remarks;
    ApronLeft({
        this.condition,
        this.remarks
    });

    factory ApronLeft.fromJson(Map<String, dynamic> json) => ApronLeft(
        condition: json["condition"] == null ? [] : List<String>.from(json["condition"]!.map((x) => x)),
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "condition": condition == null ? [] : List<dynamic>.from(condition!.map((x) => x)),
        "remarks": remarks,
    };
}

class CngKitImage {
    final String? name;
    final String? url;
    final List<String>? condition;
    final String? remarks;

    CngKitImage({
        this.name,
        this.url,
        this.condition,
        this.remarks,
    });

    factory CngKitImage.fromJson(Map<String, dynamic> json) => CngKitImage(
        name: json["name"],
        url: json["url"],
        condition: json["condition"] == null ? [] : List<String>.from(json["condition"]!.map((x) => x)),
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "condition": condition == null ? [] : List<dynamic>.from(condition!.map((x) => x)),
        "remarks": remarks,
    };
}

class FrontTyreLeft {
    final String? condition;
    final String? remarks;

    FrontTyreLeft({
        this.condition,
        this.remarks
    });

    factory FrontTyreLeft.fromJson(Map<String, dynamic> json) => FrontTyreLeft(
        condition: json["condition"],
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "condition": condition,
        "remarks": remarks,
    };
}

class Meta {
    final String? access;
    final String? refresh;

    Meta({
        this.access,
        this.refresh,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        access: json["access"],
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
    };
}