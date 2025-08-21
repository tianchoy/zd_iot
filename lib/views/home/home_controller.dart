// home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_repository.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository _repository = HomeRepository();
  final isLoading = true.obs;
  final data = ''.obs;
  final error = ''.obs;

  late TabController tabController;
  final List<String> tabs = ['Featured', 'Popular', 'New', 'Trending'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    loadData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = '';

      print('开始加载数据...');
      final responseData = await _repository.fetchHomeData();
      if (responseData is Map || responseData is List) {
        data.value = responseData.toString();
      } else {
        data.value = responseData?.toString() ?? 'No data';
      }

      print('处理后的数据: ${data.value}');
    } catch (e) {
      error.value = e.toString();
      print('Controller 错误: $e');
      Get.snackbar(
        '错误',
        '加载数据失败: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      print('加载完成，isLoading: ${isLoading.value}');
    }
  }

  void refreshData() {
    loadData();
  }
}
