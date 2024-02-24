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
  String? evaluationStatusForEngine;
  String? createdAt;
  String? updatedAt;
  Battery? battery;
  Battery? blowBy;
  Battery? clutch;
  String? coolant;
  Battery? engine;
  String? engineComment;
  Battery? engineCompartment;
  Battery? engineOil;
  String? engineSound;
  String? exhaustSmoke;
  Battery? gearBox;
  String? gearBoxLeakage;
  Battery? mount;
  String? radiator;
  String? silencer;
  Battery? startVideo;
  String? startingMotor;
  Battery? sump;
  Battery? turboCharger;

  Data(
      {this.sId,
        this.carId,
        this.evaluationStatusForEngine,
        this.createdAt,
        this.updatedAt,
        this.battery,
        this.blowBy,
        this.clutch,
        this.coolant,
        this.engine,
        this.engineComment,
        this.engineCompartment,
        this.engineOil,
        this.engineSound,
        this.exhaustSmoke,
        this.gearBox,
        this.gearBoxLeakage,
        this.mount,
        this.radiator,
        this.silencer,
        this.startVideo,
        this.startingMotor,
        this.sump,
        this.turboCharger});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    battery =
    json['battery'] != null ? new Battery.fromJson(json['battery']) : null;
    blowBy =
    json['blowBy'] != null ? new Battery.fromJson(json['blowBy']) : null;
    clutch =
    json['clutch'] != null ? new Battery.fromJson(json['clutch']) : null;
    coolant = json['coolant'];
    engine =
    json['engine'] != null ? new Battery.fromJson(json['engine']) : null;
    engineComment = json['engineComment'];
    engineCompartment = json['engineCompartment'] != null
        ? new Battery.fromJson(json['engineCompartment'])
        : null;
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
    startVideo = json['startVideo'] != null
        ? new Battery.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    sump = json['sump'] != null ? new Battery.fromJson(json['sump']) : null;
    turboCharger = json['turboCharger'] != null
        ? new Battery.fromJson(json['turboCharger'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
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
    data['coolant'] = this.coolant;
    if (this.engine != null) {
      data['engine'] = this.engine!.toJson();
    }
    data['engineComment'] = this.engineComment;
    if (this.engineCompartment != null) {
      data['engineCompartment'] = this.engineCompartment!.toJson();
    }
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
    if (this.startVideo != null) {
      data['startVideo'] = this.startVideo!.toJson();
    }
    data['startingMotor'] = this.startingMotor;
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
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  Battery({this.name, this.url, this.condition, this.remarks});

  Battery.fromJson(Map<String, dynamic> json) {
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
