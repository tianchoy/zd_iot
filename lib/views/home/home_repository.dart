import 'package:logger/logger.dart';

import '../../shared/services/api_service.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<dynamic> fetchHomeData() async {
    try {
      final response = await _apiService.fetchHomeData();
      if (response.statusCode == 200) {
        return response.data.json();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      Logger().d(e);
      rethrow;
    }
  }
}
