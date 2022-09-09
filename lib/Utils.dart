import 'package:flutter/material.dart';

class Utils extends StatefulWidget {
  const Utils({Key? key}) : super(key: key);

  @override
  State<Utils> createState() => _UtilsState();
}

class _UtilsState extends State<Utils> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWith(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class AppColors {

  AppColors._();
  static const Color PurpleBlue = Color(0xFF0C14A4);
  static const Color PrettyBlue = Color(0xFF1f68a4);
  static const Color Fondo = Color(0xFFf4f4f4);
}

