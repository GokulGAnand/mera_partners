import 'dart:convert';

LikedCarResponse likedCarResponseFromJson(String str) => LikedCarResponse.fromJson(json.decode(str));

String likedCarResponseToJson(LikedCarResponse data) => json.encode(data.toJson());

class LikedCarResponse {
    final String? status;
    final String? message;
    final List<LikedCarsList>? data;
    final int? count;
    final Meta? meta;

    LikedCarResponse({
        this.status,
        this.message,
        this.data,
        this.count,
        this.meta,
    });

    factory LikedCarResponse.fromJson(Map<String, dynamic> json) => LikedCarResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<LikedCarsList>.from(json["data"]!.map((x) => LikedCarsList.fromJson(x))),
        count: json["count"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "meta": meta?.toJson(),
    };
}

class LikedCarsList {
  String? sId;
  num? uniqueId;
  String? make;
  String? model;
  String? variant;
  num? highestBid;
  String? status;
  FrontLeft? frontLeft;
  String? bidEndTime;
  String? bidStartTime;
  String? monthAndYearOfManufacture;
  num? realValue;
  String? otbEndTime;
  String? otbStartTime;

  LikedCarsList(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.status,
        this.frontLeft,
        this.bidEndTime,
        this.bidStartTime,
        this.monthAndYearOfManufacture,
        this.realValue,
        this.otbEndTime,
        this.otbStartTime});

  LikedCarsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    highestBid = json['highestBid'];
    status = json['status'];
    frontLeft = json['frontLeft'] != null
        ? FrontLeft.fromJson(json['frontLeft'])
        : null;
    bidEndTime = json['bidEndTime'];
    bidStartTime = json['bidStartTime'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    realValue = json['realValue'];
    otbEndTime = json['otbEndTime'];
    otbStartTime = json['otbStartTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['uniqueId'] = uniqueId;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['highestBid'] = highestBid;
    data['status'] = status;
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    data['bidEndTime'] = bidEndTime;
    data['bidStartTime'] = bidStartTime;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['realValue'] = realValue;
    data['otbEndTime'] = otbEndTime;
    data['otbStartTime'] = otbStartTime;
    return data;
  }
}

class FrontLeft {
    final String? name;
    final String? url;
    final List<String>? condition;
    final String? remarks;

    FrontLeft({
        this.name,
        this.url,
        this.condition,
        this.remarks,
    });

    factory FrontLeft.fromJson(Map<String, dynamic> json) => FrontLeft(
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
