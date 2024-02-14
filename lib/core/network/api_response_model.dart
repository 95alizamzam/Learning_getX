// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_dev/core/getx/base_getx_controller.dart';

class ResponseModel<T> {
  final T? data;
  final int? statusCode;
  final bool? success;
  final String? errorMessage;
  ResponseModel._({
    this.data,
    this.statusCode,
    this.success,
    this.errorMessage,
  });

  factory ResponseModel.fromData(T data) {
    return ResponseModel._(data: data, success: true, statusCode: 200);
  }

  factory ResponseModel.fromError(int code, String msg) {
    return ResponseModel._(
      success: false,
      statusCode: code,
      errorMessage: msg,
    );
  }
}

extension ResponseModelExt on ResponseModel {
  T? resolve<T>(BaseGetXController controller) {
    if (success!) {
      return data;
    } else {
      controller.showSnackBar(text: errorMessage!);
      controller.hasError = true;
      return null;
    }
  }
}
