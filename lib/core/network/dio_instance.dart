import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// [DioInstance] class provide us the dio instance which will be used during app life-cycle

@lazySingleton
class DioInstance {
  late Dio dio;
  DioInstance() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dummyjson.com",
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          HttpHeaders.authorizationHeader: '',
        },
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
      ),
    );

    dio.interceptors
      ..add(AuthInterceptor())
      ..add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: false,
        maxWidth: 150,
        logPrint: (object) => debugPrint(object.toString()),
      ));
  }
}

class AuthInterceptor implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
