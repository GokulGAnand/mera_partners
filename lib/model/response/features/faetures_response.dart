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
        ? StereoImage.fromJson(json['stereoImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['carId'] = carId;
    data['absEbd'] = absEbd;
    data['airbag'] = airbag;
    data['alloyWheels'] = alloyWheels;
    data['anyInteriorModifications'] = anyInteriorModifications;
    data['fogLamps'] = fogLamps;
    data['gloveBox'] = gloveBox;
    data['gpsNavigation'] = gpsNavigation;
    data['keylessEntry'] = keylessEntry;
    data['rearDefogger'] = rearDefogger;
    data['rearParkingSensor'] = rearParkingSensor;
    data['remoteCentalLock'] = remoteCentalLock;
    data['seatBelt'] = seatBelt;
    data['stereoBrand'] = stereoBrand;
    data['sunroof'] = sunroof;
    data['toolKit'] = toolKit;
    if (stereoImage != null) {
      data['stereoImage'] = stereoImage!.toJson();
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