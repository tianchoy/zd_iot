import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: AppRouter.routes,
    );
  }
}
