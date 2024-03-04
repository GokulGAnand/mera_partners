import 'dart:convert';

FeaturesList featuresListFromJson(String str) => FeaturesList.fromJson(json.decode(str));

String featuresListToJson(FeaturesList data) => json.encode(data.toJson());

class FeaturesList {
    final String? status;
    final String? message;
    final List<Data>? data;
    final Meta? meta;

    FeaturesList({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory FeaturesList.fromJson(Map<String, dynamic> json) => FeaturesList(
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
    final AbsEbd? sunroof;
    final AbsEbd? alloyWheels;
    final AbsEbd? keylessEntry;
    final AbsEbd? absEbd;
    final AbsEbd? gloveBox;
    final AbsEbd? airbag;
    final String? rearDefogger;
    final String? anyInteriorModifications;
    final String? fogLamps;
    final String? gpsNavigation;
    final String? rearParkingSensor;
    final String? seatBelt;
    final String? stereoBrand;
    final AbsEbd? stereoImage;

    Data({
        this.id,
        this.carId,
        this.sunroof,
        this.alloyWheels,
        this.keylessEntry,
        this.absEbd,
        this.gloveBox,
        this.airbag,
        this.rearDefogger,
        this.anyInteriorModifications,
        this.fogLamps,
        this.gpsNavigation,
        this.rearParkingSensor,
        this.seatBelt,
        this.stereoBrand,
        this.stereoImage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        carId: json["carId"],
        sunroof: json["sunroof"] == null ? null : AbsEbd.fromJson(json["sunroof"]),
        alloyWheels: json["alloyWheels"] == null ? null : AbsEbd.fromJson(json["alloyWheels"]),
        keylessEntry: json["keylessEntry"] == null ? null : AbsEbd.fromJson(json["keylessEntry"]),
        absEbd: json["absEbd"] == null ? null : AbsEbd.fromJson(json["absEbd"]),
        gloveBox: json["gloveBox"] == null ? null : AbsEbd.fromJson(json["gloveBox"]),
        airbag: json["airbag"] == null ? null : AbsEbd.fromJson(json["airbag"]),
        rearDefogger: json["rearDefogger"],
        anyInteriorModifications: json["anyInteriorModifications"],
        fogLamps: json["fogLamps"],
        gpsNavigation: json["gpsNavigation"],
        rearParkingSensor: json["rearParkingSensor"],
        seatBelt: json["seatBelt"],
        stereoBrand: json["stereoBrand"],
        stereoImage: json["stereoImage"] == null ? null : AbsEbd.fromJson(json["stereoImage"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "carId": carId,
        "sunroof": sunroof?.toJson(),
        "alloyWheels": alloyWheels?.toJson(),
        "keylessEntry": keylessEntry?.toJson(),
        "absEbd": absEbd?.toJson(),
        "gloveBox": gloveBox?.toJson(),
        "airbag": airbag?.toJson(),
        "rearDefogger": rearDefogger,
        "anyInteriorModifications": anyInteriorModifications,
        "fogLamps": fogLamps,
        "gpsNavigation": gpsNavigation,
        "rearParkingSensor": rearParkingSensor,
        "seatBelt": seatBelt,
        "stereoBrand": stereoBrand,
        "stereoImage": stereoImage?.toJson(),
    };
}

class AbsEbd {
    final String? name;
    final String? url;
    final List<String>? condition;
    final String? remarks;

    AbsEbd({
        this.name,
        this.url,
        this.condition,
        this.remarks,
    });

    factory AbsEbd.fromJson(Map<String, dynamic> json) => AbsEbd(
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
