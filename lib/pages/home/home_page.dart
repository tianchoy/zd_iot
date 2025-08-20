import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('首页'),
        CupertinoButton(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          onPressed: () {
            Get.toNamed('/login');
          },
          child: const Text('登录', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
