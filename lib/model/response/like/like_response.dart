class LikedCarResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  LikedCarResponse({this.status, this.message, this.data, this.meta});

  LikedCarResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  List<dynamic>? lostDeal;
  List<dynamic>? biddedCars;
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
  List<LikedCars>? likedCars;

  Data({
    this.lostDeal,
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
    this.likedCars,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['lostDeal'] != null) {
      lostDeal = <dynamic>[];
      json['lostDeal'].forEach((v) {
        lostDeal!.add(v);
      });
    }
    if (json['biddedCars'] != null) {
      biddedCars = <dynamic>[];
      json['biddedCars'].forEach((v) {
        biddedCars!.add(v);
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
    if (json['likedCars'] != null) {
      likedCars = <LikedCars>[];
      json['likedCars'].forEach((v) {
        likedCars!.add(new LikedCars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lostDeal != null) {
      data['lostDeal'] = this.lostDeal;
    }
    if (this.biddedCars != null) {
      data['biddedCars'] = this.biddedCars;
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

  LikedCars({
    this.sId,
    this.uniqueId,
    this.make,
    this.model,
    this.variant,
    this.highestBid,
    this.status,
    this.frontLeft,
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
