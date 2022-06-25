class BookLaundryServicePayload {
  String? serviceCode;
  List<CartItems>? cartItems;
  int? deliveryCode;
  List<Address>? address;
  String? paymentMethod;
  int? branchId;
  String? reference;
  String? instruction;

  BookLaundryServicePayload(
      {this.serviceCode,
      this.cartItems,
      this.deliveryCode,
      this.address ,
      this.paymentMethod,
      this.branchId,
      this.reference,
      this.instruction});

  BookLaundryServicePayload.fromJson(Map<String, dynamic> json) {
    serviceCode = json['service_code'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    deliveryCode = json['delivery_code'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
    paymentMethod = json['payment_method'];
    branchId = json['branch_id'];
    reference = json['reference'];
    instruction = json['instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_code'] = this.serviceCode;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['delivery_code'] = this.deliveryCode;
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    data['payment_method'] = this.paymentMethod;
    data['branch_id'] = this.branchId;
    data['reference'] = this.reference;
    data['instruction'] = this.instruction;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceCode': this.serviceCode,
      'cartItems': this.cartItems,
      'deliveryCode': this.deliveryCode,
      'address': this.address,
      'paymentMethod': this.paymentMethod,
      'branchId': this.branchId,
      'reference': this.reference,
      'instruction': this.instruction,
    };
  }

  factory BookLaundryServicePayload.fromMap(Map<String, dynamic> map) {
    return BookLaundryServicePayload(
      serviceCode: map['serviceCode'] as String,
      cartItems: map['cartItems'] as List<CartItems>,
      deliveryCode: map['deliveryCode'] as int,
      address: map['address'] as List<Address>,
      paymentMethod: map['paymentMethod'] as String,
      branchId: map['branchId'] as int,
      reference: map['reference'] as String,
      instruction: map['instruction'] as String,
    );
  }
}

class CartItems {
  int? pairId;
  int? qty;

  CartItems({this.pairId, this.qty});

  CartItems.fromJson(Map<String, dynamic> json) {
    pairId = json['pair_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pair_id'] = this.pairId;
    data['qty'] = this.qty;
    return data;
  }
}

class Address {
  String? pickupAddress;
  String? pickupTime;
  String? dropoffAddress;
  String? dropoffTime;

  Address(
      {this.pickupAddress,
      this.pickupTime,
      this.dropoffAddress,
      this.dropoffTime});

  Address.fromJson(Map<String, dynamic> json) {
    pickupAddress = json['pickup_address'];
    pickupTime = json['pickup_time'];
    dropoffAddress = json['dropoff_address'];
    dropoffTime = json['dropoff_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickup_address'] = this.pickupAddress;
    data['pickup_time'] = this.pickupTime;
    data['dropoff_address'] = this.dropoffAddress;
    data['dropoff_time'] = this.dropoffTime;
    return data;
  }
}
