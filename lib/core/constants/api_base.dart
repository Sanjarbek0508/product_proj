import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:product_project/core/constants/api_endpoints.dart';
import 'package:product_project/core/constants/app_response.dart';
import 'package:product_project/core/services/token_storage.dart';

class Api {
  static Future<AppResponse> post({
    required String path,
    Map<String, dynamic>? body,
    bool useHeaders = true,
    Map<String, dynamic>? params,
    bool forFile = false,
    bool token = false,
  }) async {
    try {
      final accessToken = await TokenStorage.accessToken;
      final headers = token
          ? {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
            };

      final dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          headers: headers,
          connectTimeout: Duration(seconds: 5),
        ),
      );
      final response = await dio.post(
        path,
        data: body,
        options: Options(),
        queryParameters: params,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return AppResponse(data: response.data, success: true);
      } else {}
      return AppResponse(
        data: response.data,
        message: response.data['detail'],
        success: false,
      );
    } on DioException catch (error, stackTrace) {
      if (error.type == DioExceptionType.connectionTimeout) {
        log('err');
      }
      log("Request header: ${error.response?.headers}");
      log("Error on request: $path:", error: error, stackTrace: stackTrace);
      log("Error statuscode: ${error.response?.statusCode}");
      log("Error response: ${error.response?.data}");

      return AppResponse(
        success: false,
        message: error.response?.data['detail'].toString(),
      );
    }
  }

  static Future<AppResponse> put({
    required String path,
    dynamic body,
    String? paymentType,
    bool useHeaders = true,
    bool token = false,
  }) async {
    try {
      final accessToken = await TokenStorage.accessToken;
      final headers = token
          ? {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
            };

      final dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          headers: headers,
        ),
      );
      final response = await dio.put(
        path,
        data: body,
        options: Options(),
        queryParameters: {},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return AppResponse(
          data: response.data,
          success: true,
        );
      } else {}
      return AppResponse(
        data: response.data,
        message: response.data['detail'],
        success: false,
      );
    } on DioException catch (error, stackTrace) {
      log("Request header: ${error.response?.headers}");
      log("Error on request: $path:", error: error, stackTrace: stackTrace);
      log("Error statuscode: ${error.response?.statusCode}");
      log("Error response: ${error.response?.data}");

      return AppResponse(
        success: false,
        message: error.response?.data['detail'].toString(),
      );
    }
  }

  static Future<AppResponse> delete({
    required String path,
    dynamic body,
    bool useHeaders = true,
    dynamic params,
  }) async {
    try {
      final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl, headers: useHeaders ? {} : null));

      final response = await dio.delete(path, data: body, options: Options(headers: {}), queryParameters: params);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return AppResponse(data: response.data, success: true);
      }
      return AppResponse(data: response.data, message: response.data['detail'], success: false);
    } on DioException catch (error, stackTrace) {
      log("Error on request: $path:", error: error, stackTrace: stackTrace);
      log("Error message: ${error.message}");
      log("Error response: ${error.response?.data}");
      return AppResponse(success: false, message: error.response?.data['detail']);
    }
  }

  static Future<AppResponse> get({
    required String path,
    Map<String, dynamic>? body,
    bool useHeaders = true,
    dynamic params,
    bool token = false,
  }) async {
    try {
      final accessToken = await TokenStorage.accessToken;
      final headers = token
          ? {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
            };

      final dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          headers: headers,
        ),
      );

      final response = await dio.get(
        path,
        data: body,
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return AppResponse(
          data: response.data,
          success: true,
        );
      }

      return AppResponse(
        data: response.data,
        message: response.data['detail'],
        success: false,
      );
    } on DioException catch (error, stackTrace) {
      log("Error on request: $path:", error: error, stackTrace: stackTrace);
      log("Error message: ${error.message}");
      log("Error response: ${error.response?.data}");
      if (error.response?.statusCode == 422) {
        return AppResponse(
          success: false,
          message: error.response?.data.toString(),
        );
      }
      return AppResponse(
        success: false,
        message: getErrorMessage(error),
      );
    }
  }
}

String getErrorMessage(DioException response) {
  try {
    return "${response.response?.data['detail']}";
  } catch (error) {
    return "${response.response?.data}";
  }
}
