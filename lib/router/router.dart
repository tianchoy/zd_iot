import 'package:get/get.dart';
import '../components/bindings/tab_bar_bingding.dart';
import '../components/tab_bar.dart';
import '../pages/login/bindings/login_page_binding.dart';
import '../pages/login/login_page.dart';

class AppRouter {
  static final routes = [
    GetPage(name: '/', page: () => const TabBar(), bindings: [TabBarBinding()]),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      bindings: [LoginPageBinding()],
    ),
  ];
}
