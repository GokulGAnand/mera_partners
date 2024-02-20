class airconditininglist {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  airconditininglist({this.status, this.message, this.data, this.meta});

  airconditininglist.fromJson(Map<String, dynamic> json) {
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
  String? rearDefogger;
  String? acBlowerGrill;
  String? acCompressor;
  String? acCondensor;
  String? acFilterDamaged;
  String? acWorking;
  String? airCooling;
  String? climateControl;
  String? heater;

  Data(
      {this.sId,
        this.carId,
        this.rearDefogger,
        this.acBlowerGrill,
        this.acCompressor,
        this.acCondensor,
        this.acFilterDamaged,
        this.acWorking,
        this.airCooling,
        this.climateControl,
        this.heater});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    rearDefogger = json['rearDefogger'];
    acBlowerGrill = json['acBlowerGrill'];
    acCompressor = json['acCompressor'];
    acCondensor = json['acCondensor'];
    acFilterDamaged = json['acFilterDamaged'];
    acWorking = json['acWorking'];
    airCooling = json['airCooling'];
    climateControl = json['climateControl'];
    heater = json['heater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['rearDefogger'] = this.rearDefogger;
    data['acBlowerGrill'] = this.acBlowerGrill;
    data['acCompressor'] = this.acCompressor;
    data['acCondensor'] = this.acCondensor;
    data['acFilterDamaged'] = this.acFilterDamaged;
    data['acWorking'] = this.acWorking;
    data['airCooling'] = this.airCooling;
    data['climateControl'] = this.climateControl;
    data['heater'] = this.heater;
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