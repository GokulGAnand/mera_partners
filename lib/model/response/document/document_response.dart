class DocumentResponse {
  String? status;
  String? message;
  Data? data;
  Meta? meta;

  DocumentResponse({this.status, this.message, this.data, this.meta});

  DocumentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
  String? insurance;
  String? insuranceCompany;
  String? insuranceIDV;
  String? insuranceMismatch;
  String? insuranceRemarks;
  String? insuranceValidity;
  String? interStateTransfer;
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
        this.insurance,
        this.insuranceCompany,
        this.insuranceIDV,
        this.insuranceMismatch,
        this.insuranceRemarks,
        this.insuranceValidity,
        this.interStateTransfer,
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
    insurance = json['insurance'];
    insuranceCompany = json['insuranceCompany'];
    insuranceIDV = json['insuranceIDV'];
    insuranceMismatch = json['insuranceMismatch'];
    insuranceRemarks = json['insuranceRemarks'];
    insuranceValidity = json['insuranceValidity'];
    interStateTransfer = json['interStateTransfer'];
    loanStatus = json['loanStatus'];
    ncb = json['ncb'];
    ncbPercentage = json['ncbPercentage'];
    rcMismatch = json['rcMismatch'];
    rcRemarks = json['rcRemarks'];
    remarks = json['remarks'];
    rcFront =
    json['rcFront'] != null ? RcFront.fromJson(json['rcFront']) : null;
    rcBack =
    json['rcBack'] != null ? RcFront.fromJson(json['rcBack']) : null;
    nocImage = json['nocImage'] != null
        ? RcFront.fromJson(json['nocImage'])
        : null;
    pucCertificate = json['pucCertificate'] != null
        ? RcFront.fromJson(json['pucCertificate'])
        : null;
    form35Image = json['form35Image'] != null
        ? RcFront.fromJson(json['form35Image'])
        : null;
    chassisImage = json['chassisImage'] != null
        ? RcFront.fromJson(json['chassisImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxValidity'] = taxValidity;
    data['rcAvailability'] = rcAvailability;
    data['bankName'] = bankName;
    data['fitnessValidityPeriod'] = fitnessValidityPeriod;
    data['form35'] = form35;
    data['insurance'] = insurance;
    data['insuranceCompany'] = insuranceCompany;
    data['insuranceIDV'] = insuranceIDV;
    data['insuranceMismatch'] = insuranceMismatch;
    data['insuranceRemarks'] = insuranceRemarks;
    data['insuranceValidity'] = insuranceValidity;
    data['interStateTransfer'] = interStateTransfer;
    data['loanStatus'] = loanStatus;
    data['ncb'] = ncb;
    data['ncbPercentage'] = ncbPercentage;
    data['rcMismatch'] = rcMismatch;
    data['rcRemarks'] = rcRemarks;
    data['remarks'] = remarks;
    if (rcFront != null) {
      data['rcFront'] = rcFront!.toJson();
    }
    if (rcBack != null) {
      data['rcBack'] = rcBack!.toJson();
    }
    if (nocImage != null) {
      data['nocImage'] = nocImage!.toJson();
    }
    if (pucCertificate != null) {
      data['pucCertificate'] = pucCertificate!.toJson();
    }
    if (form35Image != null) {
      data['form35Image'] = form35Image!.toJson();
    }
    if (chassisImage != null) {
      data['chassisImage'] = chassisImage!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
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
