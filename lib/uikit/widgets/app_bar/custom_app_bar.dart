import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Color textColor;
  final String titleText;
  final double appBarHeight;

  CustomAppBar({
    required this.backgroundColor,
    required this.textColor,
    required this.titleText,
    this.appBarHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return AppBar(
      backgroundColor: backgroundColor,
      leading: canPop
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: textColor),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        titleText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
