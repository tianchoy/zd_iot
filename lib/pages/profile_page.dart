import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/profile_page_controller.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Profile'),
    );
  }
}
