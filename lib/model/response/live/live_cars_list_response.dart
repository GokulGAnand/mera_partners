class CarListResponse {
  String? status;
  String? message;
  List<Data>? data;
  num? count;
  Meta? meta;

  CarListResponse(
      {this.status, this.message, this.data, this.count, this.meta});

  CarListResponse.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = json['status'];
    }
    if (json['message'] != null) {
      message = json['message'];
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['count'] != null) {
      count = json['count'];
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  num? uniqueId;
  String? make;
  String? model;
  String? variant;
  String? maskedRegNumber;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  String? qcStatus;
  int? highestBid;
  num? totalBidder;
  String? status;
  String? createdAt;
  int? realValue;
  String? monthAndYearOfManufacture;
  num? odometerReading;
  String? transmission;
  num? statusValues;
  List<LeaderBoard>? leaderBoard;
  // List<String>? winner;
  String? winner;
  List<String>? carCondition;
  Front? front;
  Front? frontLeft;
  Front? frontRight;
  Front? rearLeft;
  Front? rear;
  Front? rearRight;
  num? engineStar;
  num? exteriorStar;
  num? testDriveStar;
  num? interiorAndElectricalStar;
  Front? engineCompartment;
  String? bidEndTime;
  String? bidStartTime;
  String? otbEndTime;
  String? otbStartTime;
  int? negotiationAmount;
  num? finalPrice;
  String? negotiationStatus;
  String? negotiationEndTime;
  String? negotiationStartTime;
  String? procurementStatus;
  num? gst;
  num? serviceFees;
  num? totalAmount;

  Data(
      {this.sId,
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
        this.realValue,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.transmission,
        this.statusValues,
        this.leaderBoard,
        this.winner,
        this.carCondition,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rearLeft,
        this.rear,
        this.rearRight,
        this.engineStar,
        this.exteriorStar,
        this.testDriveStar,
        this.interiorAndElectricalStar,
        this.engineCompartment,
        this.bidEndTime,
        this.otbEndTime,
        this.otbStartTime,
        this.negotiationAmount,
        this.finalPrice,
        this.negotiationStatus,
        this.bidStartTime,
        this.negotiationEndTime,
        this.negotiationStartTime,
        this.procurementStatus,
        this.gst,
        this.serviceFees,
        this.totalAmount,
      });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    maskedRegNumber = json['maskedRegNumber'];
    vehicleLocation = json['vehicleLocation'];
    ownershipNumber = json['ownershipNumber'];
    fuelType = json['fuelType'];
    qcStatus = json['qcStatus'];
    highestBid = json['highestBid'];
    totalBidder = json['totalBidder'];
    status = json['status'];
    createdAt = json['createdAt'];
    realValue = json['realValue'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    odometerReading = json['odometerReading'];
    transmission = json['transmission'];
    statusValues = json['statusValues'];
    winner = json['winner'];
    if (json['carCondition'] != null && json['carCondition'] is List) {
      carCondition = json['carCondition'].cast<String>();
    }
    if (json['leaderBoard'] != null) {
      leaderBoard = <LeaderBoard>[];
      json['leaderBoard'].forEach((v) {
        leaderBoard!.add(LeaderBoard.fromJson(v));
      });
    }
    // if (json['winner'] != null && json['winner'] is List) {
    //   winner = (json['winner'] as List).cast<String>();
    // }
    front = json['front'] != null ? Front.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? Front.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? Front.fromJson(json['frontRight'])
        : null;
    rearLeft =
    json['rearLeft'] != null ? Front.fromJson(json['rearLeft']) : null;
    rear = json['rear'] != null ? Front.fromJson(json['rear']) : null;
    rearRight = json['rearRight'] != null
        ? Front.fromJson(json['rearRight'])
        : null;
    engineStar = json['engineStar'];
    exteriorStar = json['exteriorStar'];
    testDriveStar = json['testDriveStar'];
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
    engineCompartment = json['engineCompartment'] != null
        ? Front.fromJson(json['engineCompartment'])
        : null;
    bidEndTime = json['bidEndTime'];
    otbEndTime = json['otbEndTime'];
    otbStartTime = json['otbStartTime'];
    negotiationAmount = json['negotiation_amount'];
    finalPrice = json['finalPrice'];
    negotiationStatus = json['negotiation_status'];
    negotiationStartTime = json['negotiation_startTime'];
    negotiationEndTime = json['negotiation_endTime'];
    bidStartTime = json['bidStartTime'];
    procurementStatus = json['procurement_status'];
    gst = json['gst'];
    serviceFees = json['serviceFees'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['uniqueId'] = uniqueId;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['maskedRegNumber'] = maskedRegNumber;
    data['vehicleLocation'] = vehicleLocation;
    data['ownershipNumber'] = ownershipNumber;
    data['fuelType'] = fuelType;
    data['qcStatus'] = qcStatus;
    data['highestBid'] = highestBid;
    data['totalBidder'] = totalBidder;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['realValue'] = realValue;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['odometerReading'] = odometerReading;
    data['transmission'] = transmission;
    data['statusValues'] = statusValues;
    if (leaderBoard != null) {
      data['leaderBoard'] = leaderBoard!.map((v) => v.toJson()).toList();
    }
    data['winner'] = winner;
    data['carCondition'] = carCondition;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
    }
    if (rearLeft != null) {
      data['rearLeft'] = rearLeft!.toJson();
    }
    if (rear != null) {
      data['rear'] = rear!.toJson();
    }
    if (rearRight != null) {
      data['rearRight'] = rearRight!.toJson();
    }
    data['engineStar'] = engineStar;
    data['exteriorStar'] = exteriorStar;
    data['testDriveStar'] = testDriveStar;
    data['interiorAndElectricalStar'] = interiorAndElectricalStar;
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    data['bidEndTime'] = bidEndTime;
    data['otbEndTime'] = otbEndTime;
    data['otbStartTime'] = otbStartTime;
    data['bidStartTime'] = bidStartTime;
    data['negotiation_amount'] = negotiationAmount;
    data['procurement_status'] = procurementStatus;
    data['finalPrice'] = finalPrice;
    data['negotiation_status'] = negotiationStatus;
    data['negotiation_startTime'] = negotiationStartTime;
    data['negotiation_endTime'] = negotiationEndTime;
    data['gst'] = gst;
    data['serviceFees'] = serviceFees;
    data['totalAmount'] = totalAmount;
    return data;
  }
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
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  Front({this.name, this.url, this.condition, this.remarks});

  Front.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    condition = json['condition'].cast<String>();
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['condition'] = condition;
    data['remarks'] = remarks;
    return data;
  }
}

class Meta {
  String? access;
  String? refresh;

  Meta({this.access, this.refresh});

  Meta.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access'] = access;
    data['refresh'] = refresh;
    return data;
  }
}
