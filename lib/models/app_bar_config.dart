import 'package:flutter/material.dart';

class AppBarConfig {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? showBackButton;

  AppBarConfig({
    required this.title,
    this.actions,
    this.backgroundColor,
    this.showBackButton = false,
  });
}
