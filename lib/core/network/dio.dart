import 'package:card_markethome/index.dart';
import 'package:dio/dio.dart';
import 'package:card_markethome/main.dart';

import 'helper/awesome_dio_interceptor.dart';

class ApiDioHelper {
  final Dio _dio = Dio();

  ApiDioHelper() {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 360),
        receiveTimeout: const Duration(seconds: 360),
        validateStatus: (status) {
          return true;
        },
        baseUrl: flavorSettings.apiBaseUrl);
    _dio.options = options;
    _dio.interceptors.add(AwesomeDioInterceptor());
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(
          <String, String>{},
        );
        return handler.next(options);
      },
    ));
  }

  Future<BaseResponseModel<T>> get<T>(
    String path, {
    Map<String, dynamic>? request,
    String? replaceUrl,
    bool? isRefresh = false,
    Map<String, dynamic>? addHeader,
    CancelToken? cancelToken,
  }) async {
    final token = isRefresh == true
        ? AppConfigSingleton.refreshToken
        : AppConfigSingleton.accessToken;
    Map<String, dynamic> header;

    if (token.isNotNullOrEmpty()) {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
      };
    }
    if (addHeader != null) {
      header.addAll(addHeader);
    }
    request?.removeWhere((key, value) => value == null);
    Response<dynamic>? response;
    if (replaceUrl != null) {
      response = await _dio.get(
        replaceUrl,
        queryParameters: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    } else {
      response = await _dio.get(
        path,
        queryParameters: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    }
    try {
      if (response.statusCode == 401 && isRefresh == true) {
        return get(
          path,
          request: request,
          replaceUrl: replaceUrl,
          isRefresh: true,
          cancelToken: cancelToken,
        );
      } else {
        BaseResponseModel<T> responseModel =
            BaseResponseModel.fromJson(response.data);
        return responseModel;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<BaseResponseModel<T>> post<T>({
    String path = '',
    Map<dynamic, dynamic>? request,
    String? replaceUrl,
    bool? isRefresh = false,
    Map<String, dynamic>? addHeader,
    CancelToken? cancelToken,
  }) async {
    final token = isRefresh == true
        ? AppConfigSingleton.refreshToken
        : AppConfigSingleton.accessToken;
    Map<String, dynamic> header;
    if (token.isNotNullOrEmpty()) {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    if (addHeader != null) {
      header.addAll(addHeader);
    }
    Response<dynamic>? response;
    if (replaceUrl != null) {
      response = await _dio.post(replaceUrl,
          data: request,
          options: Options(headers: header),
          cancelToken: cancelToken);
    } else {
      response = await _dio.post(
        path,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    }
    try {
      if (response.statusCode == 401 && isRefresh == true) {
        return post(
          path: path,
          request: request,
          replaceUrl: replaceUrl,
          isRefresh: true,
          cancelToken: cancelToken,
        );
      } else {
        BaseResponseModel<T> responseModel =
            BaseResponseModel.fromJson(response.data);
        return responseModel;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<BaseResponseModel<T>> delete<T>({
    String path = '',
    Map<dynamic, dynamic>? request,
    String? replaceUrl,
    bool? isRefresh = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? addHeader,
  }) async {
    final token = isRefresh == true
        ? AppConfigSingleton.refreshToken
        : AppConfigSingleton.accessToken;
    Map<String, dynamic> header;
    if (token.isNotNullOrEmpty()) {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    if (addHeader != null) {
      header.addAll(addHeader);
    }
    Response<dynamic>? response;
    if (replaceUrl != null) {
      response = await _dio.delete(
        replaceUrl,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    } else {
      response = await _dio.delete(
        path,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    }
    try {
      if (response.statusCode == 401 && isRefresh == true) {
        return delete(
          path: path,
          request: request,
          replaceUrl: replaceUrl,
          isRefresh: true,
          cancelToken: cancelToken,
        );
      } else {
        BaseResponseModel<T> responseModel =
            BaseResponseModel.fromJson(response.data);
        return responseModel;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<BaseResponseModel<T>> patch<T>({
    String path = '',
    Map<dynamic, dynamic>? request,
    String? replaceUrl,
    bool? isRefresh = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? addHeader,
  }) async {
    final token = isRefresh == true
        ? AppConfigSingleton.refreshToken
        : AppConfigSingleton.accessToken;
    Map<String, dynamic> header;
    if (token.isNotNullOrEmpty()) {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    if (addHeader != null) {
      header.addAll(addHeader);
    }
    Response<dynamic>? response;
    if (replaceUrl != null) {
      response = await _dio.patch(
        replaceUrl,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    } else {
      response = await _dio.patch(
        path,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    }
    try {
      if (response.statusCode == 401 && isRefresh == true) {
        return patch(
          path: path,
          request: request,
          replaceUrl: replaceUrl,
          isRefresh: true,
          cancelToken: cancelToken,
        );
      } else {
        BaseResponseModel<T> responseModel =
            BaseResponseModel.fromJson(response.data);
        return responseModel;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<BaseResponseModel<T>> put<T>({
    String path = '',
    Map<dynamic, dynamic>? request,
    String? replaceUrl,
    bool? isRefresh = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? addHeader,
  }) async {
    final token = isRefresh == true
        ? AppConfigSingleton.refreshToken
        : AppConfigSingleton.accessToken;
    Map<String, dynamic> header;
    if (token.isNotNullOrEmpty()) {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    if (addHeader != null) {
      header.addAll(addHeader);
    }
    Response<dynamic>? response;
    if (replaceUrl != null) {
      response = await _dio.put(
        replaceUrl,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    } else {
      response = await _dio.put(
        path,
        data: request,
        options: Options(headers: header),
        cancelToken: cancelToken,
      );
    }
    try {
      if (response.statusCode == 401 && isRefresh == true) {
        return put(
          path: path,
          request: request,
          replaceUrl: replaceUrl,
          isRefresh: true,
          cancelToken: cancelToken,
        );
      } else {
        BaseResponseModel<T> responseModel =
            BaseResponseModel.fromJson(response.data);
        return responseModel;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
