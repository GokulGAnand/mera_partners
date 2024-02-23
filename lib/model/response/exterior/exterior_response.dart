class ExteriorResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  ExteriorResponse({this.status, this.message, this.data, this.meta});

  ExteriorResponse.fromJson(Map<String, dynamic> json) {
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
  ApronLeft? apronLeft;
  ApronLeft? apronRight;
  ApronLeft? bonnetPatti;
  ApronLeft? boot;
  ApronLeft? bumperFront;
  ApronLeft? bumperRear;
  ApronLeft? chassisExtension;
  ApronLeft? dickyDoor;
  ApronLeft? doorFrontLeft;
  ApronLeft? doorFrontRight;
  ApronLeft? doorGlassLeft;
  ApronLeft? doorGlassRight;
  ApronLeft? doorRearLeft;
  ApronLeft? doorRearRight;
  ApronLeft? fenderLeft;
  ApronLeft? fenderRight;
  ApronLeft? firewall;
  ApronLeft? fogLightLeft;
  ApronLeft? fogLightRight;
  ApronLeft? frontTyreLeft;
  ApronLeft? frontTyreRight;
  ApronLeft? frontWindShield;
  ApronLeft? fuelLid;
  String? fullBodyRepaint;
  ApronLeft? grill;
  ApronLeft? headLightLeft;
  ApronLeft? headLightRight;
  ApronLeft? headLightSupport;
  String? jackAndTool;
  ApronLeft? leftApillar;
  ApronLeft? leftBpillar;
  ApronLeft? leftCpillar;
  ApronLeft? leftImage;
  ApronLeft? lowerCrossMember;
  String? missingParts;
  ApronLeft? quarterGlass;
  ApronLeft? quarterPanelLeft;
  ApronLeft? quarterPanelRight;
  ApronLeft? rearTyreLeft;
  ApronLeft? rearTyreRight;
  ApronLeft? rearViewMirrorLeft;
  ApronLeft? rearViewMirrorRight;
  ApronLeft? rearWindShield;
  ApronLeft? rearWiper;
  ApronLeft? rightApillar;
  ApronLeft? rightBpillar;
  ApronLeft? rightCpillar;
  ApronLeft? rightImage;
  ApronLeft? roof;
  ApronLeft? runnningBorderLeft;
  ApronLeft? runnningBorderRight;
  ApronLeft? spareWheel;
  ApronLeft? tailLightLeft;
  ApronLeft? tailLightRight;
  ApronLeft? upperCrossMember;
  CowlTop? cowlTop;
  ApronLeft? front;
  ApronLeft? frontLeft;
  ApronLeft? frontRight;
  ApronLeft? rearLeft;
  ApronLeft? rearRight;
  ApronLeft? rear;
  ApronLeft? frontWithHoodOpen;
  ApronLeft? rearBootOpen;

  Data(
      {this.sId,
        this.carId,
        this.apronLeft,
        this.apronRight,
        this.bonnetPatti,
        this.boot,
        this.bumperFront,
        this.bumperRear,
        this.chassisExtension,
        this.dickyDoor,
        this.doorFrontLeft,
        this.doorFrontRight,
        this.doorGlassLeft,
        this.doorGlassRight,
        this.doorRearLeft,
        this.doorRearRight,
        this.fenderLeft,
        this.fenderRight,
        this.firewall,
        this.fogLightLeft,
        this.fogLightRight,
        this.frontTyreLeft,
        this.frontTyreRight,
        this.frontWindShield,
        this.fuelLid,
        this.fullBodyRepaint,
        this.grill,
        this.headLightLeft,
        this.headLightRight,
        this.headLightSupport,
        this.jackAndTool,
        this.leftApillar,
        this.leftBpillar,
        this.leftCpillar,
        this.leftImage,
        this.lowerCrossMember,
        this.missingParts,
        this.quarterGlass,
        this.quarterPanelLeft,
        this.quarterPanelRight,
        this.rearTyreLeft,
        this.rearTyreRight,
        this.rearViewMirrorLeft,
        this.rearViewMirrorRight,
        this.rearWindShield,
        this.rearWiper,
        this.rightApillar,
        this.rightBpillar,
        this.rightCpillar,
        this.rightImage,
        this.roof,
        this.runnningBorderLeft,
        this.runnningBorderRight,
        this.spareWheel,
        this.tailLightLeft,
        this.tailLightRight,
        this.upperCrossMember,
        this.cowlTop,
        this.front,
        this.frontLeft,
        this.frontRight,
        this.rearLeft,
        this.rearRight,
        this.rear,
        this.frontWithHoodOpen,
        this.rearBootOpen});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    apronLeft = json['apronLeft'] != null
        ? new ApronLeft.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? new ApronLeft.fromJson(json['apronRight'])
        : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? new ApronLeft.fromJson(json['bonnetPatti'])
        : null;
    boot = json['boot'] != null ? new ApronLeft.fromJson(json['boot']) : null;
    bumperFront = json['bumperFront'] != null
        ? new ApronLeft.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? new ApronLeft.fromJson(json['bumperRear'])
        : null;
    chassisExtension = json['chassisExtension'] != null
        ? new ApronLeft.fromJson(json['chassisExtension'])
        : null;
    dickyDoor = json['dickyDoor'] != null
        ? new ApronLeft.fromJson(json['dickyDoor'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? new ApronLeft.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? new ApronLeft.fromJson(json['doorFrontRight'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? new ApronLeft.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? new ApronLeft.fromJson(json['doorGlassRight'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? new ApronLeft.fromJson(json['doorRearLeft'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? new ApronLeft.fromJson(json['doorRearRight'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? new ApronLeft.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? new ApronLeft.fromJson(json['fenderRight'])
        : null;
    firewall = json['firewall'] != null
        ? new ApronLeft.fromJson(json['firewall'])
        : null;
    fogLightLeft = json['fogLightLeft'] != null
        ? new ApronLeft.fromJson(json['fogLightLeft'])
        : null;
    fogLightRight = json['fogLightRight'] != null
        ? new ApronLeft.fromJson(json['fogLightRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? new ApronLeft.fromJson(json['frontTyreLeft'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? new ApronLeft.fromJson(json['frontTyreRight'])
        : null;
    frontWindShield = json['frontWindShield'] != null
        ? new ApronLeft.fromJson(json['frontWindShield'])
        : null;
    fuelLid = json['fuelLid'] != null
        ? new ApronLeft.fromJson(json['fuelLid'])
        : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    grill =
    json['grill'] != null ? new ApronLeft.fromJson(json['grill']) : null;
    headLightLeft = json['headLightLeft'] != null
        ? new ApronLeft.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? new ApronLeft.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? new ApronLeft.fromJson(json['headLightSupport'])
        : null;
    jackAndTool = json['jackAndTool'];
    leftApillar = json['leftApillar'] != null
        ? new ApronLeft.fromJson(json['leftApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? new ApronLeft.fromJson(json['leftBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? new ApronLeft.fromJson(json['leftCpillar'])
        : null;
    leftImage = json['leftImage'] != null
        ? new ApronLeft.fromJson(json['leftImage'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? new ApronLeft.fromJson(json['lowerCrossMember'])
        : null;
    missingParts = json['missingParts'];
    quarterGlass = json['quarterGlass'] != null
        ? new ApronLeft.fromJson(json['quarterGlass'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? new ApronLeft.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? new ApronLeft.fromJson(json['quarterPanelRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? new ApronLeft.fromJson(json['rearTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? new ApronLeft.fromJson(json['rearTyreRight'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? new ApronLeft.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? new ApronLeft.fromJson(json['rearViewMirrorRight'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? new ApronLeft.fromJson(json['rearWindShield'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? new ApronLeft.fromJson(json['rearWiper'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? new ApronLeft.fromJson(json['rightApillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? new ApronLeft.fromJson(json['rightBpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? new ApronLeft.fromJson(json['rightCpillar'])
        : null;
    rightImage = json['rightImage'] != null
        ? new ApronLeft.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? new ApronLeft.fromJson(json['roof']) : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? new ApronLeft.fromJson(json['runnningBorderLeft'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? new ApronLeft.fromJson(json['runnningBorderRight'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? new ApronLeft.fromJson(json['spareWheel'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? new ApronLeft.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? new ApronLeft.fromJson(json['tailLightRight'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? new ApronLeft.fromJson(json['upperCrossMember'])
        : null;
    cowlTop =
    json['cowlTop'] != null ? new CowlTop.fromJson(json['cowlTop']) : null;
    front =
    json['front'] != null ? new ApronLeft.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? new ApronLeft.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? new ApronLeft.fromJson(json['frontRight'])
        : null;
    rearLeft = json['rearLeft'] != null
        ? new ApronLeft.fromJson(json['rearLeft'])
        : null;
    rearRight = json['rearRight'] != null
        ? new ApronLeft.fromJson(json['rearRight'])
        : null;
    rear = json['rear'] != null ? new ApronLeft.fromJson(json['rear']) : null;
    frontWithHoodOpen = json['frontWithHoodOpen'] != null
        ? new ApronLeft.fromJson(json['frontWithHoodOpen'])
        : null;
    rearBootOpen = json['rearBootOpen'] != null
        ? new ApronLeft.fromJson(json['rearBootOpen'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carId'] = this.carId;
    if (this.apronLeft != null) {
      data['apronLeft'] = this.apronLeft!.toJson();
    }
    if (this.apronRight != null) {
      data['apronRight'] = this.apronRight!.toJson();
    }
    if (this.bonnetPatti != null) {
      data['bonnetPatti'] = this.bonnetPatti!.toJson();
    }
    if (this.boot != null) {
      data['boot'] = this.boot!.toJson();
    }
    if (this.bumperFront != null) {
      data['bumperFront'] = this.bumperFront!.toJson();
    }
    if (this.bumperRear != null) {
      data['bumperRear'] = this.bumperRear!.toJson();
    }
    if (this.chassisExtension != null) {
      data['chassisExtension'] = this.chassisExtension!.toJson();
    }
    if (this.dickyDoor != null) {
      data['dickyDoor'] = this.dickyDoor!.toJson();
    }
    if (this.doorFrontLeft != null) {
      data['doorFrontLeft'] = this.doorFrontLeft!.toJson();
    }
    if (this.doorFrontRight != null) {
      data['doorFrontRight'] = this.doorFrontRight!.toJson();
    }
    if (this.doorGlassLeft != null) {
      data['doorGlassLeft'] = this.doorGlassLeft!.toJson();
    }
    if (this.doorGlassRight != null) {
      data['doorGlassRight'] = this.doorGlassRight!.toJson();
    }
    if (this.doorRearLeft != null) {
      data['doorRearLeft'] = this.doorRearLeft!.toJson();
    }
    if (this.doorRearRight != null) {
      data['doorRearRight'] = this.doorRearRight!.toJson();
    }
    if (this.fenderLeft != null) {
      data['fenderLeft'] = this.fenderLeft!.toJson();
    }
    if (this.fenderRight != null) {
      data['fenderRight'] = this.fenderRight!.toJson();
    }
    if (this.firewall != null) {
      data['firewall'] = this.firewall!.toJson();
    }
    if (this.fogLightLeft != null) {
      data['fogLightLeft'] = this.fogLightLeft!.toJson();
    }
    if (this.fogLightRight != null) {
      data['fogLightRight'] = this.fogLightRight!.toJson();
    }
    if (this.frontTyreLeft != null) {
      data['frontTyreLeft'] = this.frontTyreLeft!.toJson();
    }
    if (this.frontTyreRight != null) {
      data['frontTyreRight'] = this.frontTyreRight!.toJson();
    }
    if (this.frontWindShield != null) {
      data['frontWindShield'] = this.frontWindShield!.toJson();
    }
    if (this.fuelLid != null) {
      data['fuelLid'] = this.fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = this.fullBodyRepaint;
    if (this.grill != null) {
      data['grill'] = this.grill!.toJson();
    }
    if (this.headLightLeft != null) {
      data['headLightLeft'] = this.headLightLeft!.toJson();
    }
    if (this.headLightRight != null) {
      data['headLightRight'] = this.headLightRight!.toJson();
    }
    if (this.headLightSupport != null) {
      data['headLightSupport'] = this.headLightSupport!.toJson();
    }
    data['jackAndTool'] = this.jackAndTool;
    if (this.leftApillar != null) {
      data['leftApillar'] = this.leftApillar!.toJson();
    }
    if (this.leftBpillar != null) {
      data['leftBpillar'] = this.leftBpillar!.toJson();
    }
    if (this.leftCpillar != null) {
      data['leftCpillar'] = this.leftCpillar!.toJson();
    }
    if (this.leftImage != null) {
      data['leftImage'] = this.leftImage!.toJson();
    }
    if (this.lowerCrossMember != null) {
      data['lowerCrossMember'] = this.lowerCrossMember!.toJson();
    }
    data['missingParts'] = this.missingParts;
    if (this.quarterGlass != null) {
      data['quarterGlass'] = this.quarterGlass!.toJson();
    }
    if (this.quarterPanelLeft != null) {
      data['quarterPanelLeft'] = this.quarterPanelLeft!.toJson();
    }
    if (this.quarterPanelRight != null) {
      data['quarterPanelRight'] = this.quarterPanelRight!.toJson();
    }
    if (this.rearTyreLeft != null) {
      data['rearTyreLeft'] = this.rearTyreLeft!.toJson();
    }
    if (this.rearTyreRight != null) {
      data['rearTyreRight'] = this.rearTyreRight!.toJson();
    }
    if (this.rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = this.rearViewMirrorLeft!.toJson();
    }
    if (this.rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = this.rearViewMirrorRight!.toJson();
    }
    if (this.rearWindShield != null) {
      data['rearWindShield'] = this.rearWindShield!.toJson();
    }
    if (this.rearWiper != null) {
      data['rearWiper'] = this.rearWiper!.toJson();
    }
    if (this.rightApillar != null) {
      data['rightApillar'] = this.rightApillar!.toJson();
    }
    if (this.rightBpillar != null) {
      data['rightBpillar'] = this.rightBpillar!.toJson();
    }
    if (this.rightCpillar != null) {
      data['rightCpillar'] = this.rightCpillar!.toJson();
    }
    if (this.rightImage != null) {
      data['rightImage'] = this.rightImage!.toJson();
    }
    if (this.roof != null) {
      data['roof'] = this.roof!.toJson();
    }
    if (this.runnningBorderLeft != null) {
      data['runnningBorderLeft'] = this.runnningBorderLeft!.toJson();
    }
    if (this.runnningBorderRight != null) {
      data['runnningBorderRight'] = this.runnningBorderRight!.toJson();
    }
    if (this.spareWheel != null) {
      data['spareWheel'] = this.spareWheel!.toJson();
    }
    if (this.tailLightLeft != null) {
      data['tailLightLeft'] = this.tailLightLeft!.toJson();
    }
    if (this.tailLightRight != null) {
      data['tailLightRight'] = this.tailLightRight!.toJson();
    }
    if (this.upperCrossMember != null) {
      data['upperCrossMember'] = this.upperCrossMember!.toJson();
    }
    if (this.cowlTop != null) {
      data['cowlTop'] = this.cowlTop!.toJson();
    }
    if (this.front != null) {
      data['front'] = this.front!.toJson();
    }
    if (this.frontLeft != null) {
      data['frontLeft'] = this.frontLeft!.toJson();
    }
    if (this.frontRight != null) {
      data['frontRight'] = this.frontRight!.toJson();
    }
    if (this.rearLeft != null) {
      data['rearLeft'] = this.rearLeft!.toJson();
    }
    if (this.rearRight != null) {
      data['rearRight'] = this.rearRight!.toJson();
    }
    if (this.rear != null) {
      data['rear'] = this.rear!.toJson();
    }
    if (this.frontWithHoodOpen != null) {
      data['frontWithHoodOpen'] = this.frontWithHoodOpen!.toJson();
    }
    if (this.rearBootOpen != null) {
      data['rearBootOpen'] = this.rearBootOpen!.toJson();
    }
    return data;
  }
}

class ApronLeft {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  ApronLeft({this.name, this.url, this.condition, this.remarks});

  ApronLeft.fromJson(Map<String, dynamic> json) {
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

class CowlTop {
  String? name;
  String? url;
  List<String>? condition;
  String? remarks;

  CowlTop({this.name, this.url, this.condition, this.remarks});

  CowlTop.fromJson(Map<String, dynamic> json) {
    condition = json['condition'].cast<String>();
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
