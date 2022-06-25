import 'dart:convert';

CleaningTransactionHistory cleaningTransHistoryFromMap(String str) =>
    CleaningTransactionHistory.fromJson(json.decode(str));

String cleaningTransHistoryToMap(CleaningTransactionHistory data) =>
    json.encode(data.toJson());

class CleaningTransactionHistory {
  int? success;
  List<CleaningTransaction>? data;

  CleaningTransactionHistory({this.success, this.data});

  CleaningTransactionHistory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CleaningTransaction>[];
      json['data'].forEach((v) {
        data!.add(new CleaningTransaction.fromJson(v));
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

class CleaningTransaction {
  String? bookingRef;
  String? fullname;
  String? address;
  String? phone;
  String? altPhonenumber;
  String? date;
  String? instruction;
  String? userId;
  String? subServiceName;

  CleaningTransaction(
      {this.bookingRef,
      this.fullname,
      this.address,
      this.phone,
      this.altPhonenumber,
      this.date,
      this.instruction,
      this.userId,
      this.subServiceName});

  CleaningTransaction.fromJson(Map<String, dynamic> json) {
    bookingRef = json['booking_ref'];
    fullname = json['fullname'];
    address = json['address'];
    phone = json['phone'];
    altPhonenumber = json['alt_phonenumber'];
    date = json['date'];
    instruction = json['instruction'];
    userId = json['user_id'];
    subServiceName = json['sub_service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_ref'] = this.bookingRef;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['alt_phonenumber'] = this.altPhonenumber;
    data['date'] = this.date;
    data['instruction'] = this.instruction;
    data['user_id'] = this.userId;
    data['sub_service_name'] = this.subServiceName;
    return data;
  }
}
