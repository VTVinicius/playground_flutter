import 'dart:math';
import 'package:flutter/material.dart';

class ClockExercise extends StatelessWidget {
  final double seconds;
  final double minutes;
  final double hours;
  final double scaleWidth;
  final double radius;
  final ScaleStyle2 style;

  ClockExercise({
    this.seconds = 0,
    this.minutes = 0,
    this.hours = 0,
    this.style = const ScaleStyle2(),
    this.scaleWidth = 100,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClockPainter(seconds, minutes, hours, scaleWidth, radius, style),
      size: Size(2 * (radius + scaleWidth / 2), 2 * (radius + scaleWidth / 2)),
    );
  }
}

class _ClockPainter extends CustomPainter {
  final double seconds;
  final double minutes;
  final double hours;
  final double scaleWidth;
  final double radius;
  final ScaleStyle2 style;

  _ClockPainter(
      this.seconds,
      this.minutes,
      this.hours,
      this.scaleWidth,
      this.radius,
      this.style,
      );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final circleCenter = Offset(center.dx, scaleWidth / 2 + radius);

    final outerRadius = radius + scaleWidth / 2;

    // Draw circle
    final circlePaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    canvas.drawCircle(circleCenter, radius + scaleWidth / 2, circlePaint);

    // Draw scales
    for (int i = 0; i <= 360; i++) {
      final angleInRad = (i - 90) * (pi / 180);
      final lineType = i % 30 == 0
          ? LineType.fiveStep
          : i % 6 == 0
          ? LineType.normal
          : LineType.tenStep;
      final lineLength = style.getLineLength(lineType);
      final lineColor = style.getLineColor(lineType);
      final lineStart = Offset(
        (outerRadius - lineLength) * cos(angleInRad) + circleCenter.dx,
        (outerRadius - lineLength) * sin(angleInRad) + circleCenter.dy,
      );
      final lineEnd = Offset(
        outerRadius * cos(angleInRad) + circleCenter.dx,
        outerRadius * sin(angleInRad) + circleCenter.dy,
      );

      canvas.drawLine(lineStart, lineEnd, Paint()..color = lineColor..strokeWidth = 1);
    }

    // Draw clock hands
    final handPaint = (Color color) => Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(circleCenter.dx, circleCenter.dy);
    canvas.rotate(seconds * (360 / 60) * (pi / 180));
    canvas.drawLine(Offset.zero, Offset(0, -(radius + 20)), handPaint(style.scaleIndicator1Color));
    canvas.restore();

    canvas.save();
    canvas.translate(circleCenter.dx, circleCenter.dy);
    canvas.rotate(hours * (360 / 12) * (pi / 180));
    canvas.drawLine(Offset.zero, Offset(0, -radius), handPaint(style.scaleIndicator2Color));
    canvas.restore();

    canvas.save();
    canvas.translate(circleCenter.dx, circleCenter.dy);
    canvas.rotate(minutes * (360 / 60) * (pi / 180));
    canvas.drawLine(Offset.zero, Offset(0, -(radius + 20)), handPaint(style.scaleIndicator3Color));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ScaleStyle2 {
  final double scaleWidth;
  final double radius;
  final Color normalLineColor;
  final Color fiveStepLineColor;
  final Color tenStepLineColor;
  final double normalLineLength;
  final double fiveStepLineLength;
  final double tenStepLineLength;
  final Color scaleIndicator1Color;
  final Color scaleIndicator2Color;
  final Color scaleIndicator3Color;
  final double scaleIndicator1Length;
  final double scaleIndicator2Length;
  final double scaleIndicator3Length;
  final double textSize;

  const ScaleStyle2({
    this.scaleWidth = 100,
    this.radius = 550,
    this.normalLineColor = Colors.black,
    this.fiveStepLineColor = Colors.black,
    this.tenStepLineColor = Colors.black,
    this.normalLineLength = 15,
    this.fiveStepLineLength = 25,
    this.tenStepLineLength = 0,
    this.scaleIndicator1Color = Colors.red,
    this.scaleIndicator2Color = Colors.black,
    this.scaleIndicator3Color = Colors.black,
    this.scaleIndicator1Length = 100,
    this.scaleIndicator2Length = 90,
    this.scaleIndicator3Length = 80,
    this.textSize = 18,
  });

  double getLineLength(LineType lineType) {
    switch (lineType) {
      case LineType.normal:
        return normalLineLength;
      case LineType.fiveStep:
        return fiveStepLineLength;
      case LineType.tenStep:
      default:
        return tenStepLineLength;
    }
  }

  Color getLineColor(LineType lineType) {
    switch (lineType) {
      case LineType.normal:
        return normalLineColor;
      case LineType.fiveStep:
        return fiveStepLineColor;
      case LineType.tenStep:
      default:
        return tenStepLineColor;
    }
  }
}

enum LineType { normal, fiveStep, tenStep }