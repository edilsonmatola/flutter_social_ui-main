import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 4 * size.height / 5);
    /* Ponto de Partida */
    final curvePoint = Offset(size.width / 2, size.height);
    /* End Point */
    final endPoint = Offset(size.width, 4 * size.height / 5);

    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    /* We won't use this, so we return false! */
    return false;
  }
}
