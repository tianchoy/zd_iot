import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showActionButton;

  const TopBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showActionButton = false,
  });

  @override
  State<TopBar> createState() => _TopBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      centerTitle: true,
      title: Text(widget.title, style: const TextStyle(fontSize: 18)),
      actions: widget.showActionButton
          ? [
              IconButton(
                icon: const Icon(CupertinoIcons.settings, size: 22),
                onPressed: () {},
              ),
            ]
          : [],
    );
  }
}
