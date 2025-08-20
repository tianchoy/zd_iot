import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/controllers/tab_bar_controller.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabBarController controller = Get.find();

    return Obx(
      () => AppBar(
        centerTitle: true,
        title: Text(
          controller.topBarTitle.value,
          style: TextStyle(fontSize: 15.0),
        ),
        actions: controller.topBarActions,
        automaticallyImplyLeading: controller.topBarShowBack.value,
        // 可以根据需要添加其他 AppBar 属性
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
