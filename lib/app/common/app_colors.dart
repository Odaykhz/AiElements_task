import 'package:flutter/material.dart';

class AppColors {
  // Light Color

  static const Color primaryColor = Colors.white;
  static const Color hoverColor = Colors.black;
  static Color accentColor = parseColor('#2A813B', opacity: 1.0);
  static Color focusColor = parseColor('#339A58', opacity: 1.0);
  static Color lightGrey = parseColor('#d3d3d3', opacity: 1.0);
  // #Light Color

// Light Color
  static const Color colorDarkPrimary = Color(0xFF222831);
  static const Color colorDarkSecondary = Color(0xFF30475E);
  static const Color colorDarkThird = Color(0xFFF2A365);
  static const Color colorDarkTitle = Color(0xFFECECEC);
  // #Light Color

  // Get Started
  static const Color colorStarted = Color(0xFF274C71);
  static const Color colorStartedTitle = Color(0xFF352641);
  static const Color colorStartedDescription = Color(0xFF767676);
  static const Color colorStartedShadow = Color(0x60274C71);
  // #Get Started

  // Alert Dialog
  static const Color colorAlertDialogBack = Color(0xFFF8F7F2);
  // #Alert Dialog
  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }
}
