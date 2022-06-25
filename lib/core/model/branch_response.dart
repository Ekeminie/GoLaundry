import 'dart:convert';

BranchResponse branchResponseFromMap(String str) =>
    BranchResponse.fromJson(json.decode(str));

String branchResponseToMap(BranchResponse data) => json.encode(data.toJson());

class BranchResponse {
  int? success;
  String? message;
  List<Branch>? data;

  BranchResponse({this.success, this.message, this.data});

  BranchResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Branch>[];
      json['data'].forEach((v) {
        data!.add(Branch.fromJson(v));
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

class Branch {
  String? branchId;
  String? branch;
  String? branchPhone;
  String? branchEmail;

  Branch({this.branchId, this.branch, this.branchPhone, this.branchEmail});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branch = json['branch'];
    branchPhone = json['branch_phone'];
    branchEmail = json['branch_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch'] = this.branch;
    data['branch_phone'] = this.branchPhone;
    data['branch_email'] = this.branchEmail;
    return data;
  }
}
