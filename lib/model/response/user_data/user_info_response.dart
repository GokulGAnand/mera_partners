class UserInfoResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  UserInfoResponse({this.status, this.message, this.data, this.meta});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
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

  Data(
      {this.sId,
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
        this.paymentId});

  Data.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
