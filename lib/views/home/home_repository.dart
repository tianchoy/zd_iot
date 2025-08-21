import '../../shared/services/api_service.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<String> fetchHomeData() async {
    return await _apiService.fetchHomeData();
  }
}
