import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/home/home_page.dart';
import '../../pages/message/message_page.dart';
import '../../pages/profile/profile_page.dart';

// 在这里定义枚举
enum AppTab { home, message, profile }

// 在这里定义扩展方法
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
        return CupertinoIcons.home;
      case AppTab.message:
        return CupertinoIcons.mail;
      case AppTab.profile:
        return CupertinoIcons.person;
    }
  }

  // 将 page getter 移到这里
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

class TabBarController extends GetxController {
  final Rx<AppTab> currentTab = AppTab.home.obs;

  final RxString topBarTitle = '首页'.obs;
  final RxList<Widget> topBarActions = <Widget>[].obs;
  final RxBool topBarShowBack = false.obs;

  @override
  void onInit() {
    super.onInit();
    _updateTopBarConfig(AppTab.home);
  }

  void changeTab(AppTab tab) {
    currentTab.value = tab;
    _updateTopBarConfig(tab);
  }

  void _updateTopBarConfig(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        topBarTitle.value = '首页';
        topBarActions.value = [
          IconButton(
            icon: const Icon(CupertinoIcons.plus_circled, size: 22.0),
            onPressed: _onAddDevice,
          ),
        ];
        topBarShowBack.value = false;
        break;
      case AppTab.message:
        topBarTitle.value = '消息中心';
        topBarActions.value = [
          IconButton(
            icon: const Icon(CupertinoIcons.mail, size: 22.0),
            onPressed: _onFilter,
          ),
        ];
        topBarShowBack.value = false;
        break;
      case AppTab.profile:
        topBarTitle.value = '个人中心';
        topBarActions.value = [
          IconButton(
            icon: const Icon(CupertinoIcons.settings, size: 22.0),
            onPressed: _onSettings,
          ),
        ];
        topBarShowBack.value = false;
        break;
    }
  }

  void _onSearch() => Get.snackbar('搜索', '搜索功能');
  void _onAddDevice() => Get.snackbar('添加', '添加设备');
  void _onFilter() => Get.snackbar('过滤', '过滤消息');
  void _onSettings() => Get.snackbar('设置', '系统设置');
}
