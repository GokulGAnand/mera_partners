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
        data!.add(Data.fromJson(v));
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

class Data {
  String? sId;
  String? userId;
  bool? isBlocked;
  String? role;
  int? contactNo;
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
  String? email;
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
        this.email,
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
    email = json['email'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['isBlocked'] = isBlocked;
    data['role'] = role;
    data['contactNo'] = contactNo;
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
    data['email'] = email;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
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
