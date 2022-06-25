import 'dart:convert';

DeliverOptionsResponse deliveryOptionsResponseFromMap(String str) =>
    DeliverOptionsResponse.fromJson(json.decode(str));

String deliveryOptionsResponseToMap(DeliverOptionsResponse data) =>
    json.encode(data.toJson());

class DeliverOptionsResponse {
  int? success;
  String? message;
  List<DeliveryOptions>? data;

  DeliverOptionsResponse({this.success, this.message, this.data});

  DeliverOptionsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DeliveryOptions>[];
      json['data'].forEach((v) {
        data!.add(new DeliveryOptions.fromJson(v));
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

class DeliveryOptions {
  String? deliveryCode;
  String? deliveryMethod;
  String? deliveryPrice;

  DeliveryOptions({this.deliveryCode, this.deliveryMethod, this.deliveryPrice});

  DeliveryOptions.fromJson(Map<String, dynamic> json) {
    deliveryCode = json['delivery_code'];
    deliveryMethod = json['delivery_method'];
    deliveryPrice = json['delivery_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_code'] = this.deliveryCode;
    data['delivery_method'] = this.deliveryMethod;
    data['delivery_price'] = this.deliveryPrice;
    return data;
  }
}
