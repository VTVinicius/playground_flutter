
import 'dart:ui';
import 'package:flutter/material.dart';

class ScaleStyle {
  final double scaleWidth;
  final double radius;
  final Color normalLineColor;
  final Color fiveStepLineColor;
  final Color tenStepLineColor;
  final double normalLineLength;
  final double fiveStepLineLength;
  final double tenStepLineLength;
  final Color scaleIndicatorColor;
  final double scaleIndicatorLength;
  final double textSize;

  const ScaleStyle({
    this.scaleWidth = 100,
    this.radius = 550,
    this.normalLineColor = Colors.grey,
    this.fiveStepLineColor = Colors.green,
    this.tenStepLineColor = Colors.black,
    this.normalLineLength = 15,
    this.fiveStepLineLength = 25,
    this.tenStepLineLength = 35,
    this.scaleIndicatorColor = Colors.green,
    this.scaleIndicatorLength = 60,
    this.textSize = 18,
  });
}


