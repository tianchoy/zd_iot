import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_repository.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository _repository = HomeRepository();
  final isLoading = true.obs;
  final data = ''.obs;

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
      data.value = await _repository.fetchHomeData();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  void refreshData() {
    loadData();
  }
}
