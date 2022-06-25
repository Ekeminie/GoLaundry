class BookCleaningServicePayload {
  String? serviceCode;
  int? categoryId;
  String? address;
  String? fullname;
  int? phoneNumber;
  int? altPhonenumber;
  String? date;
  String? instruction;

  BookCleaningServicePayload(
      {this.serviceCode,
      this.categoryId,
      this.address,
      this.fullname,
      this.phoneNumber,
      this.altPhonenumber,
      this.date,
      this.instruction});

  BookCleaningServicePayload.fromJson(Map<String, dynamic> json) {
    serviceCode = json['service_code'];
    categoryId = json['category_id'];
    address = json['address'];
    fullname = json['fullname'];
    phoneNumber = json['phone_number'];
    altPhonenumber = json['alt_phonenumber'];
    date = json['date'];
    instruction = json['instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_code'] = this.serviceCode;
    data['category_id'] = this.categoryId;
    data['address'] = this.address;
    data['fullname'] = this.fullname;
    data['phone_number'] = this.phoneNumber;
    data['alt_phonenumber'] = this.altPhonenumber;
    data['date'] = this.date;
    data['instruction'] = this.instruction;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceCode': this.serviceCode,
      'categoryId': this.categoryId,
      'address': this.address,
      'fullname': this.fullname,
      'phoneNumber': this.phoneNumber,
      'altPhonenumber': this.altPhonenumber,
      'date': this.date,
      'instruction': this.instruction,
    };
  }

  factory BookCleaningServicePayload.fromMap(Map<String, dynamic> map) {
    return BookCleaningServicePayload(
      serviceCode: map['serviceCode'] as String,
      categoryId: map['categoryId'] as int,
      address: map['address'] as String,
      fullname: map['fullname'] as String,
      phoneNumber: map['phoneNumber'] as int,
      altPhonenumber: map['altPhonenumber'] as int,
      date: map['date'] as String,
      instruction: map['instruction'] as String,
    );
  }
}
