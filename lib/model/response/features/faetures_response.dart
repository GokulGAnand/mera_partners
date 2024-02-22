class featuresList {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  featuresList({this.status, this.message, this.data, this.meta});

  featuresList.fromJson(Map<String, dynamic> json) {
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
  List<String>? absEbd;
  List<String>? airbag;
  List<String>? alloyWheels;
  String? anyInteriorModifications;
  String? fogLamps;
  List<String>? gloveBox;
  String? gpsNavigation;
  List<String>? keylessEntry;
  String? rearDefogger;
  String? rearParkingSensor;
  String? remoteCentalLock;
  String? seatBelt;
  String? stereoBrand;
  List<String>? sunroof;
  String? toolKit;
  StereoImage? stereoImage;

  Data(
      {this.sId,
        this.carId,
        this.absEbd,
        this.airbag,
        this.alloyWheels,
        this.anyInteriorModifications,
        this.fogLamps,
        this.gloveBox,
        this.gpsNavigation,
        this.keylessEntry,
        this.rearDefogger,
        this.rearParkingSensor,
        this.remoteCentalLock,
        this.seatBelt,
        this.stereoBrand,
        this.sunroof,
        this.toolKit,
        this.stereoImage});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    absEbd = json['absEbd'].cast<String>();
    airbag = json['airbag'].cast<String>();
    alloyWheels = json['alloyWheels'].cast<String>();
    anyInteriorModifications = json['anyInteriorModifications'];
    fogLamps = json['fogLamps'];
    gloveBox = json['gloveBox'].cast<String>();
    gpsNavigation = json['gpsNavigation'];
    keylessEntry = json['keylessEntry'].cast<String>();
    rearDefogger = json['rearDefogger'];
    rearParkingSensor = json['rearParkingSensor'];
    remoteCentalLock = json['remoteCentalLock'];
    seatBelt = json['seatBelt'];
    stereoBrand = json['stereoBrand'];
    sunroof = json['sunroof'].cast<String>();
    toolKit = json['toolKit'];
    stereoImage = json['stereoImage'] != null
        ? new StereoImage.fromJson(json['stereoImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    data['absEbd'] = this.absEbd;
    data['airbag'] = this.airbag;
    data['alloyWheels'] = this.alloyWheels;
    data['anyInteriorModifications'] = this.anyInteriorModifications;
    data['fogLamps'] = this.fogLamps;
    data['gloveBox'] = this.gloveBox;
    data['gpsNavigation'] = this.gpsNavigation;
    data['keylessEntry'] = this.keylessEntry;
    data['rearDefogger'] = this.rearDefogger;
    data['rearParkingSensor'] = this.rearParkingSensor;
    data['remoteCentalLock'] = this.remoteCentalLock;
    data['seatBelt'] = this.seatBelt;
    data['stereoBrand'] = this.stereoBrand;
    data['sunroof'] = this.sunroof;
    data['toolKit'] = this.toolKit;
    if (this.stereoImage != null) {
      data['stereoImage'] = this.stereoImage!.toJson();
    }
    return data;
  }
}

class StereoImage {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  StereoImage({this.name, this.url, this.condition, this.remarks});

  StereoImage.fromJson(Map<String, dynamic> json) {
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