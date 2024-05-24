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
  String? sId;
  String? userId;
  bool? isBlocked;
  String? role;
  num? contactNo;
  bool? isDeactivate;
  bool? isDeposited;
  num? depositedAmount;
  String? isDocumentsVerified;
  String? createdAt;
  String? updatedAt;
  AddressProofBack? addressProofBack;
  AddressProofBack? addressProofFront;
  String? businessAddress;
  String? businessName;
  AddressProofBack? canceledCheque;
  String? district;
  String? fullname;
  AddressProofBack? panCard;
  String? pincode;
  AddressProofBack? shopPicture;
  AddressProofBack? visitingCard;
  String? orderId;
  String? paymentId;
  List<LostDeal>? lostDeal;
  List<LikedCars>? likedCars;
  List<BiddedCars>? biddedCars;

  UserData(
      {this.sId,
        this.userId,
        this.isBlocked,
        this.role,
        this.contactNo,
        this.isDeactivate,
        this.isDeposited,
        this.depositedAmount,
        this.isDocumentsVerified,
        this.createdAt,
        this.updatedAt,
        this.addressProofBack,
        this.addressProofFront,
        this.businessAddress,
        this.businessName,
        this.canceledCheque,
        this.district,
        this.fullname,
        this.panCard,
        this.pincode,
        this.shopPicture,
        this.visitingCard,
        this.orderId,
        this.paymentId,
        this.lostDeal,
        this.likedCars,
        this.biddedCars});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    isBlocked = json['isBlocked'];
    role = json['role'];
    contactNo = json['contactNo'];
    isDeactivate = json['isDeactivate'];
    isDeposited = json['isDeposited'];
    depositedAmount = json['depositedAmount'];
    isDocumentsVerified = json['isDocumentsVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addressProofBack = json['addressProofBack'] != null
        ? AddressProofBack.fromJson(json['addressProofBack'])
        : null;
    addressProofFront = json['addressProofFront'] != null
        ? AddressProofBack.fromJson(json['addressProofFront'])
        : null;
    businessAddress = json['businessAddress'];
    businessName = json['businessName'];
    canceledCheque = json['canceledCheque'] != null
        ? AddressProofBack.fromJson(json['canceledCheque'])
        : null;
    district = json['district'];
    fullname = json['fullname'];
    panCard = json['panCard'] != null
        ? AddressProofBack.fromJson(json['panCard'])
        : null;
    pincode = json['pincode'];
    shopPicture = json['shopPicture'] != null
        ? AddressProofBack.fromJson(json['shopPicture'])
        : null;
    visitingCard = json['visitingCard'] != null
        ? AddressProofBack.fromJson(json['visitingCard'])
        : null;
    orderId = json['order_id'];
    paymentId = json['payment_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['isBlocked'] = isBlocked;
    data['role'] = role;
    data['contactNo'] = contactNo;
    data['isDeactivate'] = isDeactivate;
    data['isDeposited'] = isDeposited;
    data['depositedAmount'] = depositedAmount;
    data['isDocumentsVerified'] = isDocumentsVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (addressProofBack != null) {
      data['addressProofBack'] = addressProofBack!.toJson();
    }
    if (addressProofFront != null) {
      data['addressProofFront'] = addressProofFront!.toJson();
    }
    data['businessAddress'] = businessAddress;
    data['businessName'] = businessName;
    if (canceledCheque != null) {
      data['canceledCheque'] = canceledCheque!.toJson();
    }
    data['district'] = district;
    data['fullname'] = fullname;
    if (panCard != null) {
      data['panCard'] = panCard!.toJson();
    }
    data['pincode'] = pincode;
    if (shopPicture != null) {
      data['shopPicture'] = shopPicture!.toJson();
    }
    if (visitingCard != null) {
      data['visitingCard'] = visitingCard!.toJson();
    }
    data['order_id'] = orderId;
    data['payment_id'] = paymentId;
    if (lostDeal != null) {
      data['lostDeal'] = lostDeal!.map((v) => v.toJson()).toList();
    }
    if (likedCars != null) {
      data['likedCars'] = likedCars!.map((v) => v.toJson()).toList();
    }
    if (biddedCars != null) {
      data['biddedCars'] = biddedCars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressProofBack {
  String? name;
  String? url;
  String? type;

  AddressProofBack({this.name, url, this.type});

  AddressProofBack.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['type'] = type;
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

  LostDeal(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.frontLeft,
        this.status});

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
  num? realValue;
  String? monthAndYearOfManufacture;
  num? odometerReading;
  String? transmission;
  num? statusValues;
  List<LeaderBoard>? leaderBoard;
  Front? front;
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
  String? winner;

  LikedCars(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.status,
        this.frontLeft,
        this.winner,
        this.realValue,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.transmission,
        this.statusValues,
        this.leaderBoard,
        this.front,
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
        this.bidStartTime,
        this.otbEndTime,
        this.otbStartTime
      });

  LikedCars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    highestBid = json['highestBid'];
    status = json['status'];
    bidEndTime = json['bidEndTime'];
    bidStartTime = json['bidStartTime'];
    otbStartTime = json['otbStartTime'];
    otbEndTime = json['otbEndTime'];
    frontLeft = json['frontLeft'] != null
        ? FrontLeft.fromJson(json['frontLeft'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['uniqueId'] = uniqueId;
    data['make'] = make;
    data['model'] = model;
    data['variant'] = variant;
    data['highestBid'] = highestBid;
    data['bidEndTime'] = bidEndTime;
    data['bidStartTime'] = bidStartTime;
    data['otbEndTime'] = otbEndTime;
    data['otbStartTime'] = otbStartTime;
    data['status'] = status;
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
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

class BiddedCars {
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
  String? winner;
  num? realValue;
  String? monthAndYearOfManufacture;
  num? odometerReading;
  String? transmission;
  num? statusValues;
  List<LeaderBoard>? leaderBoard;
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

  BiddedCars(
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
        this.winner,
        this.realValue,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.transmission,
        this.statusValues,
        this.leaderBoard,
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
        this.bidStartTime
      });

  BiddedCars.fromJson(Map<String, dynamic> json) {
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
    winner = json['winner'];
    bidEndTime = json['bidEndTime'];
    bidStartTime = json['bidStartTime'];
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
    data['winner'] = winner;
    data['bidEndTime'] = bidEndTime;
    data['bidStartTime'] = bidStartTime;
    return data;
  }
}

class LeaderBoard {
  num? amount;
  String? userId;
  bool? isAutobid;

  LeaderBoard({this.amount, this.userId, this.isAutobid});

  LeaderBoard.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    userId = json['userId'];
    isAutobid = json['isAutobid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['userId'] = userId;
    data['isAutobid'] = isAutobid;
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
