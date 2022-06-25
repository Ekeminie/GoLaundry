import 'package:anywash/constant/constants.dart';
import 'package:anywash/core/services/web-services/nertwork_config.dart';
import 'package:anywash/locator.dart';
import 'package:dio/dio.dart';

import '../storage-service.dart';

connect() {
  StorageService storageService = getIt<StorageService>();

  BaseOptions options = BaseOptions(
      baseUrl: NetworkConfig.BASE_URL,
      connectTimeout: 100000,
      receiveTimeout: 30000,
      responseType: ResponseType.plain);
  Dio dio = Dio(options);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? value = await storageService.readItem(key: token);
        if (value != null && value.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $value";
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ),
  );

  return dio;
}
