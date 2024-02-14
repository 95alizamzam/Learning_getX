import 'package:dio/dio.dart';

/// [HttpClient] is the class which represents contract to call http Requests
///
abstract class HttpClient {
  Future<Response<dynamic>> request({
    required String endPoint,
    required HttpMethods method,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    // Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

enum HttpMethods {
  get,
  post,
  put,
  delete;

  String get methodName => name.toUpperCase();
}
