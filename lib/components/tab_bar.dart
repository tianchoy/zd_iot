import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/controllers/tab_bar_controller.dart';
import 'top_bar.dart';

class TabBar extends GetView<TabBarController> {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Obx(() => controller.currentTab.value.page), // 现在可以使用 .page 了
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: AppTab.values.map((tab) {
            final isSelected = tab == controller.currentTab.value;
            return BottomNavigationBarItem(
              icon: Icon(
                tab.icon, // 现在可以使用 .icon 了
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              label: tab.label, // 现在可以使用 .label 了
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
