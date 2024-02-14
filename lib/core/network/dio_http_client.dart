import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'dio_instance.dart';
import 'http_client.dart';

/// [DioHttpClass] represents the concrete (implementations) of the [HttpClient] class
/// using [DioInstance]

@LazySingleton(as: HttpClient)
class DioHttpClass implements HttpClient {
  DioHttpClass(this._dioInstance);
  final DioInstance _dioInstance;

  @override
  Future<Response> request({
    required String endPoint,
    required HttpMethods method,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    // Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dioInstance.dio.request(
      endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        contentType: _dioInstance.dio.options.contentType,
        method: method.methodName,
        responseType: _dioInstance.dio.options.responseType,
        sendTimeout: _dioInstance.dio.options.sendTimeout,
        receiveTimeout: _dioInstance.dio.options.receiveTimeout,
        headers: _dioInstance.dio.options.headers,
      ),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }
}
