class NotificationListResponse {
  String? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  NotificationListResponse({this.status, this.message, this.data, this.meta});

  NotificationListResponse.fromJson(Map<String, dynamic> json) {
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
  String? body;
  String? createdAt;
  bool? isRead;
  String? nId;
  String? title;
  String? imageUrl;

  Data(
      {this.body,
        this.createdAt,
        this.isRead,
        this.nId,
        this.title,
        this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    createdAt = json['createdAt'];
    isRead = json['isRead'];
    nId = json['nId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['createdAt'] = createdAt;
    data['isRead'] = isRead;
    data['nId'] = nId;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
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
