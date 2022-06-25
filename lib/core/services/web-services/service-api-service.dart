import 'package:anywash/core/model/book_laundry_service_payload.dart';
import 'package:anywash/core/model/book_service_response.dart';
import 'package:anywash/core/model/branch_response.dart';
import 'package:anywash/core/model/cleaning_service_payload.dart';
import 'package:anywash/core/model/delivery_options.dart';
import 'package:anywash/core/model/get_price_by_service_category_response.dart';
import 'package:anywash/core/model/price_response.dart';
import 'package:anywash/core/model/res_model.dart';
import 'package:anywash/core/model/service_category_response.dart';
import 'package:anywash/core/model/service_response.dart';
import 'package:anywash/locator.dart';
import 'package:dio/dio.dart';

import '../storage-service.dart';
import '../user.service.dart';
import 'base-api.dart';

class ServicesApiService {
  StorageService storageService = getIt<StorageService>();
  UserService userService = getIt<UserService>();

  Future getServices() async {
    try {
      Response response = await connect().get("services");
      return serviceResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getServiceCategory({String? serviceID}) async {
    try {
      Response response = await connect().get("services?serviceID=$serviceID");
      return serviceCategoryResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getBranches() async {
    try {
      Response response = await connect().get("branches");
      return branchResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getPrices() async {
    try {
      Response response = await connect().get("service_variation");
      return priceResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getDeliveryOptions() async {
    try {
      Response response = await connect().get("delivery");
      return deliveryOptionsResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future getPriceByServiceCategory({String? serviceCategory}) async {
    try {
      Response response = await connect()
          .get("service_variation?service_type=$serviceCategory");
      return priceByServiceCatResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future bookLaundryService({BookLaundryServicePayload? payload}) async {
    print("booking service payload: ${payload!.toJson()}");
    try {
      Response response = await connect().post("book", data: payload.toJson());
      return bookServiceResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }

  Future bookCleaningService({BookCleaningServicePayload? payload}) async {
    try {
      Response response = await connect().post("book", data: payload!.toJson());
      print(response.data.toString());
      return bookServiceResponseFromMap(response.data);
    } on DioError catch (e) {
      return resModelFromJson(e.response?.data);
    }
  }
}
