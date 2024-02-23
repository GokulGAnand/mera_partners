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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullname'] = this.fullname;
    data['userId'] = this.userId;
    data['isBlocked'] = this.isBlocked;
    data['role'] = this.role;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['contactNo'] = this.contactNo;
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
