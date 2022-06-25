import 'dart:convert';

ServicesResponse serviceResponseFromMap(String str) =>
    ServicesResponse.fromJson(json.decode(str));

String serviceResponseToMap(ServicesResponse data) =>
    json.encode(data.toJson());

class ServicesResponse {
  int? success;
  String? message;
  List<Service>? data;

  ServicesResponse({this.success, this.message, this.data});

  ServicesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Service>[];
      json['data'].forEach((v) {
        data!.add(new Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  String? id;
  String? serviceName;
  String? serviceCode;
  String? serviceLogo;

  Service({this.id, this.serviceName, this.serviceCode, this.serviceLogo});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['service_name'];
    serviceCode = json['service_code'];
    serviceLogo = json['service_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_name'] = this.serviceName;
    data['service_code'] = this.serviceCode;
    data['service_logo'] = this.serviceLogo;
    return data;
  }
}
