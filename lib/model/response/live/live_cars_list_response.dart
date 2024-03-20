class LiveCarsResponse {
  String? status;
  String? message;
  List<Data>? data;
  int? count;
  Meta? meta;

  LiveCarsResponse({this.status, this.message, this.data, this.count, this.meta});

  LiveCarsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    count = json['count'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
  Front? engineCompartment;
  num? engineStar;
  String? transmission;
  num? exteriorStar;
  num? testDriveStar;
  num? interiorAndElectricalStar;
  String? specialComments;

  Data({this.sId, this.uniqueId, this.make, this.model, this.variant, this.maskedRegNumber, this.vehicleLocation, this.ownershipNumber, this.fuelType, this.qcStatus, this.highestBid, this.totalBidder, this.status, this.createdAt, this.realValue, this.front, this.frontLeft, this.frontRight, this.frontWithHoodOpen, this.rear, this.rearLeft, this.rearRight, this.monthAndYearOfManufacture, this.engineCompartment, this.engineStar, this.transmission, this.exteriorStar, this.testDriveStar, this.interiorAndElectricalStar, this.specialComments});

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
    front = json['front'] != null ? Front.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null ? Front.fromJson(json['frontLeft']) : null;
    frontRight = json['frontRight'] != null ? Front.fromJson(json['frontRight']) : null;
    frontWithHoodOpen = json['frontWithHoodOpen'] != null ? Front.fromJson(json['frontWithHoodOpen']) : null;
    rear = json['rear'] != null ? Front.fromJson(json['rear']) : null;
    rearLeft = json['rearLeft'] != null ? Front.fromJson(json['rearLeft']) : null;
    rearRight = json['rearRight'] != null ? Front.fromJson(json['rearRight']) : null;
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    engineCompartment = json['engineCompartment'] != null ? Front.fromJson(json['engineCompartment']) : null;
    engineStar = json['engineStar'];
    transmission = json['transmission'];
    exteriorStar = json['exteriorStar'];
    testDriveStar = json['testDriveStar'];
    interiorAndElectricalStar = json['interiorAndElectricalStar'];
    specialComments = json['specialComments'];
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
    data['realValue'] = realValue;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
    }
    if (frontWithHoodOpen != null) {
      data['frontWithHoodOpen'] = frontWithHoodOpen!.toJson();
    }
    if (rear != null) {
      data['rear'] = rear!.toJson();
    }
    if (rearLeft != null) {
      data['rearLeft'] = rearLeft!.toJson();
    }
    if (rearRight != null) {
      data['rearRight'] = rearRight!.toJson();
    }
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    data['engineStar'] = engineStar;
    data['transmission'] = transmission;
    data['exteriorStar'] = exteriorStar;
    data['testDriveStar'] = testDriveStar;
    data['interiorAndElectricalStar'] = interiorAndElectricalStar;
    data['specialComments'] = specialComments;
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
