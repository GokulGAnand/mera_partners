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
        data!.add(new UserData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class UserData {
  String? sId;
  String? userId;
  bool? isBlocked;
  String? role;
  int? contactNo;
  bool? isDeactivate;
  bool? isDeposited;
  int? depositedAmount;
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
        ? new AddressProofBack.fromJson(json['addressProofBack'])
        : null;
    addressProofFront = json['addressProofFront'] != null
        ? new AddressProofBack.fromJson(json['addressProofFront'])
        : null;
    businessAddress = json['businessAddress'];
    businessName = json['businessName'];
    canceledCheque = json['canceledCheque'] != null
        ? new AddressProofBack.fromJson(json['canceledCheque'])
        : null;
    district = json['district'];
    fullname = json['fullname'];
    panCard = json['panCard'] != null
        ? new AddressProofBack.fromJson(json['panCard'])
        : null;
    pincode = json['pincode'];
    shopPicture = json['shopPicture'] != null
        ? new AddressProofBack.fromJson(json['shopPicture'])
        : null;
    visitingCard = json['visitingCard'] != null
        ? new AddressProofBack.fromJson(json['visitingCard'])
        : null;
    orderId = json['order_id'];
    paymentId = json['payment_id'];
    if (json['lostDeal'] != null) {
      lostDeal = <LostDeal>[];
      json['lostDeal'].forEach((v) {
        lostDeal!.add(new LostDeal.fromJson(v));
      });
    }
    if (json['likedCars'] != null) {
      likedCars = <LikedCars>[];
      json['likedCars'].forEach((v) {
        likedCars!.add(new LikedCars.fromJson(v));
      });
    }
    if (json['biddedCars'] != null) {
      biddedCars = <BiddedCars>[];
      json['biddedCars'].forEach((v) {
        biddedCars!.add(new BiddedCars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['isBlocked'] = this.isBlocked;
    data['role'] = this.role;
    data['contactNo'] = this.contactNo;
    data['isDeactivate'] = this.isDeactivate;
    data['isDeposited'] = this.isDeposited;
    data['depositedAmount'] = this.depositedAmount;
    data['isDocumentsVerified'] = this.isDocumentsVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.addressProofBack != null) {
      data['addressProofBack'] = this.addressProofBack!.toJson();
    }
    if (this.addressProofFront != null) {
      data['addressProofFront'] = this.addressProofFront!.toJson();
    }
    data['businessAddress'] = this.businessAddress;
    data['businessName'] = this.businessName;
    if (this.canceledCheque != null) {
      data['canceledCheque'] = this.canceledCheque!.toJson();
    }
    data['district'] = this.district;
    data['fullname'] = this.fullname;
    if (this.panCard != null) {
      data['panCard'] = this.panCard!.toJson();
    }
    data['pincode'] = this.pincode;
    if (this.shopPicture != null) {
      data['shopPicture'] = this.shopPicture!.toJson();
    }
    if (this.visitingCard != null) {
      data['visitingCard'] = this.visitingCard!.toJson();
    }
    data['order_id'] = this.orderId;
    data['payment_id'] = this.paymentId;
    if (this.lostDeal != null) {
      data['lostDeal'] = this.lostDeal!.map((v) => v.toJson()).toList();
    }
    if (this.likedCars != null) {
      data['likedCars'] = this.likedCars!.map((v) => v.toJson()).toList();
    }
    if (this.biddedCars != null) {
      data['biddedCars'] = this.biddedCars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressProofBack {
  String? name;
  String? url;
  String? type;

  AddressProofBack({this.name, this.url, this.type});

  AddressProofBack.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class LostDeal {
  String? sId;
  int? uniqueId;
  String? make;
  String? model;
  String? variant;
  int? highestBid;
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
        ? new FrontLeft.fromJson(json['frontLeft'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uniqueId'] = this.uniqueId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['variant'] = this.variant;
    data['highestBid'] = this.highestBid;
    data['status'] = this.status;
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
    }
    return data;
  }
}

class LikedCars {
  String? sId;
  int? uniqueId;
  String? make;
  String? model;
  String? variant;
  int? highestBid;
  String? status;
  FrontLeft? frontLeft;
  int? realValue;
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
        this.bidStartTime
      });

  LikedCars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    highestBid = json['highestBid'];
    status = json['status'];
    frontLeft = json['frontLeft'] != null
        ? new FrontLeft.fromJson(json['frontLeft'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uniqueId'] = this.uniqueId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['variant'] = this.variant;
    data['highestBid'] = this.highestBid;
    data['status'] = this.status;
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['condition'] = this.condition;
    data['remarks'] = this.remarks;
    return data;
  }
}

class BiddedCars {
  String? sId;
  int? uniqueId;
  String? make;
  String? model;
  String? variant;
  String? maskedRegNumber;
  String? vehicleLocation;
  String? ownershipNumber;
  String? fuelType;
  String? qcStatus;
  int? highestBid;
  int? totalBidder;
  String? status;
  String? createdAt;
  String? winner;
  int? realValue;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uniqueId'] = this.uniqueId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['variant'] = this.variant;
    data['maskedRegNumber'] = this.maskedRegNumber;
    data['vehicleLocation'] = this.vehicleLocation;
    data['ownershipNumber'] = this.ownershipNumber;
    data['fuelType'] = this.fuelType;
    data['qcStatus'] = this.qcStatus;
    data['highestBid'] = this.highestBid;
    data['totalBidder'] = this.totalBidder;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['winner'] = this.winner;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = this.access;
    data['refresh'] = this.refresh;
    return data;
  }
}
