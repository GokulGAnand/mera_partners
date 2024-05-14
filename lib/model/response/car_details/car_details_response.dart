// To parse this JSON data, do
//
//     final carDetailsResponse = carDetailsResponseFromJson(jsonString);

import 'dart:convert';

CarDetailsResponse carDetailsResponseFromJson(String str) => CarDetailsResponse.fromJson(json.decode(str));

String carDetailsResponseToJson(CarDetailsResponse data) => json.encode(data.toJson());

class CarDetailsResponse {
    final String? status;
    final String? message;
    final List<Data>? data;
    final Meta? meta;

    CarDetailsResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory CarDetailsResponse.fromJson(Map<String, dynamic> json) => CarDetailsResponse(
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
    final String? winner;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Front? front;
    final Front? frontLeft;
    final Front? frontRight;
    final Front? rear;
    final Front? rearRight;
    final DateTime? bidEndTime;
    final DateTime? bidStartTime;
    final int? realValue;
    final List<LeaderBoard>? leaderBoard;

    Data({
        this.id,
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
        this.winner,
        this.createdAt,
        this.updatedAt,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rear,
        this.rearRight,
        this.bidEndTime,
        this.bidStartTime,
        this.realValue,
        this.leaderBoard,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
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
        winner: json["winner"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        front: json["front"] == null ? null : Front.fromJson(json["front"]),
        frontLeft: json["frontLeft"] == null ? null : Front.fromJson(json["frontLeft"]),
        frontRight: json["frontRight"] == null ? null : Front.fromJson(json["frontRight"]),
        rear: json["rear"] == null ? null : Front.fromJson(json["rear"]),
        rearRight: json["rearRight"] == null ? null : Front.fromJson(json["rearRight"]),
        bidEndTime: json["bidEndTime"] == null ? null : DateTime.parse(json["bidEndTime"]),
        bidStartTime: json["bidStartTime"] == null ? null : DateTime.parse(json["bidStartTime"]),
        realValue: json["realValue"],
        leaderBoard: json["leaderBoard"] == null ? [] : List<LeaderBoard>.from(json["leaderBoard"]!.map((x) => LeaderBoard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
        "winner": winner,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "front": front?.toJson(),
        "frontLeft": frontLeft?.toJson(),
        "frontRight": frontRight?.toJson(),
        "rear": rear?.toJson(),
        "rearRight": rearRight?.toJson(),
        "bidEndTime": bidEndTime?.toIso8601String(),
        "bidStartTime": bidStartTime?.toIso8601String(),
        "realValue": realValue,
        "leaderBoard": leaderBoard == null ? [] : List<dynamic>.from(leaderBoard!.map((x) => x.toJson())),
    };
}

class LeaderBoard {
  num? amount;
  String? userId;
  String? sId;
  String? fullname;
  String? uniqueId;
  num? autoBidLimit;
  num? contactNo;
  bool? isRejected;
  bool? isAutobid;

  LeaderBoard({this.amount, this.userId, this.isAutobid,
    this.uniqueId,
    this.autoBidLimit,
    this.contactNo,
    this.isRejected,
    this.sId,
    this.fullname,
  });

  LeaderBoard.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    userId = json['userId'];
    isAutobid = json['isAutobid'];
    sId = json['_id'];
    fullname = json['fullname'];
    uniqueId = json['uniqueId'];
    autoBidLimit = json['autoBidLimit'];
    contactNo = json['contactNo'];
    isRejected = json['isRejected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['userId'] = userId;
    data['isAutobid'] = isAutobid;
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['uniqueId'] = uniqueId;
    data['autoBidLimit'] = autoBidLimit;
    data['contactNo'] = contactNo;
    data['isRejected'] = isRejected;
    return data;
  }
}

class Front {
    final String? name;
    final String? url;
    final List<String>? condition;
    final String? remarks;

    Front({
        this.name,
        this.url,
        this.condition,
        this.remarks,
    });

    factory Front.fromJson(Map<String, dynamic> json) => Front(
        name: json["name"],
        url: json["url"],
        condition: json['condition'].cast<String>(),
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
