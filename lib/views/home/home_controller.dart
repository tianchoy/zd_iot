// home_controller.dart
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:zd_plugin/zd_plugin.dart';
import 'home_repository.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository _repository = HomeRepository();
  final isLoading = true.obs;
  final data = ''.obs;
  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // loadData();
    getVersion();
  }

  Future<void> getVersion() async {
    final ZdPlugin _plugin = ZdPlugin();
    final String? version = await _plugin.getPlatformVersion();
    Logger().d('version: $version');
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = '';

      Logger().d('开始加载数据...');
      final responseData = await _repository.fetchHomeData();
      if (responseData is Map) {
        data.value = responseData.toString();
      } else {
        data.value = responseData?.toString() ?? 'No data';
      }

      Logger().d('处理后的数据: ${data.value}');
    } catch (e) {
      error.value = e.toString();
      Logger().d('Controller 错误: $error');
      Get.snackbar(
        '错误',
        '加载数据失败: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
      Logger().d('加载完成,isLoading: ${isLoading.value}');
    }
  }

  void refreshData() {
    loadData();
  }
}
