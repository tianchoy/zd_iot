class ApiService {
  // 模拟API调用
  Future<String> fetchHomeData() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Home Data Loaded';
  }

  Future<List<String>> fetchMessages() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Message 1', 'Message 2', 'Message 3'];
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'joined': '2023-01-01',
    };
  }
}
