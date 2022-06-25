import 'dart:convert';

BookServiceResponse bookServiceResponseFromMap(String str) =>
    BookServiceResponse.fromJson(json.decode(str));

String bookServiceResponseToMap(BookServiceResponse data) =>
    json.encode(data.toJson());

class BookServiceResponse {
  int? success;
  String? message;
  Data? data;

  BookServiceResponse({this.success, this.message, this.data});

  BookServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bookingCode;

  Data({this.bookingCode});

  Data.fromJson(Map<String, dynamic> json) {
    bookingCode = json['booking_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_code'] = this.bookingCode;
    return data;
  }
}
