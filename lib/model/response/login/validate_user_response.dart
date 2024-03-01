class ValidateUserResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  ValidateUserResponse({this.status, this.message, this.data, this.meta});

  ValidateUserResponse.fromJson(Map<String, dynamic> json) {
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
  String? fullname;
  String? userId;
  bool? isBlocked;
  String? role;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? city;
  String? district;
  String? state;
  int? contactNo;

  Data(
      {this.sId,
        this.fullname,
        this.userId,
        this.isBlocked,
        this.role,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.city,
        this.district,
        this.state,
        this.contactNo});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    userId = json['userId'];
    isBlocked = json['isBlocked'];
    role = json['role'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    contactNo = json['contactNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['userId'] = userId;
    data['isBlocked'] = isBlocked;
    data['role'] = role;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['contactNo'] = contactNo;
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
