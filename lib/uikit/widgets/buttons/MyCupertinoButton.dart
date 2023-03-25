import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoButton extends CupertinoButton {
  MyCupertinoButton({super.key,
    required VoidCallback onPressed,
    double borderRadius = 8.0,
    Color? color = Colors.blue,
    EdgeInsetsGeometry? padding,
    String text = 'Button Text',
  }) : super(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
          onPressed: onPressed,
        );
}
