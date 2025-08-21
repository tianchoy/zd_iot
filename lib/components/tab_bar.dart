// TabBar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/controllers/tab_bar_controller.dart';
import 'top_bar.dart';

class TabBar extends GetView<TabBarController> {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: TopBar(
          title: controller.topBarTitle.value,
          actions: controller.topBarActions.value,
          showBackButton: controller.topBarShowBack.value,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: controller.currentTab.value.page,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: AppTab.values.map((tab) {
            final isSelected = tab == controller.currentTab.value;
            return BottomNavigationBarItem(
              icon: Icon(
                tab.icon,
                color: isSelected ? Colors.blue : Colors.grey,
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
            controller.changeTab(AppTab.values[index]);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
