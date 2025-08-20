import 'package:get/get.dart';
import '../components/bindings/tab_bar_bingding.dart';
import '../components/tab_bar.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const TabBar(),
      bindings: [TabBarBinding()],
    )
  ];
}
