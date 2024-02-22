class ExteriorResponse {
  ExteriorResponse({
     this.status,
     this.message,
     this.data,
     this.meta,
  });

  final String? status;
  final String? message;
  final List<List<Datum>>? data;
  final Meta? meta;

  factory ExteriorResponse.fromJson(Map<String, dynamic> json){
    return ExteriorResponse(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      data: json["data"] == null ? [] : List<List<Datum>>.from(json["data"]!.map((x) => x == null ? [] : List<Datum>.from(x!.map((x) => Datum.fromJson(x))))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.map((x) => x.map((x) => x?.toJson()).toList()).toList(),
    "meta": meta?.toJson(),
  };

}

class Datum {
  Datum({
    required this.id,
    required this.carId,
    required this.apronLeft,
    required this.apronRight,
    required this.bonnetPatti,
    required this.boot,
    required this.bumperFront,
    required this.bumperRear,
    required this.chassisExtension,
    required this.dickyDoor,
    required this.doorFrontLeft,
    required this.doorFrontRight,
    required this.doorGlassLeft,
    required this.doorGlassRight,
    required this.doorRearLeft,
    required this.doorRearRight,
    required this.fenderLeft,
    required this.fenderRight,
    required this.firewall,
    required this.fogLightLeft,
    required this.fogLightRight,
    required this.frontTyreLeft,
    required this.frontTyreRight,
    required this.frontWindShield,
    required this.fuelLid,
    required this.fullBodyRepaint,
    required this.grill,
    required this.headLightLeft,
    required this.headLightRight,
    required this.headLightSupport,
    required this.jackAndTool,
    required this.leftApillar,
    required this.leftBpillar,
    required this.leftCpillar,
    required this.leftImage,
    required this.lowerCrossMember,
    required this.missingParts,
    required this.quarterGlass,
    required this.quarterPanelLeft,
    required this.quarterPanelRight,
    required this.rearTyreLeft,
    required this.rearTyreRight,
    required this.rearViewMirrorLeft,
    required this.rearViewMirrorRight,
    required this.rearWindShield,
    required this.rearWiper,
    required this.rightApillar,
    required this.rightBpillar,
    required this.rightCpillar,
    required this.rightImage,
    required this.roof,
    required this.runnningBorderLeft,
    required this.runnningBorderRight,
    required this.spareWheel,
    required this.tailLightLeft,
    required this.tailLightRight,
    required this.upperCrossMember,
    required this.cowlTop,
    required this.front,
    required this.frontLeft,
    required this.frontRight,
    required this.rearLeft,
    required this.rearRight,
    required this.rear,
    required this.frontWithHoodOpen,
    required this.rearBootOpen,
  });

  final String id;
  final String carId;
  final ApronLeft? apronLeft;
  final ApronLeft? apronRight;
  final ApronLeft? bonnetPatti;
  final ApronLeft? boot;
  final ApronLeft? bumperFront;
  final ApronLeft? bumperRear;
  final ApronLeft? chassisExtension;
  final ApronLeft? dickyDoor;
  final ApronLeft? doorFrontLeft;
  final ApronLeft? doorFrontRight;
  final ApronLeft? doorGlassLeft;
  final ApronLeft? doorGlassRight;
  final ApronLeft? doorRearLeft;
  final ApronLeft? doorRearRight;
  final ApronLeft? fenderLeft;
  final ApronLeft? fenderRight;
  final ApronLeft? firewall;
  final ApronLeft? fogLightLeft;
  final ApronLeft? fogLightRight;
  final ApronLeft? frontTyreLeft;
  final ApronLeft? frontTyreRight;
  final ApronLeft? frontWindShield;
  final ApronLeft? fuelLid;
  final String fullBodyRepaint;
  final ApronLeft? grill;
  final ApronLeft? headLightLeft;
  final ApronLeft? headLightRight;
  final ApronLeft? headLightSupport;
  final String jackAndTool;
  final ApronLeft? leftApillar;
  final ApronLeft? leftBpillar;
  final ApronLeft? leftCpillar;
  final Front? leftImage;
  final ApronLeft? lowerCrossMember;
  final String missingParts;
  final ApronLeft? quarterGlass;
  final ApronLeft? quarterPanelLeft;
  final ApronLeft? quarterPanelRight;
  final ApronLeft? rearTyreLeft;
  final ApronLeft? rearTyreRight;
  final ApronLeft? rearViewMirrorLeft;
  final ApronLeft? rearViewMirrorRight;
  final ApronLeft? rearWindShield;
  final ApronLeft? rearWiper;
  final ApronLeft? rightApillar;
  final ApronLeft? rightBpillar;
  final ApronLeft? rightCpillar;
  final Front? rightImage;
  final ApronLeft? roof;
  final ApronLeft? runnningBorderLeft;
  final ApronLeft? runnningBorderRight;
  final ApronLeft? spareWheel;
  final ApronLeft? tailLightLeft;
  final ApronLeft? tailLightRight;
  final ApronLeft? upperCrossMember;
  final ApronLeft? cowlTop;
  final Front? front;
  final Front? frontLeft;
  final Front? frontRight;
  final Front? rearLeft;
  final Front? rearRight;
  final Front? rear;
  final Front? frontWithHoodOpen;
  final Front? rearBootOpen;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["_id"] ?? "",
      carId: json["carId"] ?? "",
      apronLeft: json["apronLeft"] == null ? null : ApronLeft.fromJson(json["apronLeft"]),
      apronRight: json["apronRight"] == null ? null : ApronLeft.fromJson(json["apronRight"]),
      bonnetPatti: json["bonnetPatti"] == null ? null : ApronLeft.fromJson(json["bonnetPatti"]),
      boot: json["boot"] == null ? null : ApronLeft.fromJson(json["boot"]),
      bumperFront: json["bumperFront"] == null ? null : ApronLeft.fromJson(json["bumperFront"]),
      bumperRear: json["bumperRear"] == null ? null : ApronLeft.fromJson(json["bumperRear"]),
      chassisExtension: json["chassisExtension"] == null ? null : ApronLeft.fromJson(json["chassisExtension"]),
      dickyDoor: json["dickyDoor"] == null ? null : ApronLeft.fromJson(json["dickyDoor"]),
      doorFrontLeft: json["doorFrontLeft"] == null ? null : ApronLeft.fromJson(json["doorFrontLeft"]),
      doorFrontRight: json["doorFrontRight"] == null ? null : ApronLeft.fromJson(json["doorFrontRight"]),
      doorGlassLeft: json["doorGlassLeft"] == null ? null : ApronLeft.fromJson(json["doorGlassLeft"]),
      doorGlassRight: json["doorGlassRight"] == null ? null : ApronLeft.fromJson(json["doorGlassRight"]),
      doorRearLeft: json["doorRearLeft"] == null ? null : ApronLeft.fromJson(json["doorRearLeft"]),
      doorRearRight: json["doorRearRight"] == null ? null : ApronLeft.fromJson(json["doorRearRight"]),
      fenderLeft: json["fenderLeft"] == null ? null : ApronLeft.fromJson(json["fenderLeft"]),
      fenderRight: json["fenderRight"] == null ? null : ApronLeft.fromJson(json["fenderRight"]),
      firewall: json["firewall"] == null ? null : ApronLeft.fromJson(json["firewall"]),
      fogLightLeft: json["fogLightLeft"] == null ? null : ApronLeft.fromJson(json["fogLightLeft"]),
      fogLightRight: json["fogLightRight"] == null ? null : ApronLeft.fromJson(json["fogLightRight"]),
      frontTyreLeft: json["frontTyreLeft"] == null ? null : ApronLeft.fromJson(json["frontTyreLeft"]),
      frontTyreRight: json["frontTyreRight"] == null ? null : ApronLeft.fromJson(json["frontTyreRight"]),
      frontWindShield: json["frontWindShield"] == null ? null : ApronLeft.fromJson(json["frontWindShield"]),
      fuelLid: json["fuelLid"] == null ? null : ApronLeft.fromJson(json["fuelLid"]),
      fullBodyRepaint: json["fullBodyRepaint"] ?? "",
      grill: json["grill"] == null ? null : ApronLeft.fromJson(json["grill"]),
      headLightLeft: json["headLightLeft"] == null ? null : ApronLeft.fromJson(json["headLightLeft"]),
      headLightRight: json["headLightRight"] == null ? null : ApronLeft.fromJson(json["headLightRight"]),
      headLightSupport: json["headLightSupport"] == null ? null : ApronLeft.fromJson(json["headLightSupport"]),
      jackAndTool: json["jackAndTool"] ?? "",
      leftApillar: json["leftApillar"] == null ? null : ApronLeft.fromJson(json["leftApillar"]),
      leftBpillar: json["leftBpillar"] == null ? null : ApronLeft.fromJson(json["leftBpillar"]),
      leftCpillar: json["leftCpillar"] == null ? null : ApronLeft.fromJson(json["leftCpillar"]),
      leftImage: json["leftImage"] == null ? null : Front.fromJson(json["leftImage"]),
      lowerCrossMember: json["lowerCrossMember"] == null ? null : ApronLeft.fromJson(json["lowerCrossMember"]),
      missingParts: json["missingParts"] ?? "",
      quarterGlass: json["quarterGlass"] == null ? null : ApronLeft.fromJson(json["quarterGlass"]),
      quarterPanelLeft: json["quarterPanelLeft"] == null ? null : ApronLeft.fromJson(json["quarterPanelLeft"]),
      quarterPanelRight: json["quarterPanelRight"] == null ? null : ApronLeft.fromJson(json["quarterPanelRight"]),
      rearTyreLeft: json["rearTyreLeft"] == null ? null : ApronLeft.fromJson(json["rearTyreLeft"]),
      rearTyreRight: json["rearTyreRight"] == null ? null : ApronLeft.fromJson(json["rearTyreRight"]),
      rearViewMirrorLeft: json["rearViewMirrorLeft"] == null ? null : ApronLeft.fromJson(json["rearViewMirrorLeft"]),
      rearViewMirrorRight: json["rearViewMirrorRight"] == null ? null : ApronLeft.fromJson(json["rearViewMirrorRight"]),
      rearWindShield: json["rearWindShield"] == null ? null : ApronLeft.fromJson(json["rearWindShield"]),
      rearWiper: json["rearWiper"] == null ? null : ApronLeft.fromJson(json["rearWiper"]),
      rightApillar: json["rightApillar"] == null ? null : ApronLeft.fromJson(json["rightApillar"]),
      rightBpillar: json["rightBpillar"] == null ? null : ApronLeft.fromJson(json["rightBpillar"]),
      rightCpillar: json["rightCpillar"] == null ? null : ApronLeft.fromJson(json["rightCpillar"]),
      rightImage: json["rightImage"] == null ? null : Front.fromJson(json["rightImage"]),
      roof: json["roof"] == null ? null : ApronLeft.fromJson(json["roof"]),
      runnningBorderLeft: json["runnningBorderLeft"] == null ? null : ApronLeft.fromJson(json["runnningBorderLeft"]),
      runnningBorderRight: json["runnningBorderRight"] == null ? null : ApronLeft.fromJson(json["runnningBorderRight"]),
      spareWheel: json["spareWheel"] == null ? null : ApronLeft.fromJson(json["spareWheel"]),
      tailLightLeft: json["tailLightLeft"] == null ? null : ApronLeft.fromJson(json["tailLightLeft"]),
      tailLightRight: json["tailLightRight"] == null ? null : ApronLeft.fromJson(json["tailLightRight"]),
      upperCrossMember: json["upperCrossMember"] == null ? null : ApronLeft.fromJson(json["upperCrossMember"]),
      cowlTop: json["cowlTop"] == null ? null : ApronLeft.fromJson(json["cowlTop"]),
      front: json["front"] == null ? null : Front.fromJson(json["front"]),
      frontLeft: json["frontLeft"] == null ? null : Front.fromJson(json["frontLeft"]),
      frontRight: json["frontRight"] == null ? null : Front.fromJson(json["frontRight"]),
      rearLeft: json["rearLeft"] == null ? null : Front.fromJson(json["rearLeft"]),
      rearRight: json["rearRight"] == null ? null : Front.fromJson(json["rearRight"]),
      rear: json["rear"] == null ? null : Front.fromJson(json["rear"]),
      frontWithHoodOpen: json["frontWithHoodOpen"] == null ? null : Front.fromJson(json["frontWithHoodOpen"]),
      rearBootOpen: json["rearBootOpen"] == null ? null : Front.fromJson(json["rearBootOpen"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "carId": carId,
    "apronLeft": apronLeft?.toJson(),
    "apronRight": apronRight?.toJson(),
    "bonnetPatti": bonnetPatti?.toJson(),
    "boot": boot?.toJson(),
    "bumperFront": bumperFront?.toJson(),
    "bumperRear": bumperRear?.toJson(),
    "chassisExtension": chassisExtension?.toJson(),
    "dickyDoor": dickyDoor?.toJson(),
    "doorFrontLeft": doorFrontLeft?.toJson(),
    "doorFrontRight": doorFrontRight?.toJson(),
    "doorGlassLeft": doorGlassLeft?.toJson(),
    "doorGlassRight": doorGlassRight?.toJson(),
    "doorRearLeft": doorRearLeft?.toJson(),
    "doorRearRight": doorRearRight?.toJson(),
    "fenderLeft": fenderLeft?.toJson(),
    "fenderRight": fenderRight?.toJson(),
    "firewall": firewall?.toJson(),
    "fogLightLeft": fogLightLeft?.toJson(),
    "fogLightRight": fogLightRight?.toJson(),
    "frontTyreLeft": frontTyreLeft?.toJson(),
    "frontTyreRight": frontTyreRight?.toJson(),
    "frontWindShield": frontWindShield?.toJson(),
    "fuelLid": fuelLid?.toJson(),
    "fullBodyRepaint": fullBodyRepaint,
    "grill": grill?.toJson(),
    "headLightLeft": headLightLeft?.toJson(),
    "headLightRight": headLightRight?.toJson(),
    "headLightSupport": headLightSupport?.toJson(),
    "jackAndTool": jackAndTool,
    "leftApillar": leftApillar?.toJson(),
    "leftBpillar": leftBpillar?.toJson(),
    "leftCpillar": leftCpillar?.toJson(),
    "leftImage": leftImage?.toJson(),
    "lowerCrossMember": lowerCrossMember?.toJson(),
    "missingParts": missingParts,
    "quarterGlass": quarterGlass?.toJson(),
    "quarterPanelLeft": quarterPanelLeft?.toJson(),
    "quarterPanelRight": quarterPanelRight?.toJson(),
    "rearTyreLeft": rearTyreLeft?.toJson(),
    "rearTyreRight": rearTyreRight?.toJson(),
    "rearViewMirrorLeft": rearViewMirrorLeft?.toJson(),
    "rearViewMirrorRight": rearViewMirrorRight?.toJson(),
    "rearWindShield": rearWindShield?.toJson(),
    "rearWiper": rearWiper?.toJson(),
    "rightApillar": rightApillar?.toJson(),
    "rightBpillar": rightBpillar?.toJson(),
    "rightCpillar": rightCpillar?.toJson(),
    "rightImage": rightImage?.toJson(),
    "roof": roof?.toJson(),
    "runnningBorderLeft": runnningBorderLeft?.toJson(),
    "runnningBorderRight": runnningBorderRight?.toJson(),
    "spareWheel": spareWheel?.toJson(),
    "tailLightLeft": tailLightLeft?.toJson(),
    "tailLightRight": tailLightRight?.toJson(),
    "upperCrossMember": upperCrossMember?.toJson(),
    "cowlTop": cowlTop?.toJson(),
    "front": front?.toJson(),
    "frontLeft": frontLeft?.toJson(),
    "frontRight": frontRight?.toJson(),
    "rearLeft": rearLeft?.toJson(),
    "rearRight": rearRight?.toJson(),
    "rear": rear?.toJson(),
    "frontWithHoodOpen": frontWithHoodOpen?.toJson(),
    "rearBootOpen": rearBootOpen?.toJson(),
  };

}

class ApronLeft {
  ApronLeft({
    required this.condition,
  });

  final List<String> condition;

  factory ApronLeft.fromJson(Map<String, dynamic> json){
    return ApronLeft(
      condition: json["condition"] == null ? [] : List<String>.from(json["condition"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "condition": condition.map((x) => x).toList(),
  };

}

class Front {
  Front({
    required this.name,
    required this.url,
    required this.condition,
    required this.remarks,
  });

  final String name;
  final String url;
  final List<String> condition;
  final String remarks;

  factory Front.fromJson(Map<String, dynamic> json){
    return Front(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
      condition: json["condition"] == null ? [] : List<String>.from(json["condition"]!.map((x) => x)),
      remarks: json["remarks"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "condition": condition.map((x) => x).toList(),
    "remarks": remarks,
  };

}

class Meta {
  Meta({
    required this.access,
    required this.refresh,
  });

  final String access;
  final String refresh;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      access: json["access"] ?? "",
      refresh: json["refresh"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "access": access,
    "refresh": refresh,
  };

}

/*
{
	"status": "success",
	"message": "Car Exterior info fetched successfully!",
	"data": [
		[
			{
				"_id": "65cf2025b07b4acdec103567",
				"carId": "65cf2025b07b4acdec103563",
				"apronLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"apronRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"bonnetPatti": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"boot": {
					"condition": [
						"bad",
						"good"
					]
				},
				"bumperFront": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"bumperRear": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"chassisExtension": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"dickyDoor": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorFrontLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorFrontRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorGlassLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorGlassRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorRearLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"doorRearRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fenderLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fenderRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"firewall": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fogLightLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fogLightRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"frontTyreLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"frontTyreRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"frontWindShield": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fuelLid": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"fullBodyRepaint": "Yes",
				"grill": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"headLightLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"headLightRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"headLightSupport": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"jackAndTool": "good",
				"leftApillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"leftBpillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"leftCpillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"leftImage": {
					"name": "leftImage-1708515728081-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/leftImage-1708515728081-IMG_5882 (1).jpg",
					"condition": [],
					"remarks": ""
				},
				"lowerCrossMember": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"missingParts": "car missing",
				"quarterGlass": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"quarterPanelLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"quarterPanelRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearTyreLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearTyreRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearViewMirrorLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearViewMirrorRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearWindShield": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rearWiper": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rightApillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rightBpillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rightCpillar": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"rightImage": {
					"name": "rightImage-1708515728095-IMG_5882 (2).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/rightImage-1708515728095-IMG_5882 (2).jpg",
					"condition": [],
					"remarks": ""
				},
				"roof": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"runnningBorderLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"runnningBorderRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"spareWheel": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"tailLightLeft": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"tailLightRight": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"upperCrossMember": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"cowlTop": {
					"condition": [
						"bad",
						"bad"
					]
				},
				"front": {
					"name": "front-1708515727028-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/front-1708515727028-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"frontLeft": {
					"name": "frontLeft-1708515727001-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontLeft-1708515727001-IMG_5882 (1).jpg",
					"condition": [],
					"remarks": "dummy"
				},
				"frontRight": {
					"name": "frontRight-1708515726956-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontRight-1708515726956-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"rearLeft": {
					"name": "rearLeft-1708515726990-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/rearLeft-1708515726990-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"rearRight": {
					"name": "rearRight-1708515727518-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/rearRight-1708515727518-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"rear": {
					"name": "rear-1708515727553-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/rear-1708515727553-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"frontWithHoodOpen": {
					"name": "frontWithHoodOpen-1708515727535-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/frontWithHoodOpen-1708515727535-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				},
				"rearBootOpen": {
					"name": "rearBootOpen-1708515727572-IMG_5882 (1).jpg",
					"url": "https://bucketkeracars.s3.ap-south-1.amazonaws.com/rearBootOpen-1708515727572-IMG_5882 (1).jpg",
					"condition": [
						"bad",
						"bad"
					],
					"remarks": "dummy"
				}
			}
		]
	],
	"meta": {
		"access": "",
		"refresh": ""
	}
}*/