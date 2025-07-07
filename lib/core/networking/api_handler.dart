// core/networking/api_handler.dart
import 'package:dio/dio.dart';

//import 'api_constants.dart';
import 'api_error_model.dart';


class ApiHandler implements Exception {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to Server Failed ");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to  the Server was Canceled ");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              message: "Connection timeout in Connection to the Server ");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in Connection to the Server ");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in Connection to the Server ");
        default:
          return ApiErrorModel(message: "Somthing error occurrd");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurrd");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
      message: data["message"] ?? "Unknown error occurrd",
      code: data["code"],
      errors: data["errors"]);
}
