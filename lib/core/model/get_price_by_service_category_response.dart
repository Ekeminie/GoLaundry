import 'dart:convert';

PriceByServiceCategoryResponse priceByServiceCatResponseFromMap(String str) =>
    PriceByServiceCategoryResponse.fromJson(json.decode(str));

String priceByServiceCatResponseToMap(PriceByServiceCategoryResponse data) =>
    json.encode(data.toJson());

class PriceByServiceCategoryResponse {
  int? success;
  String? category;
  List<Data>? data;

  PriceByServiceCategoryResponse({this.success, this.category, this.data});

  PriceByServiceCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    category = json['category'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['category'] = this.category;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? clothType;
  String? price;

  Data({this.clothType, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    clothType = json['cloth_type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloth_type'] = this.clothType;
    data['price'] = this.price;
    return data;
  }
}
