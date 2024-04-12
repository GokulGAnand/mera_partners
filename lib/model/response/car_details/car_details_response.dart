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
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Front? front;
    final Front? frontLeft;
    final Front? frontRight;
    final Front? frontWithHoodOpen;
    final Front? rear;
    final Front? rearBootOpen;
    final Front? rearLeft;
    final Front? rearRight;
    final List<LeaderBoard>? leaderBoard;
    final String? winner;

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
        this.createdAt,
        this.updatedAt,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.frontWithHoodOpen,
        this.rear,
        this.rearBootOpen,
        this.rearLeft,
        this.rearRight,
        this.leaderBoard,
        this.winner,
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        front: json["front"] == null ? null : Front.fromJson(json["front"]),
        frontLeft: json["frontLeft"] == null ? null : Front.fromJson(json["frontLeft"]),
        frontRight: json["frontRight"] == null ? null : Front.fromJson(json["frontRight"]),
        frontWithHoodOpen: json["frontWithHoodOpen"] == null ? null : Front.fromJson(json["frontWithHoodOpen"]),
        rear: json["rear"] == null ? null : Front.fromJson(json["rear"]),
        rearBootOpen: json["rearBootOpen"] == null ? null : Front.fromJson(json["rearBootOpen"]),
        rearLeft: json["rearLeft"] == null ? null : Front.fromJson(json["rearLeft"]),
        rearRight: json["rearRight"] == null ? null : Front.fromJson(json["rearRight"]),
        leaderBoard: json["leaderBoard"] == null ? [] : List<LeaderBoard>.from(json["leaderBoard"]!.map((x) => LeaderBoard.fromJson(x))),
        winner: json["winner"],
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "front": front?.toJson(),
        "frontLeft": frontLeft?.toJson(),
        "frontRight": frontRight?.toJson(),
        "frontWithHoodOpen": frontWithHoodOpen?.toJson(),
        "rear": rear?.toJson(),
        "rearBootOpen": rearBootOpen?.toJson(),
        "rearLeft": rearLeft?.toJson(),
        "rearRight": rearRight?.toJson(),
        "leaderBoard": leaderBoard == null ? [] : List<dynamic>.from(leaderBoard!.map((x) => x.toJson())),
        "winner": winner,
    };
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

class LeaderBoard {
    final int? amount;
    final String? userId;
    final bool? isAutobid;
    final int? autoBidLimit;
    final String? id;

    LeaderBoard({
        this.amount,
        this.userId,
        this.isAutobid,
        this.autoBidLimit,
        this.id,
    });

    factory LeaderBoard.fromJson(Map<String, dynamic> json) => LeaderBoard(
        amount: json["amount"],
        userId: json["userId"],
        isAutobid: json["isAutobid"],
        autoBidLimit: json["autoBidLimit"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "userId": userId,
        "isAutobid": isAutobid,
        "autoBidLimit": autoBidLimit,
        "_id": id,
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
