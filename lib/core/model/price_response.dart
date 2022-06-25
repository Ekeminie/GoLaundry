import 'dart:convert';

PriceResponse priceResponseFromMap(String str) =>
    PriceResponse.fromJson(json.decode(str));

String priceResponseToMap(PriceResponse data) => json.encode(data.toJson());

class PriceResponse {
  int? success;
  List<Price>? data;

  PriceResponse({this.success, this.data});

  PriceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Price>[];
      json['data'].forEach((v) {
        data!.add(new Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  String? category;
  String? categoryId;
  String? clothType;
  String? pairId;
  String? price;
  num? amount;
  String? imageUrl;

  Price(
      {this.category,
      this.categoryId,
      this.clothType,
      this.pairId,
      this.amount,
      this.price,
      this.imageUrl});

  Price.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryId = json['category_id'];
    clothType = json['cloth_type'];
    pairId = json['pair_id'];
    price = json['price'];
    imageUrl = json['image_url'];
    amount = num.parse(json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['cloth_type'] = this.clothType;
    data['pair_id'] = this.pairId;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
