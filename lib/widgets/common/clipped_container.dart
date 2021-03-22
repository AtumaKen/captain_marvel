import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper<Path> {
  final double height;
  final double width;
  final double slant;

  CustomClipPath(this.height, this.width, this.slant);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, height);//L
    path.lineTo(width, slant);
    path.lineTo(width,0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}