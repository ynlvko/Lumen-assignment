import 'dart:math' as Math;

import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.maxIndex,
    required this.data,
  });

  final int maxIndex;
  final List<double> data;

  @override
  void paint(Canvas canvas, Size size) {
    _drawLines(canvas, size);
    _drawGraph(canvas, size);
  }

  void _drawLines(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;

    final leftCenter = Offset(0, size.height / 2.0);
    final rightCenter = Offset(size.width, size.height / 2.0);
    canvas.drawLine(leftCenter, rightCenter, paint);

    final topCenter = Offset(size.width / 2.0, 0);
    final bottomCenter = Offset(size.width / 2.0, size.height);
    canvas.drawLine(topCenter, bottomCenter, paint);
  }

  void _drawGraph(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.purple;
    final vCenter = size.height / 2.0;
    final maxValue = data.map((e) => e.abs()).reduce(Math.max);
    var i = 0;

    final maxElements = maxIndex == 0 ? 2 : maxIndex;
    data.take(maxElements).reduce((prev, current) {
      final start = Offset(i * 2, vCenter - (prev * vCenter / maxValue));
      final end = Offset(++i * 2.0, vCenter - (current * vCenter / maxValue));
      canvas.drawLine(start, end, paint);
      return current;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
