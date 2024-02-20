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
    final String? pushButton;
    final String? powerWindowCentalLock;
    final String? combitionSwitch;
    final String? dashboardCondition;
    final String? handBreak;
    final String? carElectrical;
    final String? key;
    final String? clusterPanel;
    final String? warningDetails;
    final String? rearViewMirror;
    final String? interiorView;
    final String? dashboardSwitch;
    final String? secondKey;
    final String? platform;
    final int? interiorStar;
    final Image? dashboardImage;
    final Image? frontSeatImage;
    final Image? handbreakImage;
    final Image? odometerImage;
    final Image? powerWindowDriverImage;
    final Image? pushWindowDriverImage;
    final Image? rearSeatImage;

    Data({
        this.id,
        this.carId,
        this.pushButton,
        this.powerWindowCentalLock,
        this.combitionSwitch,
        this.dashboardCondition,
        this.handBreak,
        this.carElectrical,
        this.key,
        this.clusterPanel,
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
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        carId: json["carId"],
        pushButton: json["pushButton"],
        powerWindowCentalLock: json["powerWindowCentalLock"],
        combitionSwitch: json["combitionSwitch"],
        dashboardCondition: json["dashboardCondition"],
        handBreak: json["handBreak"],
        carElectrical: json["carElectrical"],
        key: json["key"],
        clusterPanel: json["clusterPanel"],
        warningDetails: json["warningDetails"],
        rearViewMirror: json["rearViewMirror"],
        interiorView: json["interiorView"],
        dashboardSwitch: json["dashboardSwitch"],
        secondKey: json["secondKey"],
        platform: json["platform"],
        interiorStar: json["interiorStar"],
        dashboardImage: json["dashboardImage"] == null ? null : Image.fromJson(json["dashboardImage"]),
        frontSeatImage: json["frontSeatImage"] == null ? null : Image.fromJson(json["frontSeatImage"]),
        handbreakImage: json["handbreakImage"] == null ? null : Image.fromJson(json["handbreakImage"]),
        odometerImage: json["odometerImage"] == null ? null : Image.fromJson(json["odometerImage"]),
        powerWindowDriverImage: json["powerWindowDriverImage"] == null ? null : Image.fromJson(json["powerWindowDriverImage"]),
        pushWindowDriverImage: json["pushWindowDriverImage"] == null ? null : Image.fromJson(json["pushWindowDriverImage"]),
        rearSeatImage: json["rearSeatImage"] == null ? null : Image.fromJson(json["rearSeatImage"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "pushButton": pushButton,
        "powerWindowCentalLock": powerWindowCentalLock,
        "combitionSwitch": combitionSwitch,
        "dashboardCondition": dashboardCondition,
        "handBreak": handBreak,
        "carElectrical": carElectrical,
        "key": key,
        "clusterPanel": clusterPanel,
        "warningDetails": warningDetails,
        "rearViewMirror": rearViewMirror,
        "interiorView": interiorView,
        "dashboardSwitch": dashboardSwitch,
        "secondKey": secondKey,
        "platform": platform,
        "interiorStar": interiorStar,
        "dashboardImage": dashboardImage?.toJson(),
        "frontSeatImage": frontSeatImage?.toJson(),
        "handbreakImage": handbreakImage?.toJson(),
        "odometerImage": odometerImage?.toJson(),
        "powerWindowDriverImage": powerWindowDriverImage?.toJson(),
        "pushWindowDriverImage": pushWindowDriverImage?.toJson(),
        "rearSeatImage": rearSeatImage?.toJson(),
    };
}

class Image {
    final String? name;
    final String? url;
    final String? remarks;

    Image({
        this.name,
        this.url,
        this.remarks,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        name: json["name"],
        url: json["url"],
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
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
