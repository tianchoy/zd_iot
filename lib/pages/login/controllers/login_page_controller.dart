import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUp() {
    // 登录逻辑
    Get.snackbar('提示', '注册的逻辑');
  }

  void login() {
    // 登录逻辑
    Get.snackbar('提示', '登录的逻辑');
  }
}
