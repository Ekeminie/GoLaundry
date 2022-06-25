import 'package:anywash/constant/constants.dart';
import 'package:anywash/core/model/res_model.dart';
import 'package:anywash/core/services/storage-service.dart';
import 'package:anywash/core/services/user.service.dart';
import 'package:anywash/core/services/web-services/user-api-service.dart';
import 'package:anywash/locator.dart';
import 'package:dio/dio.dart';

import 'base-api.dart';

class AuthenticationApiService {
  StorageService storageService = getIt<StorageService>();
  UserService userService = getIt<UserService>();
  UserApiService userApiService = getIt<UserApiService>();

  Future login({required String phone, required String pin}) async {
    var formData = FormData.fromMap({
      "pin": pin,
      "phone": phone,
    });
    print(formData);
    try {
      Response response = await connect().post("login", data: formData);
      await storeToken(response, saveUser: false);
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future signup(
      {String? email,
      String? pin,
      String? fName,
      String? lName,
      String? phone}) async {
    Map _data = {
      "pin": pin,
      "phone": phone,
      "firstname": fName,
      "lastname": lName,
      "email": email
    };
    var formData = FormData.fromMap({
      "pin": pin,
      "phone": phone,
      "firstname": fName,
      "lastname": lName,
      "email": email
    });

    print(_data.toString());

    try {
      Response response = await connect().post("signup", data: formData);
      // await storeToken(response);
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future sendOtp({required String email}) async {
    try {
      Response response =
          await connect().post("otp/send", data: {"email": email});
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future verifyOtp({required String email, required String otp}) async {
    try {
      Response response = await connect()
          .post("otp/verify", data: {"email": email, "otp": otp});
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future validateOtp({String? email, String? password, String? otp}) async {
    try {
      Response response = await connect().post("auth/password/forgot",
          data: {"email": email, "password": password, "otp": int.parse(otp!)});
      await storeToken(response);

      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future forgotPassword({String? email}) async {
    try {
      Response response =
          await connect().post("auth/password/forgot", data: {"email": email});
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future validatePasswordOtp(
      {required String email,
      required String otp,
      required String password}) async {
    try {
      Response response = await connect().post("auth/password/reset",
          data: {"email": email, "otp": otp, "password": password});
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  storeToken(response, {bool saveUser = true}) async {
    ResModel res = resModelFromJson(response.data);
    if (res.success == false) return;

    String _token = '${res.token}';

    storageService.storeItem(key: token, value: _token);
    // await userService.getUser();
    if (saveUser) {
      // storageService.storeItem(
      //   key: currentUser,
      //   value: jsonEncode(res.data['user']),
      // );
    }
  }
}
