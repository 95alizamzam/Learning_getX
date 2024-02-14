import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_dev/core/network/api_response_model.dart';
import 'package:injectable/injectable.dart';

import 'http_client.dart';

@lazySingleton
class BaseRemoteDataSource {
  final HttpClient _dioHttpClass;

  BaseRemoteDataSource(this._dioHttpClass);

  Future<ResponseModel<T>> request<T>({
    required String endPoint,
    required HttpMethods method,
    required T Function(dynamic json) serializer,
    Object? body,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioHttpClass.request(
        endPoint: endPoint,
        method: method,
        cancelToken: cancelToken,
        data: body,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
      );
      final data = response.data as Map<String, dynamic>;

      return ResponseModel.fromData(serializer(data));
    } on DioException catch (err) {
      switch (err.type) {
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return ResponseModel.fromError(500, "No Internet Connection");
        case DioExceptionType.badResponse:
          final statusCode = err.response?.statusCode ?? 500;
          final errorMessage = err.response?.data ?? err.error.toString();
          return ResponseModel.fromError(statusCode, errorMessage);

        default:
          return ResponseModel.fromError(500, err.toString());
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.fromError(500, "No Internet Connection");
      }
      return ResponseModel.fromError(500, e.toString());
    }
  }
}
