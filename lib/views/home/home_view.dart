import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/main_scaffold.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: '首页',
      showBackButton: false,
      body: Column(
        children: [
          Text('HomeView'),
          // IconButton(
          //   icon: Icon(Icons.refresh),
          //   // onPressed: controller.refreshData,
          // ),
        ],
      ),
    );
  }
}
