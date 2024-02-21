class testdrivelist {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  testdrivelist({this.status, this.message, this.data, this.meta});

  testdrivelist.fromJson(Map<String, dynamic> json) {
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
  String? brakes;
  String? clutchSystem;
  String? cruiseControl;
  String? seatAdjustment;
  String? shocker;
  String? steeringAdjustment;
  String? steeringMountedAudioControl;
  String? steeringSystem;
  String? steeringWheel;
  String? suspension;
  String? transmissionAutomatic;
  String? transmissionManual;
  String? vehicleHorn;

  Data(
      {this.sId,
        this.carId,
        this.brakes,
        this.clutchSystem,
        this.cruiseControl,
        this.seatAdjustment,
        this.shocker,
        this.steeringAdjustment,
        this.steeringMountedAudioControl,
        this.steeringSystem,
        this.steeringWheel,
        this.suspension,
        this.transmissionAutomatic,
        this.transmissionManual,
        this.vehicleHorn});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    brakes = json['brakes'];
    clutchSystem = json['clutchSystem'];
    cruiseControl = json['cruiseControl'];
    seatAdjustment = json['seatAdjustment'];
    shocker = json['shocker'];
    steeringAdjustment = json['steeringAdjustment'];
    steeringMountedAudioControl = json['steeringMountedAudioControl'];
    steeringSystem = json['steeringSystem'];
    steeringWheel = json['steeringWheel'];
    suspension = json['suspension'];
    transmissionAutomatic = json['transmissionAutomatic'];
    transmissionManual = json['transmissionManual'];
    vehicleHorn = json['vehicleHorn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['brakes'] = this.brakes;
    data['clutchSystem'] = this.clutchSystem;
    data['cruiseControl'] = this.cruiseControl;
    data['seatAdjustment'] = this.seatAdjustment;
    data['shocker'] = this.shocker;
    data['steeringAdjustment'] = this.steeringAdjustment;
    data['steeringMountedAudioControl'] = this.steeringMountedAudioControl;
    data['steeringSystem'] = this.steeringSystem;
    data['steeringWheel'] = this.steeringWheel;
    data['suspension'] = this.suspension;
    data['transmissionAutomatic'] = this.transmissionAutomatic;
    data['transmissionManual'] = this.transmissionManual;
    data['vehicleHorn'] = this.vehicleHorn;
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