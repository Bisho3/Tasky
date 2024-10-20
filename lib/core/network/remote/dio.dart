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
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    bool wantBearer = true,
    token,
  }) async {
    dio.options.headers["Authorization"] =
        wantBearer == true ? "Bearer $token" : "Basic $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = wantBearer == true
        ? "application/json"
        : "application/x-www-form-urlencoded";
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
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
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
