class EvaluationStatusResponse {
  String? status;
  String? message;
  Data? data;
  Meta? meta;

  EvaluationStatusResponse({this.status, this.message, this.data, this.meta});

  EvaluationStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? evaluationStatusForEngine;
  String? evaluationStatusForInterior;
  String? evaluationStatusForTestDrive;
  String? evaluationStatusForFeature;
  String? evaluationStatusForAc;
  String? evaluationStatusForDocument;
  String? evaluationStatusForExterior;

  Data(
      {this.evaluationStatusForEngine,
        this.evaluationStatusForInterior,
        this.evaluationStatusForTestDrive,
        this.evaluationStatusForFeature,
        this.evaluationStatusForAc,
        this.evaluationStatusForDocument,
        this.evaluationStatusForExterior});

  Data.fromJson(Map<String, dynamic> json) {
    evaluationStatusForEngine = json['evaluationStatusForEngine'];
    evaluationStatusForInterior = json['evaluationStatusForInterior'];
    evaluationStatusForTestDrive = json['evaluationStatusForTestDrive'];
    evaluationStatusForFeature = json['evaluationStatusForFeature'];
    evaluationStatusForAc = json['evaluationStatusForAc'];
    evaluationStatusForDocument = json['evaluationStatusForDocument'];
    evaluationStatusForExterior = json['evaluationStatusForExterior'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['evaluationStatusForEngine'] = evaluationStatusForEngine;
    data['evaluationStatusForInterior'] = evaluationStatusForInterior;
    data['evaluationStatusForTestDrive'] = evaluationStatusForTestDrive;
    data['evaluationStatusForFeature'] = evaluationStatusForFeature;
    data['evaluationStatusForAc'] = evaluationStatusForAc;
    data['evaluationStatusForDocument'] = evaluationStatusForDocument;
    data['evaluationStatusForExterior'] = evaluationStatusForExterior;
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
