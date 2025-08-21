import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  NetworkException({required this.message, this.statusCode, this.data});

  @override
  String toString() {
    return 'NetworkException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }

  // 工厂方法创建不同类型的异常
  factory NetworkException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException(
          message: '连接超时',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.sendTimeout:
        return NetworkException(
          message: '发送超时',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: '接收超时',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          message: '证书错误',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.badResponse:
        return NetworkException(
          message: _handleResponseError(dioError.response),
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          message: '请求取消',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      case DioExceptionType.connectionError:
        return NetworkException(
          message: '网络连接错误',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
      default:
        return NetworkException(
          message: '网络请求失败',
          statusCode: dioError.response?.statusCode,
          data: dioError.response?.data,
        );
    }
  }

  static String _handleResponseError(Response? response) {
    if (response == null) return '服务器无响应';

    switch (response.statusCode) {
      case 400:
        return '请求错误';
      case 401:
        return '未授权，请重新登录';
      case 403:
        return '拒绝访问';
      case 404:
        return '请求的资源不存在';
      case 500:
        return '服务器内部错误';
      case 502:
        return '网关错误';
      case 503:
        return '服务不可用';
      case 504:
        return '网关超时';
      default:
        return '服务器错误: ${response.statusCode}';
    }
  }
}
