// shared/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'custom_app_bar.dart';
import '../services/navigation_service.dart';

class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showBackButton: showBackButton,
        actions: actions,
      ),
      body: body,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: NavigationService.getCurrentIndex(),
        onTap: NavigationService.navigateTo,
      ),
      bottomSheet: bottom,
    );
  }
}
