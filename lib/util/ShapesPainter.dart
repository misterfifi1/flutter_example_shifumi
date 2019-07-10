import 'package:flutter/material.dart';

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    Path path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width - 20.0, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 50.0);
    path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(20.0, 5.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);

    canvas.drawPath(path, paint);

    Path clipPath = path;
    clipPath.moveTo(25.0, 85.0);
    canvas.drawPath(clipPath, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;


}