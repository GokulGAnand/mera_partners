class UserResponse {
  String? status;
  String? message;
  List<Data>? data;
  List<LikedCars>? biddedCars;
  String? sId;
  String? userId;
  bool? isBlocked;
  String? role;
  int? contactNo;
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
  Meta? meta;

  UserResponse(
      {this.status,
        this.message,
        this.data,
        this.biddedCars,
        this.sId,
        this.userId,
        this.isBlocked,
        this.role,
        this.contactNo,
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
        this.meta});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['biddedCars'] != null) {
      biddedCars = <LikedCars>[];
      json['biddedCars'].forEach((v) {
        biddedCars!.add(new LikedCars.fromJson(v));
      });
    }
    sId = json['_id'];
    userId = json['userId'];
    isBlocked = json['isBlocked'];
    role = json['role'];
    contactNo = json['contactNo'];
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
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.biddedCars != null) {
      data['biddedCars'] = this.biddedCars!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['isBlocked'] = this.isBlocked;
    data['role'] = this.role;
    data['contactNo'] = this.contactNo;
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
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  List<LikedCars>? likedCars;

  Data({this.likedCars});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['likedCars'] != null) {
      likedCars = <LikedCars>[];
      json['likedCars'].forEach((v) {
        likedCars!.add(new LikedCars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.likedCars != null) {
      data['likedCars'] = this.likedCars!.map((v) => v.toJson()).toList();
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

  LikedCars(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.status,
        this.frontLeft});

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

  LostDeal(
      {this.sId,
        this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.highestBid,
        this.status});

  LostDeal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    highestBid = json['highestBid'];
    status = json['status'];
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
