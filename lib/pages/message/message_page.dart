import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/message_page_controller.dart';

class MessagePage extends GetView<MessagePageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('消息'));
  }
}
