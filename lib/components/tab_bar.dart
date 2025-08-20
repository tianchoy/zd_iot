import 'package:flutter/material.dart';
import '../components/controllers/tab_bar_controller.dart';
import 'package:get/get.dart';
import '../pages/home/home_page.dart';
import '../pages/message/message_page.dart';
import '../pages/profile/profile_page.dart';

enum AppTab { home, message, profile }

extension AppTabExtension on AppTab {
  String get label {
    switch (this) {
      case AppTab.home:
        return '首页';
      case AppTab.message:
        return '消息';
      case AppTab.profile:
        return '我';
    }
  }

  IconData get icon {
    switch (this) {
      case AppTab.home:
        return Icons.home;
      case AppTab.message:
        return Icons.textsms;
      case AppTab.profile:
        return Icons.person;
    }
  }

  Widget get page {
    switch (this) {
      case AppTab.home:
        return const HomePage();
      case AppTab.message:
        return const MessagePage();
      case AppTab.profile:
        return const ProfilePage();
    }
  }
}

class TabBar extends GetView<TabBarController> {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => controller.currentTab.value.page),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: AppTab.values.map((tab) {
            final isSelected = tab == controller.currentTab.value;
            return BottomNavigationBarItem(
              icon: Icon(
                tab.icon,
                color: isSelected ? Colors.blue : Colors.grey, // 选中项蓝色，未选中项灰色
              ),
              label: tab.label,
            );
          }).toList(),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 25.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentTab.value.index,
          onTap: (index) {
            controller.currentTab.value = AppTab.values[index];
          },
          showSelectedLabels: true, // 确保选中标签显示
          showUnselectedLabels: true, // 确保未选中标签也显示
        ),
      ),
    );
  }
}
