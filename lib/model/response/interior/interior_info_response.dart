class InteriorInfoResponse {
    final String? status;
    final String? message;
    final List<Data>? data;
    final Meta? meta;

    InteriorInfoResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory InteriorInfoResponse.fromJson(Map<String, dynamic> json) => InteriorInfoResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
    };
}

class Data {
    final String? id;
    final String? carId;
    final List<String>? carElectrical;
    final List<String>? clusterPanel;
    final String? pushButton;
    final List<String>? powerWindowCentalLock;
    final String? combitionSwitch;
    final String? dashboardCondition;
    final List<String>? handBreak;
    final String? key;
    final String? warningDetails;
    final List<String>? rearViewMirror;
    final Image? interiorView;
    final String? dashboardSwitch;
    final String? secondKey;
    final List<String>? platform;
    final int? interiorStar;
    final Image? dashboardImage;
    final Image? frontSeatImage;
    final Image? handbreakImage;
    final Image? odometerImage;
    final Image? powerWindowDriverImage;
    final Image? pushWindowDriverImage;
    final Image? rearSeatImage;
    final Image? cngKitImage;

    Data({
        this.id,
        this.carId,
        this.clusterPanel,
        this.carElectrical,
        this.pushButton,
        this.powerWindowCentalLock,
        this.combitionSwitch,
        this.dashboardCondition,
        this.handBreak,
        this.key,
        this.warningDetails,
        this.rearViewMirror,
        this.interiorView,
        this.dashboardSwitch,
        this.secondKey,
        this.platform,
        this.interiorStar,
        this.dashboardImage,
        this.frontSeatImage,
        this.handbreakImage,
        this.odometerImage,
        this.powerWindowDriverImage,
        this.pushWindowDriverImage,
        this.rearSeatImage,
        this.cngKitImage
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        carId: json["carId"],
        carElectrical: json["carElectrical"] == null ? [] : List<String>.from(json["carElectrical"]!.map((x) => x)),
        clusterPanel: json["clusterPanel"] == null ? [] : List<String>.from(json["clusterPanel"]!.map((x) => x)),
        pushButton: json["pushButton"],
        powerWindowCentalLock: json["powerWindowCentalLock"] == null ? [] : List<String>.from(json["powerWindowCentalLock"]!.map((x) => x)),
        combitionSwitch: json["combitionSwitch"],
        dashboardCondition: json["dashboardCondition"],
        handBreak: json["handBreak"] == null ? [] : List<String>.from(json["handBreak"]!.map((x) => x)),
        key: json["key"],
        warningDetails: json["warningDetails"],
        rearViewMirror: json["rearViewMirror"] == null ? [] : List<String>.from(json["rearViewMirror"]!.map((x) => x)),
        interiorView: json["interiorView"] == null ? null : Image.fromJson(json["interiorView"]),
        dashboardSwitch: json["dashboardSwitch"],
        secondKey: json["secondKey"],
        platform: json["platform"] == null ? [] : List<String>.from(json["platform"]!.map((x) => x)),
        interiorStar: json["interiorStar"],
        dashboardImage: json["dashboardImage"] == null ? null : Image.fromJson(json["dashboardImage"]),
        frontSeatImage: json["frontSeatImage"] == null ? null : Image.fromJson(json["frontSeatImage"]),
        handbreakImage: json["handbreakImage"] == null ? null : Image.fromJson(json["handbreakImage"]),
        odometerImage: json["odometerImage"] == null ? null : Image.fromJson(json["odometerImage"]),
        powerWindowDriverImage: json["powerWindowDriverImage"] == null ? null : Image.fromJson(json["powerWindowDriverImage"]),
        pushWindowDriverImage: json["pushWindowDriverImage"] == null ? null : Image.fromJson(json["pushWindowDriverImage"]),
        rearSeatImage: json["rearSeatImage"] == null ? null : Image.fromJson(json["rearSeatImage"]),
        cngKitImage: json["cngKitImage"] == null ? null : Image.fromJson(json["cngKitImage"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "carElectrical": carElectrical == null ? [] : List<dynamic>.from(carElectrical!.map((x) => x)),
        "clusterPanel": clusterPanel == null ? [] : List<dynamic>.from(clusterPanel!.map((x) => x)),
        "pushButton": pushButton,
        "powerWindowCentalLock": powerWindowCentalLock == null ? [] : List<dynamic>.from(powerWindowCentalLock!.map((x) => x)),
        "combitionSwitch": combitionSwitch,
        "dashboardCondition": dashboardCondition,
        "handBreak": handBreak == null ? [] : List<dynamic>.from(handBreak!.map((x) => x)),
        "key": key,
        "warningDetails": warningDetails,
        "rearViewMirror": rearViewMirror == null ? [] : List<dynamic>.from(rearViewMirror!.map((x) => x)),
        "interiorView": interiorView?.toJson(),
        "dashboardSwitch": dashboardSwitch,
        "secondKey": secondKey,
        "platform": platform == null ? [] : List<dynamic>.from(platform!.map((x) => x)),
        "interiorStar": interiorStar,
        "dashboardImage": dashboardImage?.toJson(),
        "frontSeatImage": frontSeatImage?.toJson(),
        "handbreakImage": handbreakImage?.toJson(),
        "odometerImage": odometerImage?.toJson(),
        "powerWindowDriverImage": powerWindowDriverImage?.toJson(),
        "pushWindowDriverImage": pushWindowDriverImage?.toJson(),
        "rearSeatImage": rearSeatImage?.toJson(),
        "cngKitImage": cngKitImage?.toJson(),
    };
}

class Image {
    final String? name;
    final String? url;
    final List<String>? condition;
    final String? remarks;

    Image({
        this.name,
        this.url,
        this.condition,
        this.remarks,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
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
