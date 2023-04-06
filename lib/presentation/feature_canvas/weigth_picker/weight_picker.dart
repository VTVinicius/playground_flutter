import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_canvas/weigth_picker/scale_style.dart';

import '../clock/clock_component.dart';

class WeightPicker extends StatefulWidget {
  final ScaleStyle style;
  final int minWeight;
  final int maxWeight;
  final int initialWeight;
  final ValueChanged<int> onWeightChange;

  const WeightPicker({
    Key? key,
    this.style = const ScaleStyle(),
    this.minWeight = 10,
    this.maxWeight = 250,
    this.initialWeight = 80,
    required this.onWeightChange,
  }) : super(key: key);

  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  double _angle = 0;
  double _oldAngle = 0;
  Offset _circleCenter = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _oldAngle = _angle;
      },
      onScaleUpdate: (details) {
        double touchAngle = -math.atan2(
          _circleCenter.dx - details.localFocalPoint.dx,
          _circleCenter.dy - details.localFocalPoint.dy,
        ) *
            (180.0 / math.pi);

        // Adicione um fator de escala aqui (valores menores tornam o deslize mais lento)
        double rotationFactor = 0.3;
        double newAngle = _oldAngle + (touchAngle - _oldAngle) * rotationFactor;

        setState(() {
          _angle = newAngle;
        });

        widget.onWeightChange(
            (widget.initialWeight - _angle).round().clamp(
                widget.minWeight, widget.maxWeight));
      },
      child: CustomPaint(
        painter: _WeightPickerPainter(
          style: widget.style,
          minWeight: widget.minWeight,
          maxWeight: widget.maxWeight,
          initialWeight: widget.initialWeight,
          angle: _angle,
          onCircleCenterChange: (circleCenter) {
            _circleCenter = circleCenter;
          },
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _WeightPickerPainter extends CustomPainter {
  final ScaleStyle style;
  final int minWeight;
  final int maxWeight;
  final int initialWeight;
  final double angle;
  final ValueChanged<Offset> onCircleCenterChange;

  _WeightPickerPainter({
    required this.style,
    required this.minWeight,
    required this.maxWeight,
    required this.initialWeight,
    required this.angle,
    required this.onCircleCenterChange,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final circleCenter = Offset(center.dx, style.radius + style.scaleWidth / 2);

    onCircleCenterChange(circleCenter);

    final outerRadius = style.radius + style.scaleWidth / 2;
    final innerRadius = style.radius - style.scaleWidth / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = style.scaleWidth
      ..color = Colors.white;

    canvas.drawCircle(circleCenter, style.radius, paint);

    for (int i = minWeight; i <= maxWeight; i++) {
      final angleInRad = (i - initialWeight + angle - 90) * (math.pi / 180);
      LineType lineType = i % 10 == 0
          ? LineType.tenStep
          : i % 5 == 0
              ? LineType.fiveStep
              : LineType.normal;

      double lineLength = lineType == LineType.normal
          ? style.normalLineLength
          : lineType == LineType.fiveStep
              ? style.fiveStepLineLength
              : style.tenStepLineLength;

      Color lineColor = lineType == LineType.normal
          ? style.normalLineColor
          : lineType == LineType.fiveStep
              ? style.fiveStepLineColor
              : style.tenStepLineColor;

      final lineStart = Offset(
        (outerRadius - lineLength) * math.cos(angleInRad) + circleCenter.dx,
        (outerRadius - lineLength) * math.sin(angleInRad) + circleCenter.dy,
      );
      final lineEnd = Offset(
        outerRadius * math.cos(angleInRad) + circleCenter.dx,
        outerRadius * math.sin(angleInRad) + circleCenter.dy,
      );

      canvas.drawLine(lineStart, lineEnd, Paint()..color = lineColor);

      if (lineType == LineType.tenStep) {
        final textRadius = outerRadius - lineLength - 5 - style.textSize;
        final x = textRadius * math.cos(angleInRad) + circleCenter.dx;
        final y = textRadius * math.sin(angleInRad) + circleCenter.dy;

        canvas.save();
        canvas.translate(x, y);
        canvas.rotate(angleInRad + math.pi / 2);

        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: i.toString(),
            style: TextStyle(fontSize: style.textSize, color: lineColor),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
            canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
        canvas.restore();
      }
    }

    final middleTop = Offset(
      circleCenter.dx,
      circleCenter.dy - innerRadius - style.scaleIndicatorLength,
    );
    final bottomLeft =
        Offset(circleCenter.dx - 4, circleCenter.dy - innerRadius);
    final bottomRight =
        Offset(circleCenter.dx + 4, circleCenter.dy - innerRadius);

    final indicator = Path()
      ..moveTo(middleTop.dx, middleTop.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();

    canvas.drawPath(indicator, Paint()..color = style.scaleIndicatorColor);
  }

  @override
  bool shouldRepaint(covariant _WeightPickerPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}
