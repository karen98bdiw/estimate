import 'package:flutter/material.dart';

class IntroScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 200);
    path.quadraticBezierTo(size.width - size.width / 4,
        size.height - size.height / 4, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
