import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/top_bar.dart';
import 'controllers/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: '登录',
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Get.snackbar('帮助', '登录帮助信息');
            },
          ),
        ],
        showBackButton: true,
        onBackPressed: () {
          controller.signUp();
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: controller.usernameController,
              placeholder: '输入手机号',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(CupertinoIcons.phone, size: 22),
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemBackground.resolveFrom(
                  context,
                ),
                border: Border.all(
                  color: CupertinoColors.systemGrey.resolveFrom(context),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(height: 20),
            CupertinoTextField(
              controller: controller.passwordController,
              placeholder: '输入密码',
              obscureText: true, //显示为黑点
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(CupertinoIcons.lock, size: 22),
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemBackground.resolveFrom(
                  context,
                ),
                border: Border.all(
                  color: CupertinoColors.systemGrey.resolveFrom(context),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: CupertinoButton.filled(
                onPressed: () {
                  controller.login();
                },
                child: const Text('登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
