import 'dart:convert';

testdrivelist testdrivelistFromJson(String str) => testdrivelist.fromJson(json.decode(str));

String testdrivelistToJson(testdrivelist data) => json.encode(data.toJson());

class testdrivelist {
    final String? status;
    final String? message;
    final List<Data>? data;
    final Meta? meta;

    testdrivelist({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory testdrivelist.fromJson(Map<String, dynamic> json) => testdrivelist(
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
    final List<String>? steeringWheel;
    final List<String>? suspension;
    final String? shocker;
    final String? steeringSystem;
    final String? steeringAdjustment;
    final String? steeringMountedAudioControl;
    final String? cruiseControl;
    final String? seatAdjustment;
    final String? brakes;
    final String? clutchSystem;
    final List<String>? vehicleHorn;
    final List<String>? transmissionAutomatic;
    final String? transmissionManual;

    Data({
        this.id,
        this.carId,
        this.steeringWheel,
        this.suspension,
        this.shocker,
        this.steeringSystem,
        this.steeringAdjustment,
        this.steeringMountedAudioControl,
        this.cruiseControl,
        this.seatAdjustment,
        this.brakes,
        this.clutchSystem,
        this.vehicleHorn,
        this.transmissionAutomatic,
        this.transmissionManual,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        carId: json["carId"],
        steeringWheel: json["steeringWheel"] == null ? [] : List<String>.from(json["steeringWheel"]!.map((x) => x)),
        suspension: json["suspension"] == null ? [] : List<String>.from(json["suspension"]!.map((x) => x)),
        shocker: json["shocker"],
        steeringSystem: json["steeringSystem"],
        steeringAdjustment: json["steeringAdjustment"],
        steeringMountedAudioControl: json["steeringMountedAudioControl"],
        cruiseControl: json["cruiseControl"],
        seatAdjustment: json["seatAdjustment"],
        brakes: json["brakes"],
        clutchSystem: json["clutchSystem"],
        vehicleHorn: json["vehicleHorn"] == null ? [] : List<String>.from(json["vehicleHorn"]!.map((x) => x)),
        transmissionAutomatic: json["transmissionAutomatic"] == null ? [] : List<String>.from(json["transmissionAutomatic"]!.map((x) => x)),
        transmissionManual: json["transmissionManual"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "steeringWheel": steeringWheel == null ? [] : List<dynamic>.from(steeringWheel!.map((x) => x)),
        "suspension": suspension == null ? [] : List<dynamic>.from(suspension!.map((x) => x)),
        "shocker": shocker,
        "steeringSystem": steeringSystem,
        "steeringAdjustment": steeringAdjustment,
        "steeringMountedAudioControl": steeringMountedAudioControl,
        "cruiseControl": cruiseControl,
        "seatAdjustment": seatAdjustment,
        "brakes": brakes,
        "clutchSystem": clutchSystem,
        "vehicleHorn": vehicleHorn == null ? [] : List<dynamic>.from(vehicleHorn!.map((x) => x)),
        "transmissionAutomatic": transmissionAutomatic == null ? [] : List<dynamic>.from(transmissionAutomatic!.map((x) => x)),
        "transmissionManual": transmissionManual,
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
