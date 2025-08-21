// TopBar.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
  final List<Widget> actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const TopBar({
    super.key,
    required this.title,
    required this.actions,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: const TextStyle(fontSize: 18.0)),
      actions: actions,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed:
                  onBackPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            )
          : null,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}
