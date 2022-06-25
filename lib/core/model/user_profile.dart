// To parse this JSON data, do
//
//     final userProfile = userProfileFromMap(jsonString);

import 'dart:convert';

UserProfile userProfileFromMap(String str) =>
    UserProfile.fromMap(json.decode(str));

String userProfileToMap(UserProfile data) => json.encode(data.toMap());

class UserProfile {
  UserProfile({
    this.success,
    this.data,
  });

  int? success;
  User? data;

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : User.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
      };
}

class User {
  User({
    this.profile,
    this.accounts,
  });

  Profile? profile;
  List<Account>? accounts;

  factory User.fromMap(Map<String, dynamic> json) => User(
        profile:
            json["profile"] == null ? null : Profile.fromMap(json["profile"]),
        accounts: json["accounts"] == null
            ? null
            : List<Account>.from(
                json["accounts"].map((x) => Account.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "profile": profile == null ? null : profile!.toMap(),
        "accounts": accounts == null
            ? null
            : List<dynamic>.from(accounts!.map((x) => x.toMap())),
      };
}

class Account {
  Account({
    this.bankCode,
    this.bankName,
    this.accountNumber,
    this.accountName,
  });

  String? bankCode;
  String? bankName;
  String? accountNumber;
  String? accountName;

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        bankCode: json["bankCode"] == null ? null : json["bankCode"],
        bankName: json["bankName"] == null ? null : json["bankName"],
        accountNumber:
            json["accountNumber"] == null ? null : json["accountNumber"],
        accountName: json["accountName"] == null ? null : json["accountName"],
      );

  Map<String, dynamic> toMap() => {
        "bankCode": bankCode == null ? null : bankCode,
        "bankName": bankName == null ? null : bankName,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "accountName": accountName == null ? null : accountName,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          bankCode == other.bankCode &&
          bankName == other.bankName &&
          accountNumber == other.accountNumber &&
          accountName == other.accountName;

  @override
  int get hashCode =>
      bankCode.hashCode ^
      bankName.hashCode ^
      accountNumber.hashCode ^
      accountName.hashCode;
}

class Profile {
  Profile({
    this.createdAt,
    this.email,
    this.emailToken,
    this.emailTokenExpiry,
    this.firstname,
    this.gender,
    this.hasVerifiedEmail,
    this.userId,
    this.inviteCode,
    this.isActive,
    this.lastname,
    this.phone,
    this.walletBalance,
  });

  DateTime? createdAt;
  String? email;
  String? emailToken;
  String? emailTokenExpiry;
  String? firstname;
  String? gender;
  String? hasVerifiedEmail;
  String? userId;
  String? inviteCode;
  String? isActive;
  String? lastname;
  String? phone;
  String? walletBalance;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        email: json["email"] == null ? null : json["email"],
        emailToken: json["email_token"] == null ? null : json["email_token"],
        emailTokenExpiry: json["email_token_expiry"] == null
            ? null
            : json["email_token_expiry"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        gender: json["gender"] == null ? null : json["gender"],
        hasVerifiedEmail: json["has_verified_email"] == null
            ? null
            : json["has_verified_email"],
        userId: json["user_id"] == null ? null : json["user_id"],
        inviteCode: json["invite_code"] == null ? null : json["invite_code"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        phone: json["phone"] == null ? null : json["phone"],
        walletBalance:
            json["wallet_balance"] == null ? null : json["wallet_balance"],
      );

  Map<String, dynamic> toMap() => {
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "email": email == null ? null : email,
        "email_token": emailToken == null ? null : emailToken,
        "email_token_expiry":
            emailTokenExpiry == null ? null : emailTokenExpiry,
        "firstname": firstname == null ? null : firstname,
        "gender": gender == null ? null : gender,
        "has_verified_email":
            hasVerifiedEmail == null ? null : hasVerifiedEmail,
        "user_id": userId == null ? null : userId,
        "invite_code": inviteCode == null ? null : inviteCode,
        "is_active": isActive == null ? null : isActive,
        "lastname": lastname == null ? null : lastname,
        "phone": phone == null ? null : phone,
        "wallet_balance": walletBalance == null ? null : walletBalance,
      };
}
