// @dart=2.9

import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getVerticalPercent(context, 23.5),
      child: ClipPath(
        clipper: Myclipper(),
        child: Image.asset("assets/Chevron.jpg", fit: BoxFit.cover),
      ),
    );
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    var w = s.width;
    var h = s.height;
    var p = Path();

    p.lineTo(0.0, h - h * 0.27);
    setPath(w * 0.5, h * 1.2649, w, h * 0.73, p);
    p.lineTo(w, 0.0);
    p.close();
    return p;
  }

  bool shouldReclip(oc) => true;
}

setPath(dx1, dy1, dx2, dy2, p) {
  p.quadraticBezierTo(dx1, dy1, dx2, dy2);
}
