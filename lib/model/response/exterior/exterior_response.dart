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
        ? ApronLeft.fromJson(json['apronLeft'])
        : null;
    apronRight = json['apronRight'] != null
        ? ApronLeft.fromJson(json['apronRight'])
        : null;
    bonnetPatti = json['bonnetPatti'] != null
        ? ApronLeft.fromJson(json['bonnetPatti'])
        : null;
    boot = json['boot'] != null ? ApronLeft.fromJson(json['boot']) : null;
    bumperFront = json['bumperFront'] != null
        ? ApronLeft.fromJson(json['bumperFront'])
        : null;
    bumperRear = json['bumperRear'] != null
        ? ApronLeft.fromJson(json['bumperRear'])
        : null;
    chassisExtension = json['chassisExtension'] != null
        ? ApronLeft.fromJson(json['chassisExtension'])
        : null;
    dickyDoor = json['dickyDoor'] != null
        ? ApronLeft.fromJson(json['dickyDoor'])
        : null;
    doorFrontLeft = json['doorFrontLeft'] != null
        ? ApronLeft.fromJson(json['doorFrontLeft'])
        : null;
    doorFrontRight = json['doorFrontRight'] != null
        ? ApronLeft.fromJson(json['doorFrontRight'])
        : null;
    doorGlassLeft = json['doorGlassLeft'] != null
        ? ApronLeft.fromJson(json['doorGlassLeft'])
        : null;
    doorGlassRight = json['doorGlassRight'] != null
        ? ApronLeft.fromJson(json['doorGlassRight'])
        : null;
    doorRearLeft = json['doorRearLeft'] != null
        ? ApronLeft.fromJson(json['doorRearLeft'])
        : null;
    doorRearRight = json['doorRearRight'] != null
        ? ApronLeft.fromJson(json['doorRearRight'])
        : null;
    fenderLeft = json['fenderLeft'] != null
        ? ApronLeft.fromJson(json['fenderLeft'])
        : null;
    fenderRight = json['fenderRight'] != null
        ? ApronLeft.fromJson(json['fenderRight'])
        : null;
    firewall = json['firewall'] != null
        ? ApronLeft.fromJson(json['firewall'])
        : null;
    fogLightLeft = json['fogLightLeft'] != null
        ? ApronLeft.fromJson(json['fogLightLeft'])
        : null;
    fogLightRight = json['fogLightRight'] != null
        ? ApronLeft.fromJson(json['fogLightRight'])
        : null;
    frontTyreLeft = json['frontTyreLeft'] != null
        ? ApronLeft.fromJson(json['frontTyreLeft'])
        : null;
    frontTyreRight = json['frontTyreRight'] != null
        ? ApronLeft.fromJson(json['frontTyreRight'])
        : null;
    frontWindShield = json['frontWindShield'] != null
        ? ApronLeft.fromJson(json['frontWindShield'])
        : null;
    fuelLid = json['fuelLid'] != null
        ? ApronLeft.fromJson(json['fuelLid'])
        : null;
    fullBodyRepaint = json['fullBodyRepaint'];
    grill =
    json['grill'] != null ? ApronLeft.fromJson(json['grill']) : null;
    headLightLeft = json['headLightLeft'] != null
        ? ApronLeft.fromJson(json['headLightLeft'])
        : null;
    headLightRight = json['headLightRight'] != null
        ? ApronLeft.fromJson(json['headLightRight'])
        : null;
    headLightSupport = json['headLightSupport'] != null
        ? ApronLeft.fromJson(json['headLightSupport'])
        : null;
    jackAndTool = json['jackAndTool'];
    leftApillar = json['leftApillar'] != null
        ? ApronLeft.fromJson(json['leftApillar'])
        : null;
    leftBpillar = json['leftBpillar'] != null
        ? ApronLeft.fromJson(json['leftBpillar'])
        : null;
    leftCpillar = json['leftCpillar'] != null
        ? ApronLeft.fromJson(json['leftCpillar'])
        : null;
    leftImage = json['leftImage'] != null
        ? ApronLeft.fromJson(json['leftImage'])
        : null;
    lowerCrossMember = json['lowerCrossMember'] != null
        ? ApronLeft.fromJson(json['lowerCrossMember'])
        : null;
    missingParts = json['missingParts'];
    quarterGlass = json['quarterGlass'] != null
        ? ApronLeft.fromJson(json['quarterGlass'])
        : null;
    quarterPanelLeft = json['quarterPanelLeft'] != null
        ? ApronLeft.fromJson(json['quarterPanelLeft'])
        : null;
    quarterPanelRight = json['quarterPanelRight'] != null
        ? ApronLeft.fromJson(json['quarterPanelRight'])
        : null;
    rearTyreLeft = json['rearTyreLeft'] != null
        ? ApronLeft.fromJson(json['rearTyreLeft'])
        : null;
    rearTyreRight = json['rearTyreRight'] != null
        ? ApronLeft.fromJson(json['rearTyreRight'])
        : null;
    rearViewMirrorLeft = json['rearViewMirrorLeft'] != null
        ? ApronLeft.fromJson(json['rearViewMirrorLeft'])
        : null;
    rearViewMirrorRight = json['rearViewMirrorRight'] != null
        ? ApronLeft.fromJson(json['rearViewMirrorRight'])
        : null;
    rearWindShield = json['rearWindShield'] != null
        ? ApronLeft.fromJson(json['rearWindShield'])
        : null;
    rearWiper = json['rearWiper'] != null
        ? ApronLeft.fromJson(json['rearWiper'])
        : null;
    rightApillar = json['rightApillar'] != null
        ? ApronLeft.fromJson(json['rightApillar'])
        : null;
    rightBpillar = json['rightBpillar'] != null
        ? ApronLeft.fromJson(json['rightBpillar'])
        : null;
    rightCpillar = json['rightCpillar'] != null
        ? ApronLeft.fromJson(json['rightCpillar'])
        : null;
    rightImage = json['rightImage'] != null
        ? ApronLeft.fromJson(json['rightImage'])
        : null;
    roof = json['roof'] != null ? ApronLeft.fromJson(json['roof']) : null;
    runnningBorderLeft = json['runnningBorderLeft'] != null
        ? ApronLeft.fromJson(json['runnningBorderLeft'])
        : null;
    runnningBorderRight = json['runnningBorderRight'] != null
        ? ApronLeft.fromJson(json['runnningBorderRight'])
        : null;
    spareWheel = json['spareWheel'] != null
        ? ApronLeft.fromJson(json['spareWheel'])
        : null;
    tailLightLeft = json['tailLightLeft'] != null
        ? ApronLeft.fromJson(json['tailLightLeft'])
        : null;
    tailLightRight = json['tailLightRight'] != null
        ? ApronLeft.fromJson(json['tailLightRight'])
        : null;
    upperCrossMember = json['upperCrossMember'] != null
        ? ApronLeft.fromJson(json['upperCrossMember'])
        : null;
    cowlTop =
    json['cowlTop'] != null ? CowlTop.fromJson(json['cowlTop']) : null;
    front =
    json['front'] != null ? ApronLeft.fromJson(json['front']) : null;
    frontLeft = json['frontLeft'] != null
        ? ApronLeft.fromJson(json['frontLeft'])
        : null;
    frontRight = json['frontRight'] != null
        ? ApronLeft.fromJson(json['frontRight'])
        : null;
    rearLeft = json['rearLeft'] != null
        ? ApronLeft.fromJson(json['rearLeft'])
        : null;
    rearRight = json['rearRight'] != null
        ? ApronLeft.fromJson(json['rearRight'])
        : null;
    rear = json['rear'] != null ? ApronLeft.fromJson(json['rear']) : null;
    frontWithHoodOpen = json['frontWithHoodOpen'] != null
        ? ApronLeft.fromJson(json['frontWithHoodOpen'])
        : null;
    rearBootOpen = json['rearBootOpen'] != null
        ? ApronLeft.fromJson(json['rearBootOpen'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['carId'] = carId;
    if (apronLeft != null) {
      data['apronLeft'] = apronLeft!.toJson();
    }
    if (apronRight != null) {
      data['apronRight'] = apronRight!.toJson();
    }
    if (bonnetPatti != null) {
      data['bonnetPatti'] = bonnetPatti!.toJson();
    }
    if (boot != null) {
      data['boot'] = boot!.toJson();
    }
    if (bumperFront != null) {
      data['bumperFront'] = bumperFront!.toJson();
    }
    if (bumperRear != null) {
      data['bumperRear'] = bumperRear!.toJson();
    }
    if (chassisExtension != null) {
      data['chassisExtension'] = chassisExtension!.toJson();
    }
    if (dickyDoor != null) {
      data['dickyDoor'] = dickyDoor!.toJson();
    }
    if (doorFrontLeft != null) {
      data['doorFrontLeft'] = doorFrontLeft!.toJson();
    }
    if (doorFrontRight != null) {
      data['doorFrontRight'] = doorFrontRight!.toJson();
    }
    if (doorGlassLeft != null) {
      data['doorGlassLeft'] = doorGlassLeft!.toJson();
    }
    if (doorGlassRight != null) {
      data['doorGlassRight'] = doorGlassRight!.toJson();
    }
    if (doorRearLeft != null) {
      data['doorRearLeft'] = doorRearLeft!.toJson();
    }
    if (doorRearRight != null) {
      data['doorRearRight'] = doorRearRight!.toJson();
    }
    if (fenderLeft != null) {
      data['fenderLeft'] = fenderLeft!.toJson();
    }
    if (fenderRight != null) {
      data['fenderRight'] = fenderRight!.toJson();
    }
    if (firewall != null) {
      data['firewall'] = firewall!.toJson();
    }
    if (fogLightLeft != null) {
      data['fogLightLeft'] = fogLightLeft!.toJson();
    }
    if (fogLightRight != null) {
      data['fogLightRight'] = fogLightRight!.toJson();
    }
    if (frontTyreLeft != null) {
      data['frontTyreLeft'] = frontTyreLeft!.toJson();
    }
    if (frontTyreRight != null) {
      data['frontTyreRight'] = frontTyreRight!.toJson();
    }
    if (frontWindShield != null) {
      data['frontWindShield'] = frontWindShield!.toJson();
    }
    if (fuelLid != null) {
      data['fuelLid'] = fuelLid!.toJson();
    }
    data['fullBodyRepaint'] = fullBodyRepaint;
    if (grill != null) {
      data['grill'] = grill!.toJson();
    }
    if (headLightLeft != null) {
      data['headLightLeft'] = headLightLeft!.toJson();
    }
    if (headLightRight != null) {
      data['headLightRight'] = headLightRight!.toJson();
    }
    if (headLightSupport != null) {
      data['headLightSupport'] = headLightSupport!.toJson();
    }
    data['jackAndTool'] = jackAndTool;
    if (leftApillar != null) {
      data['leftApillar'] = leftApillar!.toJson();
    }
    if (leftBpillar != null) {
      data['leftBpillar'] = leftBpillar!.toJson();
    }
    if (leftCpillar != null) {
      data['leftCpillar'] = leftCpillar!.toJson();
    }
    if (leftImage != null) {
      data['leftImage'] = leftImage!.toJson();
    }
    if (lowerCrossMember != null) {
      data['lowerCrossMember'] = lowerCrossMember!.toJson();
    }
    data['missingParts'] = missingParts;
    if (quarterGlass != null) {
      data['quarterGlass'] = quarterGlass!.toJson();
    }
    if (quarterPanelLeft != null) {
      data['quarterPanelLeft'] = quarterPanelLeft!.toJson();
    }
    if (quarterPanelRight != null) {
      data['quarterPanelRight'] = quarterPanelRight!.toJson();
    }
    if (rearTyreLeft != null) {
      data['rearTyreLeft'] = rearTyreLeft!.toJson();
    }
    if (rearTyreRight != null) {
      data['rearTyreRight'] = rearTyreRight!.toJson();
    }
    if (rearViewMirrorLeft != null) {
      data['rearViewMirrorLeft'] = rearViewMirrorLeft!.toJson();
    }
    if (rearViewMirrorRight != null) {
      data['rearViewMirrorRight'] = rearViewMirrorRight!.toJson();
    }
    if (rearWindShield != null) {
      data['rearWindShield'] = rearWindShield!.toJson();
    }
    if (rearWiper != null) {
      data['rearWiper'] = rearWiper!.toJson();
    }
    if (rightApillar != null) {
      data['rightApillar'] = rightApillar!.toJson();
    }
    if (rightBpillar != null) {
      data['rightBpillar'] = rightBpillar!.toJson();
    }
    if (rightCpillar != null) {
      data['rightCpillar'] = rightCpillar!.toJson();
    }
    if (rightImage != null) {
      data['rightImage'] = rightImage!.toJson();
    }
    if (roof != null) {
      data['roof'] = roof!.toJson();
    }
    if (runnningBorderLeft != null) {
      data['runnningBorderLeft'] = runnningBorderLeft!.toJson();
    }
    if (runnningBorderRight != null) {
      data['runnningBorderRight'] = runnningBorderRight!.toJson();
    }
    if (spareWheel != null) {
      data['spareWheel'] = spareWheel!.toJson();
    }
    if (tailLightLeft != null) {
      data['tailLightLeft'] = tailLightLeft!.toJson();
    }
    if (tailLightRight != null) {
      data['tailLightRight'] = tailLightRight!.toJson();
    }
    if (upperCrossMember != null) {
      data['upperCrossMember'] = upperCrossMember!.toJson();
    }
    if (cowlTop != null) {
      data['cowlTop'] = cowlTop!.toJson();
    }
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (frontLeft != null) {
      data['frontLeft'] = frontLeft!.toJson();
    }
    if (frontRight != null) {
      data['frontRight'] = frontRight!.toJson();
    }
    if (rearLeft != null) {
      data['rearLeft'] = rearLeft!.toJson();
    }
    if (rearRight != null) {
      data['rearRight'] = rearRight!.toJson();
    }
    if (rear != null) {
      data['rear'] = rear!.toJson();
    }
    if (frontWithHoodOpen != null) {
      data['frontWithHoodOpen'] = frontWithHoodOpen!.toJson();
    }
    if (rearBootOpen != null) {
      data['rearBootOpen'] = rearBootOpen!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['condition'] = condition;
    data['remarks'] = remarks;
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
