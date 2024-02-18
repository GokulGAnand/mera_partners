class PendingEvaluationList {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  PendingEvaluationList({this.status, this.message, this.data, this.meta});

  PendingEvaluationList.fromJson(Map<String, dynamic> json) {
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
  int? uniqueId;
  String? make;
  String? model;
  String? variant;
  int? odometerReading;
  String? transmission;
  String? regNumber;
  String? monthAndYearOfManufacture;
  String? inspectionDate;

  Data(
      {this.uniqueId,
        this.make,
        this.model,
        this.variant,
        this.odometerReading,
        this.transmission,
        this.regNumber,
        this.monthAndYearOfManufacture,
        this.inspectionDate});

  Data.fromJson(Map<String, dynamic> json) {
    uniqueId = json['uniqueId'];
    make = json['make'];
    model = json['model'];
    variant = json['variant'];
    odometerReading = json['odometerReading'];
    transmission = json['transmission'];
    regNumber = json['regNumber'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    inspectionDate = json['inspectionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniqueId'] = this.uniqueId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['variant'] = this.variant;
    data['odometerReading'] = this.odometerReading;
    data['transmission'] = this.transmission;
    data['regNumber'] = this.regNumber;
    data['monthAndYearOfManufacture'] = this.monthAndYearOfManufacture;
    data['inspectionDate'] = this.inspectionDate;
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