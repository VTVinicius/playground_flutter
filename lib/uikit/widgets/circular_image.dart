import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularImageWithBorder extends StatelessWidget {
  final String imagePath;
  final double imageSize;
  final double borderWidth;
  final Color borderColor;

  CircularImageWithBorder({
    required this.imagePath,
    this.imageSize = 100.0,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}