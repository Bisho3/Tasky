import 'package:todo/core/util/app_import.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        requestBody: true,
        request: true,
        maxWidth: 90));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";

    try {
      return await dio.get(
        url,
        queryParameters: query,
      );
    } on DioException catch (e) {
      if (AppConstance.token != null &&
          e.response?.statusCode == AppIntegers.fourHundredAndOne) {
        bool isTokenRefreshed = await refreshToken();
        if (isTokenRefreshed) {
          dio.options.headers["Authorization"] = "Bearer ${AppConstance.token}";
          return await dio.get(
            url,
            queryParameters: query,
          );
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    bool? wantMultiForm = false,
    token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] =
        wantMultiForm == false ? "application/json" : "multipart/form-data";

    try {
      return await dio.post(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (e) {
      if (AppConstance.token != null &&
          e.response?.statusCode == AppIntegers.fourHundredAndOne) {
        bool isTokenRefreshed = await refreshToken();
        if (isTokenRefreshed) {
          dio.options.headers["Authorization"] = "Bearer ${AppConstance.token}";
          return await dio.post(
            url,
            queryParameters: query,
            data: data,
          );
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    token,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";

    try {
      return await dio.delete(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (e) {
      if (AppConstance.token != null &&
          e.response?.statusCode == AppIntegers.fourHundredAndOne) {
        bool isTokenRefreshed = await refreshToken();
        if (isTokenRefreshed) {
          dio.options.headers["Authorization"] = "Bearer ${AppConstance.token}";

          return await dio.delete(
            url,
            queryParameters: query,
            data: data,
          );
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }
}
