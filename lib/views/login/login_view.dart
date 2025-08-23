import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zd_iot/shared/widgets/main_scaffold.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: '登陆',
      showBackButton: true,
      showBottomNavBar: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.snackbar('title', 'message');
          },
          child: Text('注册'),
        ),
      ],
      body: Column(children: [Text('Login View')]),
    );
  }
}
