class LiveCarsResponse {
  String? status;
  String? message;
  List<Data>? data;
  int? count;
  Meta? meta;

  LiveCarsResponse(
      {this.status, this.message, this.data, this.count, this.meta});

  LiveCarsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
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
  int? realValue;
  Front? front;
  Front? frontLeft;
  Front? frontRight;
  Front? frontWithHoodOpen;
  Front? rear;
  Front? rearLeft;
  Front? rearRight;
  String? monthAndYearOfManufacture;
  int? odometerReading;
  Front? engineCompartment;
  int? statusValues;
  int? engineStar;
  String? transmission;
  double? exteriorStar;
  int? testDriveStar;
  int? interiorAndElectricalStar;
  String? specialComments;

  Data(
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
        this.realValue,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.frontWithHoodOpen,
        this.rear,
        this.rearLeft,
        this.rearRight,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.engineCompartment,
        this.statusValues,
        this.engineStar,
        this.transmission,
        this.exteriorStar,
        this.testDriveStar,
        this.interiorAndElectricalStar,
        this.specialComments});

  Data.fromJson(Map<String, dynamic> json) {
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
    realValue = json['realValue'];
    front = json['front'] != null ? new Front.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? new Front.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? new Front.fromJson(json['frontRight'])
        : null;
    frontWithHoodOpen = json['frontWithHoodOpen'] != null
        ? new Front.fromJson(json['frontWithHoodOpen'])
        : null;
    rear = json['rear'] != null ? new Front.fromJson(json['rear']) : null;
    rearLeft =
    json['rearLeft'] != null ? new Front.fromJson(json['rearLeft']) : null;
    rearRight = json['rearRight'] != null
        ? new Front.fromJson(json['rearRight'])
        : null;
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    odometerReading = json['odometerReading'];
    engineCompartment = json['engineCompartment'] != null
        ? new Front.fromJson(json['engineCompartment'])
        : null;
    statusValues = json['statusValues'];
    engineStar = json['engineStar'];
    transmission = json['transmission'];
    exteriorStar = json['exteriorStar'];
    testDriveStar = json['testDriveStar'];
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
    specialComments = json['specialComments'];
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
    data['realValue'] = this.realValue;
    if (this.front != null) {
      data['front'] = this.front!.toJson();
    }
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
    }
    if (this.frontRight != null) {
      data['frontRight'] = this.frontRight!.toJson();
    }
    if (this.frontWithHoodOpen != null) {
      data['frontWithHoodOpen'] = this.frontWithHoodOpen!.toJson();
    }
    if (this.rear != null) {
      data['rear'] = this.rear!.toJson();
    }
    if (this.rearLeft != null) {
      data['rearLeft'] = this.rearLeft!.toJson();
    }
    if (this.rearRight != null) {
      data['rearRight'] = this.rearRight!.toJson();
    }
    data['monthAndYearOfManufacture'] = this.monthAndYearOfManufacture;
    data['odometerReading'] = this.odometerReading;
    if (this.engineCompartment != null) {
      data['engineCompartment'] = this.engineCompartment!.toJson();
    }
    data['statusValues'] = this.statusValues;
    data['engineStar'] = this.engineStar;
    data['transmission'] = this.transmission;
    data['exteriorStar'] = this.exteriorStar;
    data['testDriveStar'] = this.testDriveStar;
    data['interiorAndElectricalStar'] = this.interiorAndElectricalStar;
    data['specialComments'] = this.specialComments;
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
