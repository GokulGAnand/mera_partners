// import 'package:dio/dio.dart';
// import 'package:evaluator_app/service/endpoints.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
//
// class ApiManager{
//   static final ApiManager _apiService = ApiManager._internal();
//
//   ApiManager._internal();
//
//   static ApiManager get instance => _apiService;
//
//   Dio? _dio;
//   String? token;
//   bool isContentTypeJson = true;
//   bool isHttpRequest = false;
//   bool urlEncode = false;
//
//   factory ApiManager() {
//     return _apiService;
//   }
//
//   Dio? getDio({isJsonType = true, isHttpRequest = true, isUrlEncoded = false}) {
//     isContentTypeJson = isJsonType;
//     urlEncode = isUrlEncoded;
//     isHttpRequest = isHttpRequest;
//     _initAsync();
//     return _dio;
//   }
//
//   _initAsync() async {
//     try {
//       if (_dio == null) {
//         _dio = Dio();
//         _dio!.options.baseUrl = EndPoints.baseUrl;
//         _dio!.options.contentType = Headers.jsonContentType;
//         _dio!.interceptors.add(LogInterceptor());
//         _dio!.interceptors.add(PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseBody: true,
//           responseHeader: false,
//           compact: false,
//         ));
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     // if (token != null && token!.isNotEmpty) {
//     //   _dio!.interceptors.clear();
//     //   _dio!.interceptors.add(PrettyDioLogger(
//     //     requestHeader: true,
//     //     requestBody: true,
//     //     responseBody: true,
//     //     responseHeader: false,
//     //     compact: false,
//     //   ));
//     //   _dio!.interceptors.add(InterceptorsWrapper(onRequest:
//     //       (RequestOptions options, RequestInterceptorHandler handler) {
//     //     options.headers["x-auth-token"] = token;
//     //     options.headers['content-Type'] = 'text/plain; charset=UTF-8';
//     //     options.headers['Access-Control-Allow-Origin'] = '*';
//     //     options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
//     //     if (isContentTypeJson) {
//     //       options.headers["Content-Type"] = "application/json";
//     //     }
//     //
//     //     if (_urlEncode) {
//     //       options.headers["Content-Type"] = "application/x-www-form-urlencoded";
//     //     }
//     //
//     //     if (_isHttpRequest) {
//     //       options.headers["X-Requested-With"] = "XMLHttpRequest";
//     //     }
//     //
//     //     return options;
//     //   }));
//     // }
//     _dio!.options.receiveTimeout = const Duration(seconds: 20000);
//   }
//
//   void updateAuthToken(String data) {
//     token = data;
//     if (_dio != null) {
//       _dio!.interceptors.add(InterceptorsWrapper(onRequest:
//           (RequestOptions options, RequestInterceptorHandler handler) {
//         options.headers["x-auth-token"] = token;
//         // return options;
//       }));
//     }
//   }
// }
