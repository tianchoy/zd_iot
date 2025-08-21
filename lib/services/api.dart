import 'package:dio/dio.dart';

import 'api_service.dart';
import 'api_constants.dart';

class ApiService {
  final HttpService _httpService = HttpService(baseUrl: ApiConstants.baseUrl);

  // 用户相关API
  Future<Response> login(data) async {
    return await _httpService.post(ApiConstants.login, data: data);
  }

  Future<Response> register(data) async {
    return await _httpService.post(ApiConstants.register, data: data);
  }

  // 数据相关API
  Future<Response> fetchUserData() async {
    return await _httpService.get(ApiConstants.userProfile);
  }

  Future<Response> updateUserProfile(Map<String, dynamic> data) async {
    return await _httpService.put(ApiConstants.userProfile, data: data);
  }

  Future<Response> uploadFile(
    String filePath, {
    required ProgressCallback onSendProgress,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });

    return await _httpService.post(
      ApiConstants.upload,
      data: formData,
      options: Options(contentType: Headers.multipartFormDataContentType),
      onSendProgress: onSendProgress,
    );
  }
}
