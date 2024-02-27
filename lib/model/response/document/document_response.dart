class DocumentResponse {
  String? status;
  String? message;
  Data? data;
  Meta? meta;

  DocumentResponse({this.status, this.message, this.data, this.meta});

  DocumentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? taxValidity;
  String? rcAvailability;
  String? bankName;
  String? fitnessValidityPeriod;
  String? form35;
  String? hypothecation;
  String? insurance;
  String? insuranceCompany;
  String? insuranceIDV;
  String? insuranceMismatch;
  String? insuranceRemarks;
  String? insuranceValidity;
  String? interStateTransfer;
  String? loanNoc;
  String? loanStatus;
  String? ncb;
  int? ncbPercentage;
  String? rcMismatch;
  String? rcRemarks;
  String? remarks;
  RcFront? rcFront;
  RcFront? rcBack;
  RcFront? nocImage;
  RcFront? pucCertificate;
  RcFront? form35Image;
  RcFront? chassisImage;

  Data(
      {this.taxValidity,
        this.rcAvailability,
        this.bankName,
        this.fitnessValidityPeriod,
        this.form35,
        this.hypothecation,
        this.insurance,
        this.insuranceCompany,
        this.insuranceIDV,
        this.insuranceMismatch,
        this.insuranceRemarks,
        this.insuranceValidity,
        this.interStateTransfer,
        this.loanNoc,
        this.loanStatus,
        this.ncb,
        this.ncbPercentage,
        this.rcMismatch,
        this.rcRemarks,
        this.remarks,
        this.rcFront,
        this.rcBack,
        this.nocImage,
        this.pucCertificate,
        this.form35Image,
        this.chassisImage});

  Data.fromJson(Map<String, dynamic> json) {
    taxValidity = json['taxValidity'];
    rcAvailability = json['rcAvailability'];
    bankName = json['bankName'];
    fitnessValidityPeriod = json['fitnessValidityPeriod'];
    form35 = json['form35'];
    hypothecation = json['hypothecation'];
    insurance = json['insurance'];
    insuranceCompany = json['insuranceCompany'];
    insuranceIDV = json['insuranceIDV'];
    insuranceMismatch = json['insuranceMismatch'];
    insuranceRemarks = json['insuranceRemarks'];
    insuranceValidity = json['insuranceValidity'];
    interStateTransfer = json['interStateTransfer'];
    loanNoc = json['loanNoc'];
    loanStatus = json['loanStatus'];
    ncb = json['ncb'];
    ncbPercentage = json['ncbPercentage'];
    rcMismatch = json['rcMismatch'];
    rcRemarks = json['rcRemarks'];
    remarks = json['remarks'];
    rcFront =
    json['rcFront'] != null ? new RcFront.fromJson(json['rcFront']) : null;
    rcBack =
    json['rcBack'] != null ? new RcFront.fromJson(json['rcBack']) : null;
    nocImage = json['nocImage'] != null
        ? new RcFront.fromJson(json['nocImage'])
        : null;
    pucCertificate = json['pucCertificate'] != null
        ? new RcFront.fromJson(json['pucCertificate'])
        : null;
    form35Image = json['form35Image'] != null
        ? new RcFront.fromJson(json['form35Image'])
        : null;
    chassisImage = json['chassisImage'] != null
        ? new RcFront.fromJson(json['chassisImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxValidity'] = this.taxValidity;
    data['rcAvailability'] = this.rcAvailability;
    data['bankName'] = this.bankName;
    data['fitnessValidityPeriod'] = this.fitnessValidityPeriod;
    data['form35'] = this.form35;
    data['hypothecation'] = this.hypothecation;
    data['insurance'] = this.insurance;
    data['insuranceCompany'] = this.insuranceCompany;
    data['insuranceIDV'] = this.insuranceIDV;
    data['insuranceMismatch'] = this.insuranceMismatch;
    data['insuranceRemarks'] = this.insuranceRemarks;
    data['insuranceValidity'] = this.insuranceValidity;
    data['interStateTransfer'] = this.interStateTransfer;
    data['loanNoc'] = this.loanNoc;
    data['loanStatus'] = this.loanStatus;
    data['ncb'] = this.ncb;
    data['ncbPercentage'] = this.ncbPercentage;
    data['rcMismatch'] = this.rcMismatch;
    data['rcRemarks'] = this.rcRemarks;
    data['remarks'] = this.remarks;
    if (this.rcFront != null) {
      data['rcFront'] = this.rcFront!.toJson();
    }
    if (this.rcBack != null) {
      data['rcBack'] = this.rcBack!.toJson();
    }
    if (this.nocImage != null) {
      data['nocImage'] = this.nocImage!.toJson();
    }
    if (this.pucCertificate != null) {
      data['pucCertificate'] = this.pucCertificate!.toJson();
    }
    if (this.form35Image != null) {
      data['form35Image'] = this.form35Image!.toJson();
    }
    if (this.chassisImage != null) {
      data['chassisImage'] = this.chassisImage!.toJson();
    }
    return data;
  }
}

class RcFront {
  String? name;
  String? url;
  String? remarks;

  RcFront({this.name, this.url, this.remarks});

  RcFront.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
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
