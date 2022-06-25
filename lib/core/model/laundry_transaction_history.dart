import 'dart:convert';

LaundryTransactionHistory laundryTransHistoryFromMap(String str) =>
    LaundryTransactionHistory.fromJson(json.decode(str));

String laundryTransHistoryToMap(LaundryTransactionHistory data) =>
    json.encode(data.toJson());

class LaundryTransactionHistory {
  int? success;
  List<LaundryTransaction>? data;

  LaundryTransactionHistory({this.success, this.data});

  LaundryTransactionHistory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <LaundryTransaction>[];
      json['data'].forEach((v) {
        data!.add(new LaundryTransaction.fromJson(v));
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

class LaundryTransaction {
  String? orderId;
  String? orderRef;
  List<Items>? items;
  String? orderAmount;
  String? date;
  String? paymentMethod;
  String? paymentStatus;
  String? branchAddress;
  String? branchPhone;
  String? branchEmail;
  String? serviceName;
  String? pickupAddress;
  String? pickupTime;
  String? dropoffAddress;
  String? dropoffTime;
  String? instruction;
  String? deliveryStatus;
  String? deliveryMethod;
  String? deliveryPrice;

  LaundryTransaction(
      {this.orderId,
      this.orderRef,
      this.items,
      this.orderAmount,
      this.date,
      this.paymentMethod,
      this.paymentStatus,
      this.branchAddress,
      this.branchPhone,
      this.branchEmail,
      this.serviceName,
      this.pickupAddress,
      this.pickupTime,
      this.dropoffAddress,
      this.dropoffTime,
      this.instruction,
      this.deliveryStatus,
      this.deliveryMethod,
      this.deliveryPrice});

  LaundryTransaction.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderRef = json['order_ref'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    orderAmount = json['order_amount'].toString();
    date = json['date'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    branchAddress = json['branch_address'];
    branchPhone = json['branch_phone'];
    branchEmail = json['branch_email'];
    serviceName = json['service_name'];
    pickupAddress = json['pickup_address'];
    pickupTime = json['pickup_time'];
    dropoffAddress = json['dropoff_address'];
    dropoffTime = json['dropoff_time'];
    instruction = json['instruction'];
    deliveryStatus = json['delivery_status'];
    deliveryMethod = json['delivery_method'];
    deliveryPrice = json['delivery_price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_ref'] = this.orderRef;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['order_amount'] = this.orderAmount;
    data['date'] = this.date;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['branch_address'] = this.branchAddress;
    data['branch_phone'] = this.branchPhone;
    data['branch_email'] = this.branchEmail;
    data['service_name'] = this.serviceName;
    data['pickup_address'] = this.pickupAddress;
    data['pickup_time'] = this.pickupTime;
    data['dropoff_address'] = this.dropoffAddress;
    data['dropoff_time'] = this.dropoffTime;
    data['instruction'] = this.instruction;
    data['delivery_status'] = this.deliveryStatus;
    data['delivery_method'] = this.deliveryMethod;
    data['delivery_price'] = this.deliveryPrice;
    return data;
  }
}

class Items {
  String? cloth;
  String? type;
  int? quantity;
  int? amount;
  int? totalPrice;

  Items({this.cloth, this.type, this.quantity, this.amount, this.totalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    cloth = json['cloth'];
    type = json['type'];
    quantity = json['quantity'];
    amount = json['amount'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloth'] = this.cloth;
    data['type'] = this.type;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
