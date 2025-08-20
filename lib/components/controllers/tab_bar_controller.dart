import 'package:get/get.dart';
import '../tab_bar.dart';

class TabBarController extends GetxController {
  final currentTab = AppTab.home.obs;

  void changeTab(AppTab tab) {
    currentTab.value = tab;
  }
}
