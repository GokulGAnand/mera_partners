import 'dart:convert';

MobileLoginResponse mobileLoginResponseFromJson(String str) => MobileLoginResponse.fromJson(json.decode(str));

String mobileLoginResponseToJson(MobileLoginResponse data) => json.encode(data.toJson());

class MobileLoginResponse {
    final String? status;
    final String? message;
    final List<dynamic>? data;
    final Meta? meta;

    MobileLoginResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory MobileLoginResponse.fromJson(Map<String, dynamic> json) => MobileLoginResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "meta": meta?.toJson(),
    };
}

class Meta {
    final String? access;
    final String? refresh;

    Meta({
        this.access,
        this.refresh,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        access: json["access"],
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
    };
}
