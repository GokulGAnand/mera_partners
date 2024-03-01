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
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
    json['battery'] != null ? Battery.fromJson(json['battery']) : null;
    blowBy =
    json['blowBy'] != null ? Battery.fromJson(json['blowBy']) : null;
    clutch =
    json['clutch'] != null ? Battery.fromJson(json['clutch']) : null;
    coolant = json['coolant'];
    engine =
    json['engine'] != null ? Battery.fromJson(json['engine']) : null;
    engineComment = json['engineComment'];
    engineCompartment = json['engineCompartment'] != null
        ? Battery.fromJson(json['engineCompartment'])
        : null;
    engineOil = json['engineOil'] != null
        ? Battery.fromJson(json['engineOil'])
        : null;
    engineSound = json['engineSound'];
    exhaustSmoke = json['exhaustSmoke'];
    gearBox =
    json['gearBox'] != null ? Battery.fromJson(json['gearBox']) : null;
    gearBoxLeakage = json['gearBoxLeakage'];
    mount = json['mount'] != null ? Battery.fromJson(json['mount']) : null;
    radiator = json['radiator'];
    silencer = json['silencer'];
    startVideo = json['startVideo'] != null
        ? Battery.fromJson(json['startVideo'])
        : null;
    startingMotor = json['startingMotor'];
    sump = json['sump'] != null ? Battery.fromJson(json['sump']) : null;
    turboCharger = json['turboCharger'] != null
        ? Battery.fromJson(json['turboCharger'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['carId'] = carId;
    data['evaluationStatusForEngine'] = evaluationStatusForEngine;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (battery != null) {
      data['battery'] = battery!.toJson();
    }
    if (blowBy != null) {
      data['blowBy'] = blowBy!.toJson();
    }
    if (clutch != null) {
      data['clutch'] = clutch!.toJson();
    }
    data['coolant'] = coolant;
    if (engine != null) {
      data['engine'] = engine!.toJson();
    }
    data['engineComment'] = engineComment;
    if (engineCompartment != null) {
      data['engineCompartment'] = engineCompartment!.toJson();
    }
    if (engineOil != null) {
      data['engineOil'] = engineOil!.toJson();
    }
    data['engineSound'] = engineSound;
    data['exhaustSmoke'] = exhaustSmoke;
    if (gearBox != null) {
      data['gearBox'] = gearBox!.toJson();
    }
    data['gearBoxLeakage'] = gearBoxLeakage;
    if (mount != null) {
      data['mount'] = mount!.toJson();
    }
    data['radiator'] = radiator;
    data['silencer'] = silencer;
    if (startVideo != null) {
      data['startVideo'] = startVideo!.toJson();
    }
    data['startingMotor'] = startingMotor;
    if (sump != null) {
      data['sump'] = sump!.toJson();
    }
    if (turboCharger != null) {
      data['turboCharger'] = turboCharger!.toJson();
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
