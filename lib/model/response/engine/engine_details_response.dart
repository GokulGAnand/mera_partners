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
  List<String>? battery;
  List<String>? blowBy;
  List<String>? clutch;
  String? engineComment;
  EngineCompartment? engineCompartment;
  List<String>? engineCondition;
  List<String>? engineOil;
  String? engineSound;
  EngineCompartment? engineTappetVideo;
  String? exhaustSmoke;
  List<String>? gearBox;
  String? radiator;
  String? silencer;
  String? compression;
  String? coolant;
  String? gearBoxLeakage;
  List<String>? mount;
  EngineCompartment? startVideo;
  String? startingMotor;
  String? summary;
  List<String>? sump;
  List<String>? turboCharger;

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
        this.engineComment,
        this.engineCompartment,
        this.engineCondition,
        this.engineOil,
        this.engineSound,
        this.engineTappetVideo,
        this.exhaustSmoke,
        this.gearBox,
        this.radiator,
        this.silencer,
        this.compression,
        this.coolant,
        this.gearBoxLeakage,
        this.mount,
        this.startVideo,
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
    battery = json['battery'].cast<String>();
    blowBy = json['blowBy'].cast<String>();
    clutch = json['clutch'].cast<String>();
    engineComment = json['engineComment'];
    engineCompartment = json['engineCompartment'] != null
        ? new EngineCompartment.fromJson(json['engineCompartment'])
        : null;
    engineCondition = json['engineCondition'].cast<String>();
    engineOil = json['engineOil'].cast<String>();
    engineSound = json['engineSound'];
    engineTappetVideo = json['engineTappetVideo'] != null
        ? new EngineCompartment.fromJson(json['engineTappetVideo'])
        : null;
    exhaustSmoke = json['exhaustSmoke'];
    gearBox = json['gearBox'].cast<String>();
    radiator = json['radiator'];
    silencer = json['silencer'];
    compression = json['compression'];
    coolant = json['coolant'];
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'].cast<String>();
    startVideo = json['startVideo'] != null
        ? new EngineCompartment.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    summary = json['summary'];
    sump = json['sump'].cast<String>();
    turboCharger = json['turboCharger'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['engineCylinder'] = this.engineCylinder;
    data['evaluationStatusForEngine'] = this.evaluationStatusForEngine;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['battery'] = this.battery;
    data['blowBy'] = this.blowBy;
    data['clutch'] = this.clutch;
    data['engineComment'] = this.engineComment;
    if (this.engineCompartment != null) {
      data['engineCompartment'] = this.engineCompartment!.toJson();
    }
    data['engineCondition'] = this.engineCondition;
    data['engineOil'] = this.engineOil;
    data['engineSound'] = this.engineSound;
    if (this.engineTappetVideo != null) {
      data['engineTappetVideo'] = this.engineTappetVideo!.toJson();
    }
    data['exhaustSmoke'] = this.exhaustSmoke;
    data['gearBox'] = this.gearBox;
    data['radiator'] = this.radiator;
    data['silencer'] = this.silencer;
    data['compression'] = this.compression;
    data['coolant'] = this.coolant;
    data['gearBoxLeakage'] = this.gearBoxLeakage;
    data['mount'] = this.mount;
    if (this.startVideo != null) {
      data['startVideo'] = this.startVideo!.toJson();
    }
    data['startingMotor'] = this.startingMotor;
    data['summary'] = this.summary;
    data['sump'] = this.sump;
    data['turboCharger'] = this.turboCharger;
    return data;
  }
}

class EngineCompartment {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  EngineCompartment({this.name, this.url, this.condition, this.remarks});

  EngineCompartment.fromJson(Map<String, dynamic> json) {
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
