import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              controller.signUp();
            },
            child: const Text(
              '注册',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
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
