class DocumentResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  DocumentResponse({this.status, this.message, this.data, this.meta});

  DocumentResponse.fromJson(Map<String, dynamic> json) {
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
  String? carId;
  String? rcOwnerName;
  String? isCarRegistered;
  String? regNumber;
  String? customerPrice;
  String? evaluationSatusForEngine;
  String? evaluationSatusForDocument;
  String? evaluationSatusForExterior;
  String? evaluationSatusForInterior;
  String? evaluationSatusForTestDrive;
  String? evaluationSatusForFeature;
  String? evaluationSatusForAc;
  String? createdAt;
  String? updatedAt;
  ChassisImage? chassisImage;
  ChassisImage? form35;
  ChassisImage? nocImage;
  ChassisImage? pucCertificate;
  ChassisImage? rcBack;
  ChassisImage? rcFront;
  String? evaluationStatusForDocument;
  int? yearOfManufacture;
  String? valuationState;
  String? regState;
  String? regCity;
  String? regDate;
  String? bodyType;
  String? carLength;
  String? vehicleUsage;
  String? engineCC;
  String? ccClass;
  String? engineNumber;
  String? chasisNumber;
  String? color;
  String? seats;
  String? odometerWorking;
  int? odometerReading;
  String? accidential;
  String? oemWarrantyRemain;
  int? oemMonthRemain;
  String? oemKmRemain;
  String? bankName;
  String? fitnessValidityPeriod;
  String? hypothicationClosed;
  String? insurance;
  String? insuranceCompany;
  String? insuranceIDV;
  String? insuranceValidity;
  String? noc;
  String? rc;
  String? taxValidity;

  Data(
      {this.sId,
        this.carId,
        this.rcOwnerName,
        this.isCarRegistered,
        this.regNumber,
        this.customerPrice,
        this.evaluationSatusForEngine,
        this.evaluationSatusForDocument,
        this.evaluationSatusForExterior,
        this.evaluationSatusForInterior,
        this.evaluationSatusForTestDrive,
        this.evaluationSatusForFeature,
        this.evaluationSatusForAc,
        this.createdAt,
        this.updatedAt,
        this.chassisImage,
        this.form35,
        this.nocImage,
        this.pucCertificate,
        this.rcBack,
        this.rcFront,
        this.evaluationStatusForDocument,
        this.yearOfManufacture,
        this.valuationState,
        this.regState,
        this.regCity,
        this.regDate,
        this.bodyType,
        this.carLength,
        this.vehicleUsage,
        this.engineCC,
        this.ccClass,
        this.engineNumber,
        this.chasisNumber,
        this.color,
        this.seats,
        this.odometerWorking,
        this.odometerReading,
        this.accidential,
        this.oemWarrantyRemain,
        this.oemMonthRemain,
        this.oemKmRemain,
        this.bankName,
        this.fitnessValidityPeriod,
        this.hypothicationClosed,
        this.insurance,
        this.insuranceCompany,
        this.insuranceIDV,
        this.insuranceValidity,
        this.noc,
        this.rc,
        this.taxValidity});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    rcOwnerName = json['rcOwnerName'];
    isCarRegistered = json['isCarRegistered'];
    regNumber = json['regNumber'];
    customerPrice = json['customerPrice'];
    evaluationSatusForEngine = json['evaluationSatusForEngine'];
    evaluationSatusForDocument = json['evaluationSatusForDocument'];
    evaluationSatusForExterior = json['evaluationSatusForExterior'];
    evaluationSatusForInterior = json['evaluationSatusForInterior'];
    evaluationSatusForTestDrive = json['evaluationSatusForTestDrive'];
    evaluationSatusForFeature = json['evaluationSatusForFeature'];
    evaluationSatusForAc = json['evaluationSatusForAc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    chassisImage = json['chassisImage'] != null
        ? new ChassisImage.fromJson(json['chassisImage'])
        : null;
    form35 = json['form35'] != null
        ? new ChassisImage.fromJson(json['form35'])
        : null;
    nocImage = json['nocImage'] != null
        ? new ChassisImage.fromJson(json['nocImage'])
        : null;
    pucCertificate = json['pucCertificate'] != null
        ? new ChassisImage.fromJson(json['pucCertificate'])
        : null;
    rcBack = json['rcBack'] != null
        ? new ChassisImage.fromJson(json['rcBack'])
        : null;
    rcFront = json['rcFront'] != null
        ? new ChassisImage.fromJson(json['rcFront'])
        : null;
    evaluationStatusForDocument = json['evaluationStatusForDocument'];
    yearOfManufacture = json['yearOfManufacture'];
    valuationState = json['valuationState'];
    regState = json['regState'];
    regCity = json['regCity'];
    regDate = json['regDate'];
    bodyType = json['bodyType'];
    carLength = json['carLength'];
    vehicleUsage = json['vehicleUsage'];
    engineCC = json['engineCC'];
    ccClass = json['ccClass'];
    engineNumber = json['engineNumber'];
    chasisNumber = json['chasisNumber'];
    color = json['color'];
    seats = json['seats'];
    odometerWorking = json['odometerWorking'];
    odometerReading = json['odometerReading'];
    accidential = json['accidential'];
    oemWarrantyRemain = json['oemWarrantyRemain'];
    oemMonthRemain = json['oemMonthRemain'];
    oemKmRemain = json['oemKmRemain'];
    bankName = json['bankName'];
    fitnessValidityPeriod = json['fitnessValidityPeriod'];
    hypothicationClosed = json['hypothicationClosed'];
    insurance = json['insurance'];
    insuranceCompany = json['insuranceCompany'];
    insuranceIDV = json['insuranceIDV'];
    insuranceValidity = json['insuranceValidity'];
    noc = json['noc'];
    rc = json['rc'];
    taxValidity = json['taxValidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['rcOwnerName'] = this.rcOwnerName;
    data['isCarRegistered'] = this.isCarRegistered;
    data['regNumber'] = this.regNumber;
    data['customerPrice'] = this.customerPrice;
    data['evaluationSatusForEngine'] = this.evaluationSatusForEngine;
    data['evaluationSatusForDocument'] = this.evaluationSatusForDocument;
    data['evaluationSatusForExterior'] = this.evaluationSatusForExterior;
    data['evaluationSatusForInterior'] = this.evaluationSatusForInterior;
    data['evaluationSatusForTestDrive'] = this.evaluationSatusForTestDrive;
    data['evaluationSatusForFeature'] = this.evaluationSatusForFeature;
    data['evaluationSatusForAc'] = this.evaluationSatusForAc;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.chassisImage != null) {
      data['chassisImage'] = this.chassisImage!.toJson();
    }
    if (this.form35 != null) {
      data['form35'] = this.form35!.toJson();
    }
    if (this.nocImage != null) {
      data['nocImage'] = this.nocImage!.toJson();
    }
    if (this.pucCertificate != null) {
      data['pucCertificate'] = this.pucCertificate!.toJson();
    }
    if (this.rcBack != null) {
      data['rcBack'] = this.rcBack!.toJson();
    }
    if (this.rcFront != null) {
      data['rcFront'] = this.rcFront!.toJson();
    }
    data['evaluationStatusForDocument'] = this.evaluationStatusForDocument;
    data['yearOfManufacture'] = this.yearOfManufacture;
    data['valuationState'] = this.valuationState;
    data['regState'] = this.regState;
    data['regCity'] = this.regCity;
    data['regDate'] = this.regDate;
    data['bodyType'] = this.bodyType;
    data['carLength'] = this.carLength;
    data['vehicleUsage'] = this.vehicleUsage;
    data['engineCC'] = this.engineCC;
    data['ccClass'] = this.ccClass;
    data['engineNumber'] = this.engineNumber;
    data['chasisNumber'] = this.chasisNumber;
    data['color'] = this.color;
    data['seats'] = this.seats;
    data['odometerWorking'] = this.odometerWorking;
    data['odometerReading'] = this.odometerReading;
    data['accidential'] = this.accidential;
    data['oemWarrantyRemain'] = this.oemWarrantyRemain;
    data['oemMonthRemain'] = this.oemMonthRemain;
    data['oemKmRemain'] = this.oemKmRemain;
    data['bankName'] = this.bankName;
    data['fitnessValidityPeriod'] = this.fitnessValidityPeriod;
    data['hypothicationClosed'] = this.hypothicationClosed;
    data['insurance'] = this.insurance;
    data['insuranceCompany'] = this.insuranceCompany;
    data['insuranceIDV'] = this.insuranceIDV;
    data['insuranceValidity'] = this.insuranceValidity;
    data['noc'] = this.noc;
    data['rc'] = this.rc;
    data['taxValidity'] = this.taxValidity;
    return data;
  }
}

class ChassisImage {
  String? name;
  String? url;
  String? type;

  ChassisImage({this.name, this.url, this.type});

  ChassisImage.fromJson(Map<String, dynamic> json) {
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
