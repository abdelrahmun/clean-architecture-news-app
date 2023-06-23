import 'dart:ui' as ui;

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


class CustomRectangleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.1279930,size.height*0.05585478);
    path_0.lineTo(size.width*0.9981357,size.height*0.05485737);
    path_0.lineTo(size.width,size.height*1.054857);
    path_0.lineTo(0,size.height*1.052264);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0f1737).withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}