class UserResponse {
  String? status;
  String? message;
  List<UserData>? data;
  Meta? meta;

  UserResponse({this.status, this.message, this.data, this.meta});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(UserData.fromJson(v));
      });
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
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class UserData {
  FcmNotification? fcmNotification;
  String? sId;
  String? userId;
  bool? isBlocked;
  String? role;
  num? contactNo;
  bool? isDeactivate;
  bool? isDeposited;
  num? depositedAmount;
  List<LostDeal>? lostDeal;
  List<LikedCars>? likedCars;
  List<BiddedCars>? biddedCars;
  String? isDocumentsVerified;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.fcmNotification,
        this.sId,
        this.userId,
        this.isBlocked,
        this.role,
        this.contactNo,
        this.isDeactivate,
        this.isDeposited,
        this.depositedAmount,
        this.lostDeal,
        this.likedCars,
        this.biddedCars,
        this.isDocumentsVerified,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    fcmNotification = json['fcmNotification'] != null
        ? FcmNotification.fromJson(json['fcmNotification'])
        : null;
    sId = json['_id'];
    userId = json['userId'];
    isBlocked = json['isBlocked'];
    role = json['role'];
    contactNo = json['contactNo'];
    isDeactivate = json['isDeactivate'];
    isDeposited = json['isDeposited'];
    depositedAmount = json['depositedAmount'];
    if (json['lostDeal'] != null) {
      lostDeal = <LostDeal>[];
      json['lostDeal'].forEach((v) {
        lostDeal!.add(LostDeal.fromJson(v));
      });
    }
    if (json['likedCars'] != null) {
      likedCars = <LikedCars>[];
      json['likedCars'].forEach((v) {
        likedCars!.add(LikedCars.fromJson(v));
      });
    }
    if (json['biddedCars'] != null) {
      biddedCars = <BiddedCars>[];
      json['biddedCars'].forEach((v) {
        biddedCars!.add(BiddedCars.fromJson(v));
      });
    }
    isDocumentsVerified = json['isDocumentsVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fcmNotification != null) {
      data['fcmNotification'] = fcmNotification!.toJson();
    }
    data['_id'] = sId;
    data['userId'] = userId;
    data['isBlocked'] = isBlocked;
    data['role'] = role;
    data['contactNo'] = contactNo;
    data['isDeactivate'] = isDeactivate;
    data['isDeposited'] = isDeposited;
    data['depositedAmount'] = depositedAmount;
    if (lostDeal != null) {
      data['lostDeal'] = lostDeal!.map((v) => v.toJson()).toList();
    }
    if (likedCars != null) {
      data['likedCars'] = likedCars!.map((v) => v.toJson()).toList();
    }
    if (biddedCars != null) {
      data['biddedCars'] = biddedCars!.map((v) => v.toJson()).toList();
    }
    data['isDocumentsVerified'] = isDocumentsVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class FcmNotification {
  String? fcmToken;
  String? platform;

  FcmNotification({this.fcmToken, this.platform});

  FcmNotification.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fcmToken'] = fcmToken;
    data['platform'] = platform;
    return data;
  }
}

class LostDeal {
  String? sId;
  num? uniqueId;
  String? make;
  String? model;
  String? variant;
  num? highestBid;
  String? status;
  FrontLeft? frontLeft;
  String? monthAndYearOfManufacture;

  LostDeal(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.status,
        this.frontLeft,
        this.monthAndYearOfManufacture});

  LostDeal.fromJson(Map<String, dynamic> json) {
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
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
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
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    return data;
  }
}

class FrontLeft {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  FrontLeft({this.name, this.url, this.condition, this.remarks});

  FrontLeft.fromJson(Map<String, dynamic> json) {
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

class LikedCars {
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

  LikedCars(
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

  LikedCars.fromJson(Map<String, dynamic> json) {
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

class BiddedCars {
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
  String? carCondition;
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

  BiddedCars(
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

  BiddedCars.fromJson(Map<String, dynamic> json) {
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
    carCondition = json['carCondition'];
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
