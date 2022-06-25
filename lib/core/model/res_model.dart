import 'dart:convert';

ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));

String resModelToJson(ResModel data) => json.encode(data.toJson());

String resModelDataToString(dynamic data) => json.encode(data);

dynamic resModelDataToJson(String data) => json.decode(data);

class ResModel {
  bool? success;
  String? message;
  dynamic data;
  String? token;

  ResModel({this.success, this.message, this.data, this.token});

  factory ResModel.fromJson(Map<String, dynamic> json) => ResModel(
        success: json["success"] == null
            ? null
            : json["success"] == 1
                ? true
                : false,
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success ?? null,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
        "token": token == null ? null : token,
      };
}
