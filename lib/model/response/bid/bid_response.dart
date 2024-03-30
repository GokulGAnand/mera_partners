class BidResponse {
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
  Front? front;
  Front? frontLeft;
  Front? frontRight;
  Front? rear;
  Front? rearLeft;
  Front? rearRight;
  String? winner;
  String? monthAndYearOfManufacture;
  int? odometerReading;
  int? statusValues;

  BidResponse(
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
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rear,
        this.rearLeft,
        this.rearRight,
        this.winner,
        this.monthAndYearOfManufacture,
        this.odometerReading,
        this.statusValues});

  BidResponse.fromJson(Map<String, dynamic> json) {
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
    front = json['front'] != null ? Front.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? Front.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? Front.fromJson(json['frontRight'])
        : null;
    rear = json['rear'] != null ? Front.fromJson(json['rear']) : null;
    rearLeft =
    json['rearLeft'] != null ? Front.fromJson(json['rearLeft']) : null;
    rearRight = json['rearRight'] != null
        ? Front.fromJson(json['rearRight'])
        : null;
    winner = json['winner'];
    monthAndYearOfManufacture = json['monthAndYearOfManufacture'];
    odometerReading = json['odometerReading'];
    statusValues = json['statusValues'];
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
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
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
    data['winner'] = winner;
    data['monthAndYearOfManufacture'] = monthAndYearOfManufacture;
    data['odometerReading'] = odometerReading;
    data['statusValues'] = statusValues;
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
