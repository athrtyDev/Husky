import 'package:flutter/material.dart';

class Styles {
  Styles._();

  // color
  static const Color baseColor = const Color(0xff1679D5);
  static Color baseColor10 = const Color(0xff1679D5).withOpacity(0.1);
  static const Color textColor = const Color(0xFF003566);
  static Color textColor5 = const Color(0xFF003566).withOpacity(0.05);
  static Color textColor10 = const Color(0xFF003566).withOpacity(0.1);
  static Color textColor30 = const Color(0xFF003566).withOpacity(0.3);
  static Color textColor50 = const Color(0xFF003566).withOpacity(0.5);
  static Color textColor70 = const Color(0xFF003566).withOpacity(0.7);
  static const Color whiteColor = const Color(0xffFFFFFF);
  static Color whiteColor5 = const Color(0xffFFFFFF).withOpacity(0.05);
  static Color whiteColor10 = const Color(0xffFFFFFF).withOpacity(0.1);
  static Color whiteColor70 = const Color(0xffFFFFFF).withOpacity(0.7);
  static const Color blackColor = const Color(0xff000000);
  static const Color greyColor = const Color(0xFFF0F3F5);
  static const Color orangeColor = const Color(0xfff0573b);
  static const Color yellowColor = const Color(0xffFBBC04);
  static Color orangeColor5 = const Color(0xfff0573b).withOpacity(0.05);
  static const Color greenColor = const Color(0xff34A853);

  // gradient
  static Gradient baseGradient = LinearGradient(
    colors: [
      const Color(0xFF003566),
      const Color(0xFF1679D5),
    ],
    stops: [0.0, 1.0],
  );
  static Gradient baseGradient90 = LinearGradient(
    colors: [
      const Color(0xFF003566).withOpacity(0.9),
      const Color(0xFF1679D5).withOpacity(0.9),
    ],
    stops: [0.0, 1.0],
  );

  static BoxDecoration myBoxDecoration = BoxDecoration(borderRadius: BorderRadius.circular(5), color: baseColor10);

  // FontWeight
  static const FontWeight wNormal = FontWeight.w300;
  static const FontWeight wSemiBold = FontWeight.w600;
  static const FontWeight wBold = FontWeight.w700;

  // FontSize
  // only use it with Responsive flutter
  static const double xlarge = 20;
  static const double large = 15;
  static const double medium = 12;
  static const double small = 10;
}
