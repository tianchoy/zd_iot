import 'package:flutter/cupertino.dart';
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
          CupertinoButton(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            onPressed: () {
              Get.toNamed('/login');
            },
            child: Text('登陆', style: TextStyle(color: Colors.white)),
          ),
          // IconButton(
          //   icon: Icon(Icons.refresh),
          //   // onPressed: controller.refreshData,
          // ),
        ],
      ),
    );
  }
}
