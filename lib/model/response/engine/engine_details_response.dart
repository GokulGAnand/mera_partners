class EngineResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  EngineResponse({this.status, this.message, this.data, this.meta});

  EngineResponse.fromJson(Map<String, dynamic> json) {
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
  int? engineCylinder;
  String? evaluationStatusForEngine;
  String? createdAt;
  String? updatedAt;
  Battery? battery;
  Battery? blowBy;
  Battery? clutch;
  String? compression;
  String? coolant;
  String? engineComment;
  Battery? engineOil;
  String? engineSound;
  String? exhaustSmoke;
  Battery? gearBox;
  String? gearBoxLeakage;
  Battery? mount;
  String? radiator;
  String? silencer;
  String? startingMotor;
  String? summary;
  Battery? sump;
  Battery? turboCharger;

  Data(
      {this.sId,
        this.carId,
        this.engineCylinder,
        this.evaluationStatusForEngine,
        this.createdAt,
        this.updatedAt,
        this.battery,
        this.blowBy,
        this.clutch,
        this.compression,
        this.coolant,
        this.engineComment,
        this.engineOil,
        this.engineSound,
        this.exhaustSmoke,
        this.gearBox,
        this.gearBoxLeakage,
        this.mount,
        this.radiator,
        this.silencer,
        this.startingMotor,
        this.summary,
        this.sump,
        this.turboCharger});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    engineCylinder = json['engineCylinder'];
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    battery =
    json['battery'] != null ? new Battery.fromJson(json['battery']) : null;
    blowBy =
    json['blowBy'] != null ? new Battery.fromJson(json['blowBy']) : null;
    clutch =
    json['clutch'] != null ? new Battery.fromJson(json['clutch']) : null;
    compression = json['compression'];
    coolant = json['coolant'];
    engineComment = json['engineComment'];
    engineOil = json['engineOil'] != null
        ? new Battery.fromJson(json['engineOil'])
        : null;
    engineSound = json['engineSound'];
    exhaustSmoke = json['exhaustSmoke'];
    gearBox =
    json['gearBox'] != null ? new Battery.fromJson(json['gearBox']) : null;
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'] != null ? new Battery.fromJson(json['mount']) : null;
    radiator = json['radiator'];
    silencer = json['silencer'];
    startingMotor = json['startingMotor'];
    summary = json['summary'];
    sump = json['sump'] != null ? new Battery.fromJson(json['sump']) : null;
    turboCharger = json['turboCharger'] != null
        ? new Battery.fromJson(json['turboCharger'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['engineCylinder'] = this.engineCylinder;
    data['evaluationStatusForEngine'] = this.evaluationStatusForEngine;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.battery != null) {
      data['battery'] = this.battery!.toJson();
    }
    if (this.blowBy != null) {
      data['blowBy'] = this.blowBy!.toJson();
    }
    if (this.clutch != null) {
      data['clutch'] = this.clutch!.toJson();
    }
    data['compression'] = this.compression;
    data['coolant'] = this.coolant;
    data['engineComment'] = this.engineComment;
    if (this.engineOil != null) {
      data['engineOil'] = this.engineOil!.toJson();
    }
    data['engineSound'] = this.engineSound;
    data['exhaustSmoke'] = this.exhaustSmoke;
    if (this.gearBox != null) {
      data['gearBox'] = this.gearBox!.toJson();
    }
    data['gearBoxLeakage'] = this.gearBoxLeakage;
    if (this.mount != null) {
      data['mount'] = this.mount!.toJson();
    }
    data['radiator'] = this.radiator;
    data['silencer'] = this.silencer;
    data['startingMotor'] = this.startingMotor;
    data['summary'] = this.summary;
    if (this.sump != null) {
      data['sump'] = this.sump!.toJson();
    }
    if (this.turboCharger != null) {
      data['turboCharger'] = this.turboCharger!.toJson();
    }
    return data;
  }
}

class Battery {
  List<String>? condition;

  Battery({this.condition});

  Battery.fromJson(Map<String, dynamic> json) {
    condition = json['condition'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['condition'] = this.condition;
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
