class ApiConstants {
  static const String baseUrl = 'https://api.example.com';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // API endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String userProfile = '/users/me';
  static const String upload = '/upload';

  // Headers
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptHeader = 'Accept';
  static const String contentTypeHeaderValue = 'application/json';
}
