class InteriorInfoResponse {
    String? status;
    String? message;
    List<Data>? data;
    Meta? meta;

    InteriorInfoResponse({this.status, this.message, this.data, this.meta});

    InteriorInfoResponse.fromJson(Map<String, dynamic> json) {
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
    List<String>? handBreak;
    CarElectrical? carElectrical;
    ClusterPanel? clusterPanel;
    CarElectrical? cngKitImage;
    String? combitionSwitch;
    String? dashboardCondition;
    CarElectrical? dashboardImage;
    String? dashboardSwitch;
    CarElectrical? frontSeatImage;
    CarElectrical? interiorView;
    String? key;
    CarElectrical? platformImage;
    ClusterPanel? powerWindowCentalLock;
    CarElectrical? powerWindowDriverImage;
    String? pushButton;
    CarElectrical? pushWindowDriverImage;
    CarElectrical? rearSeatImage;
    ClusterPanel? rearViewMirror;
    String? secondKey;
    String? warningDetails;

    Data(
        {this.sId,
            this.carId,
            this.handBreak,
            this.carElectrical,
            this.clusterPanel,
            this.cngKitImage,
            this.combitionSwitch,
            this.dashboardCondition,
            this.dashboardImage,
            this.dashboardSwitch,
            this.frontSeatImage,
            this.interiorView,
            this.key,
            this.platformImage,
            this.powerWindowCentalLock,
            this.powerWindowDriverImage,
            this.pushButton,
            this.pushWindowDriverImage,
            this.rearSeatImage,
            this.rearViewMirror,
            this.secondKey,
            this.warningDetails});

    Data.fromJson(Map<String, dynamic> json) {
        sId = json['_id'];
        carId = json['carId'];
        handBreak = json['handBreak'].cast<String>();
        carElectrical = json['carElectrical'] != null
            ? CarElectrical.fromJson(json['carElectrical'])
            : null;
        clusterPanel = json['clusterPanel'] != null
            ? ClusterPanel.fromJson(json['clusterPanel'])
            : null;
        cngKitImage = json['cngKitImage'] != null
            ? CarElectrical.fromJson(json['cngKitImage'])
            : null;
        combitionSwitch = json['combitionSwitch'];
        dashboardCondition = json['dashboardCondition'];
        dashboardImage = json['dashboardImage'] != null
            ? CarElectrical.fromJson(json['dashboardImage'])
            : null;
        dashboardSwitch = json['dashboardSwitch'];
        frontSeatImage = json['frontSeatImage'] != null
            ? CarElectrical.fromJson(json['frontSeatImage'])
            : null;
        interiorView = json['interiorView'] != null
            ? CarElectrical.fromJson(json['interiorView'])
            : null;
        key = json['key'];
        platformImage = json['platformImage'] != null
            ? CarElectrical.fromJson(json['platformImage'])
            : null;
        powerWindowCentalLock = json['powerWindowCentalLock'] != null
            ? ClusterPanel.fromJson(json['powerWindowCentalLock'])
            : null;
        powerWindowDriverImage = json['powerWindowDriverImage'] != null
            ? CarElectrical.fromJson(json['powerWindowDriverImage'])
            : null;
        pushButton = json['pushButton'];
        pushWindowDriverImage = json['pushWindowDriverImage'] != null
            ? CarElectrical.fromJson(json['pushWindowDriverImage'])
            : null;
        rearSeatImage = json['rearSeatImage'] != null
            ? CarElectrical.fromJson(json['rearSeatImage'])
            : null;
        rearViewMirror = json['rearViewMirror'] != null
            ? ClusterPanel.fromJson(json['rearViewMirror'])
            : null;
        secondKey = json['secondKey'];
        warningDetails = json['warningDetails'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['_id'] = sId;
        data['carId'] = carId;
        data['handBreak'] = handBreak;
        if (carElectrical != null) {
            data['carElectrical'] = carElectrical!.toJson();
        }
        if (clusterPanel != null) {
            data['clusterPanel'] = clusterPanel!.toJson();
        }
        if (cngKitImage != null) {
            data['cngKitImage'] = cngKitImage!.toJson();
        }
        data['combitionSwitch'] = combitionSwitch;
        data['dashboardCondition'] = dashboardCondition;
        if (dashboardImage != null) {
            data['dashboardImage'] = dashboardImage!.toJson();
        }
        data['dashboardSwitch'] = dashboardSwitch;
        if (frontSeatImage != null) {
            data['frontSeatImage'] = frontSeatImage!.toJson();
        }
        if (interiorView != null) {
            data['interiorView'] = interiorView!.toJson();
        }
        data['key'] = key;
        if (platformImage != null) {
            data['platformImage'] = platformImage!.toJson();
        }
        if (powerWindowCentalLock != null) {
            data['powerWindowCentalLock'] = powerWindowCentalLock!.toJson();
        }
        if (powerWindowDriverImage != null) {
            data['powerWindowDriverImage'] = powerWindowDriverImage!.toJson();
        }
        data['pushButton'] = pushButton;
        if (pushWindowDriverImage != null) {
            data['pushWindowDriverImage'] = pushWindowDriverImage!.toJson();
        }
        if (rearSeatImage != null) {
            data['rearSeatImage'] = rearSeatImage!.toJson();
        }
        if (rearViewMirror != null) {
            data['rearViewMirror'] = rearViewMirror!.toJson();
        }
        data['secondKey'] = secondKey;
        data['warningDetails'] = warningDetails;
        return data;
    }
}

class CarElectrical {
    String? name;
    String? url;
    List<String>? condition;
    String? remarks;

    CarElectrical({this.name, this.url, this.condition, this.remarks});

    CarElectrical.fromJson(Map<String, dynamic> json) {
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

class ClusterPanel {
    String? name;
    String? url;
    List<String>? condition;

    ClusterPanel({this.name, this.url, this.condition});

    ClusterPanel.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        url = json['url'];
        condition = json['condition'].cast<String>();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['name'] = name;
        data['url'] = url;
        data['condition'] = condition;
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
