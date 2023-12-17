import 'dart:math';

import 'package:flutter/material.dart';

class DottedBorder extends CustomPainter {
  DottedBorder({
    required this.borderColor,
    this.numberOfCurves = 11,
    this.spaceLength = 9,
  });

  final int numberOfCurves;
  final int spaceLength;
  final Color borderColor;

  static const _fullCircleDegree = 360;
  static const _halfCircleDegree = 180;
  static const _strokeWidth = 2.0;
  static const _zeroValue = 0.0;

  double _startOfArcInDegree = 0;

  @override
  bool shouldRepaint(DottedBorder oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var arcLength =
        (_fullCircleDegree - (numberOfCurves * spaceLength)) / numberOfCurves;

    if (arcLength <= 0) {
      arcLength = _fullCircleDegree / spaceLength - 1;
    }

    var rect = Rect.fromLTWH(
      _zeroValue,
      _zeroValue,
      size.width,
      size.height,
    );

    for (var i = 0; i < numberOfCurves; i++) {
      canvas.drawArc(
        rect,
        inRads(_startOfArcInDegree),
        inRads(arcLength),
        false,
        Paint()
          ..color = borderColor
          ..strokeWidth = _strokeWidth
          ..style = PaintingStyle.stroke,
      );

      _startOfArcInDegree += arcLength + spaceLength;
    }
  }

  double inRads(double degree) {
    return (degree * pi) / _halfCircleDegree;
  }
}
