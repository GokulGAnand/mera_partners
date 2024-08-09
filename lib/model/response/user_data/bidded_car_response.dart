import 'dart:convert';

BiddedCarResponse biddedCarResponseFromJson(String str) => BiddedCarResponse.fromJson(json.decode(str));

String biddedCarResponseToJson(BiddedCarResponse data) => json.encode(data.toJson());

class BiddedCarResponse {
    final String? status;
    final String? message;
    final List<BidCarsList>? data;
    final int? count;
    final Meta? meta;

    BiddedCarResponse({
        this.status,
        this.message,
        this.data,
        this.count,
        this.meta,
    });

    factory BiddedCarResponse.fromJson(Map<String, dynamic> json) => BiddedCarResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<BidCarsList>.from(json["data"]!.map((x) => BidCarsList.fromJson(x))),
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

class BidCarsList {
  String? sId;
  num? uniqueId;
  String? make;
  String? model;
  String? variant;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  String? qcStatus;
  int? highestBid;
  num? totalBidder;
  String? status;
  List<String>? carCondition;
  List<LeaderBoard>? leaderBoard;
  String? createdAt;
  FrontLeft? engineCompartment;
  String? specialComments;
  FrontLeft? front;
  FrontLeft? frontLeft;
  FrontLeft? frontRight;
  FrontLeft? frontWithHoodOpen;
  FrontLeft? rear;
  FrontLeft? rearBootOpen;
  FrontLeft? rearLeft;
  FrontLeft? rearRight;
  String? winner;
  String? bidEndTime;
  String? bidStartTime;
  String? maskedRegNumber;
  String? monthAndYearOfManufacture;
  num? odometerReading;
  String? transmission;
  num? engineStar;
  num? exteriorStar;
  num? interiorAndElectricalStar;
  num? testDriveStar;
  num? realValue;

  BidCarsList(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.vehicleLocation,
        this.ownershipNumber,
        this.fuelType,
        this.qcStatus,
        this.highestBid,
        this.totalBidder,
        this.status,
        this.carCondition,
        this.leaderBoard,
        this.createdAt,
        this.engineCompartment,
        this.specialComments,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.frontWithHoodOpen,
        this.rear,
        this.rearBootOpen,
        this.rearLeft,
        this.rearRight,
        this.winner,
        this.bidEndTime,
        this.bidStartTime,
        this.maskedRegNumber,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.transmission,
        this.engineStar,
        this.exteriorStar,
        this.interiorAndElectricalStar,
        this.testDriveStar,
        this.realValue});

  BidCarsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    vehicleLocation = json['vehicleLocation'];
    ownershipNumber = json['ownershipNumber'];
    fuelType = json['fuelType'];
    qcStatus = json['qcStatus'];
    highestBid = json['highestBid'];
    totalBidder = json['totalBidder'];
    status = json['status'];
    if (json['carCondition'] != null && json['carCondition'] is List) {
      carCondition = json['carCondition'].cast<String>();
    }
    if (json['leaderBoard'] != null) {
      leaderBoard = <LeaderBoard>[];
      json['leaderBoard'].forEach((v) {
        leaderBoard!.add(LeaderBoard.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    engineCompartment = json['engineCompartment'] != null
        ? FrontLeft.fromJson(json['engineCompartment'])
        : null;
    specialComments = json['specialComments'];
    front =
    json['front'] != null ? FrontLeft.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? FrontLeft.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? FrontLeft.fromJson(json['frontRight'])
        : null;
    frontWithHoodOpen = json['frontWithHoodOpen'] != null
        ? FrontLeft.fromJson(json['frontWithHoodOpen'])
        : null;
    rear = json['rear'] != null ? FrontLeft.fromJson(json['rear']) : null;
    rearBootOpen = json['rearBootOpen'] != null
        ? FrontLeft.fromJson(json['rearBootOpen'])
        : null;
    rearLeft = json['rearLeft'] != null
        ? FrontLeft.fromJson(json['rearLeft'])
        : null;
    rearRight = json['rearRight'] != null
        ? FrontLeft.fromJson(json['rearRight'])
        : null;
    winner = json['winner'];
    bidEndTime = json['bidEndTime'];
    bidStartTime = json['bidStartTime'];
    maskedRegNumber = json['maskedRegNumber'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    odometerReading = json['odometerReading'];
    transmission = json['transmission'];
    engineStar = json['engineStar'];
    exteriorStar = json['exteriorStar'];
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
    testDriveStar = json['testDriveStar'];
    realValue = json['realValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['uniqueId'] = uniqueId;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['vehicleLocation'] = vehicleLocation;
    data['ownershipNumber'] = ownershipNumber;
    data['fuelType'] = fuelType;
    data['qcStatus'] = qcStatus;
    data['highestBid'] = highestBid;
    data['totalBidder'] = totalBidder;
    data['status'] = status;
    data['carCondition'] = carCondition;
    if (leaderBoard != null) {
      data['leaderBoard'] = leaderBoard!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    data['specialComments'] = specialComments;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
    }
    if (frontWithHoodOpen != null) {
      data['frontWithHoodOpen'] = frontWithHoodOpen!.toJson();
    }
    if (rear != null) {
      data['rear'] = rear!.toJson();
    }
    if (rearBootOpen != null) {
      data['rearBootOpen'] = rearBootOpen!.toJson();
    }
    if (rearLeft != null) {
      data['rearLeft'] = rearLeft!.toJson();
    }
    if (rearRight != null) {
      data['rearRight'] = rearRight!.toJson();
    }
    data['winner'] = winner;
    data['bidEndTime'] = bidEndTime;
    data['bidStartTime'] = bidStartTime;
    data['maskedRegNumber'] = maskedRegNumber;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['odometerReading'] = odometerReading;
    data['transmission'] = transmission;
    data['engineStar'] = engineStar;
    data['exteriorStar'] = exteriorStar;
    data['interiorAndElectricalStar'] = interiorAndElectricalStar;
    data['testDriveStar'] = testDriveStar;
    data['realValue'] = realValue;
    return data;
  }
}

class LeaderBoard {
  num? amount;
  String? userId;
  String? uniqueId;
  bool? isAutobid;
  num? contactNo;
  String? fullname;
  bool? isRejected;
  String? sId;
  num? autoBidLimit;
  String? type;

  LeaderBoard(
      {this.amount,
        this.userId,
        this.uniqueId,
        this.isAutobid,
        this.contactNo,
        this.fullname,
        this.isRejected,
        this.sId,
        this.autoBidLimit,
        this.type});

  LeaderBoard.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    userId = json['userId'];
    uniqueId = json['uniqueId'];
    isAutobid = json['isAutobid'];
    contactNo = json['contactNo'];
    fullname = json['fullname'];
    isRejected = json['isRejected'];
    sId = json['_id'];
    autoBidLimit = json['autoBidLimit'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['userId'] = userId;
    data['uniqueId'] = uniqueId;
    data['isAutobid'] = isAutobid;
    data['contactNo'] = contactNo;
    data['fullname'] = fullname;
    data['isRejected'] = isRejected;
    data['_id'] = sId;
    data['autoBidLimit'] = autoBidLimit;
    data['type'] = type;
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
