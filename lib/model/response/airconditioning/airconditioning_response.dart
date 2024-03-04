import 'dart:convert';

AirConditionResponse airConditionListFromJson(String str) => AirConditionResponse.fromJson(json.decode(str));

String airConditionListToJson(AirConditionResponse data) => json.encode(data.toJson());

class AirConditionResponse {
    final String? status;
    final String? message;
    final List<Data>? data;
    final Meta? meta;

    AirConditionResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory AirConditionResponse.fromJson(Map<String, dynamic> json) => AirConditionResponse(
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
    final List<String>? airCooling;
    final String? heater;
    final String? climateControl;
    final List<String>? acCondensor;
    final String? acCompressor;
    final String? acWorking;
    final String? acFilterDamaged;
    final String? acBlowerGrill;
    final String? rearDefogger;

    Data({
        this.id,
        this.carId,
        this.airCooling,
        this.heater,
        this.climateControl,
        this.acCondensor,
        this.acCompressor,
        this.acWorking,
        this.acFilterDamaged,
        this.acBlowerGrill,
        this.rearDefogger,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        carId: json["carId"],
        airCooling: json["airCooling"] == null ? [] : List<String>.from(json["airCooling"]!.map((x) => x)),
        heater: json["heater"],
        climateControl: json["climateControl"],
        acCondensor: json["acCondensor"] == null ? [] : List<String>.from(json["acCondensor"]!.map((x) => x)),
        acCompressor: json["acCompressor"],
        acWorking: json["acWorking"],
        acFilterDamaged: json["acFilterDamaged"],
        acBlowerGrill: json["acBlowerGrill"],
        rearDefogger: json["rearDefogger"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "airCooling": airCooling == null ? [] : List<dynamic>.from(airCooling!.map((x) => x)),
        "heater": heater,
        "climateControl": climateControl,
        "acCondensor": acCondensor == null ? [] : List<dynamic>.from(acCondensor!.map((x) => x)),
        "acCompressor": acCompressor,
        "acWorking": acWorking,
        "acFilterDamaged": acFilterDamaged,
        "acBlowerGrill": acBlowerGrill,
        "rearDefogger": rearDefogger,
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
