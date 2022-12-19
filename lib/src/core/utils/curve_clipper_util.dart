import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 4 * size.height / 5);
    final curvePoint1 = Offset(size.width / 4, size.height);
    final centerPoint = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      curvePoint1.dy,
    );

    final curvePoint2 = Offset(4 * size.width / 5, 4 * size.height / 5);
    final endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
