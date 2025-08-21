// shared/controllers/navigation_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';

class NavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    if (index == currentIndex.value) return;

    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.offAllNamed('/');
        break;
      case 1:
        Get.offAllNamed('/messages');
        break;
      case 2:
        Get.offAllNamed('/profile');
        break;
    }
  }

  void updateIndexFromRoute(String route) {
    switch (route) {
      case '/':
        currentIndex.value = 0;
        break;
      case '/messages':
        currentIndex.value = 1;
        break;
      case '/profile':
        currentIndex.value = 2;
        break;
    }
  }
}

// 在MainScaffold中使用
class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showBackButton: showBackButton,
        actions: actions,
      ),
      body: body,
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: navigationController.changeIndex,
        ),
      ),
      bottomSheet: bottom,
    );
  }
}
