import 'dart:convert';

import 'package:anywash/constant/constants.dart';
import 'package:anywash/core/model/res_model.dart';
import 'package:anywash/core/model/user_profile.dart';
import 'package:anywash/locator.dart';
import 'package:dio/dio.dart';

import '../storage-service.dart';
import '../user.service.dart';
import 'base-api.dart';

class UserApiService {
  StorageService storageService = getIt<StorageService>();
  UserService userService = getIt<UserService>();

  Future updateUser({required String user}) async {
    Map dataMap = jsonDecode(user);
    dataMap.removeWhere((key, value) => value == null);
    try {
      Response response =
          await connect().patch("user/update/me", data: dataMap);
      print(response);
      await storeUser(response);
      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  storeUser(response) {
    print(response.data);
    try {
      print(response.data.runtimeType);
      UserProfile res = userProfileFromMap(response.data);
      print(res.success);
      print(res.data?.profile?.lastname);
      if (res.success != 1) return;
      userService.userCredentials = res;
      storageService.storeItem(key: currentUser, value: userProfileToMap(res));
      userService.getUser();
    } catch (e) {
      print(e);
    }
  }

  Future resetPassword({
    required String email,
    required String password,
    required String newPassword,
  }) async {
    Map _data = {
      "email": email,
      "password": password,
      "newPassword": newPassword
    };
    print(_data);
    try {
      Response response =
          await connect().post("user/change-password", data: _data);
      print(response);

      return resModelFromJson(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getUser() async {
    try {
      Response response = await connect().get("profile");

      await storeUser(response);
      return UserProfile.fromMap(response.data);
    } on DioError catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future getTransactions({String? serviceCode}) async {
    print(serviceCode);
    try {
      Response response = await connect().get(
        "transactions?service_code=$serviceCode",
      );
      return response.data;
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }
}
