import 'dart:convert';

ServicesCategoryResponse serviceCategoryResponseFromMap(String str) =>
    ServicesCategoryResponse.fromJson(json.decode(str));

String serviceCategoryResponseToMap(ServicesCategoryResponse data) =>
    json.encode(data.toJson());

class ServicesCategoryResponse {
  int? success;
  String? message;
  List<ServiceCategory>? data;

  ServicesCategoryResponse({this.success, this.message, this.data});

  ServicesCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ServiceCategory>[];
      json['data'].forEach((v) {
        data!.add(new ServiceCategory.fromJson(v));
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

class ServiceCategory {
  String? categoryId;
  String? subServiceName;
  String? serviceCode;
  String? imageUrl;

  ServiceCategory(
      {this.categoryId, this.subServiceName, this.serviceCode, this.imageUrl});

  ServiceCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    subServiceName = json['sub_service_name'];
    serviceCode = json['service_code'];
    imageUrl = json["image_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['sub_service_name'] = this.subServiceName;
    data['service_code'] = this.serviceCode;
    data["image_url"] = this.imageUrl;
    return data;
  }
}
