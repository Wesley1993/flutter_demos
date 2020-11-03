/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/3 15:06
/// Email: 1124700977@qq.com
/// Des:
import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    var height = 30.0;
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height); //第2个点
    path.lineTo(size.width, size.height); //第3个点
    path.lineTo(size.width, height); //第4个点
    path.lineTo(size.width / 5 * 3, height);
    var controPoint = Offset(size.width / 2, 0);
    var endPoint = Offset(size.width / 5 * 2, height);
    path.quadraticBezierTo(
        controPoint.dx, controPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width / 5 * 2, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
