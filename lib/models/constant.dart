import 'package:flutter/material.dart';

const kmainColor =  Color(0xFFB23F3F);
const ksecondaryColor = Color(0xffffffff);
const kmainButtonColor = Color(0xFFB23F3F);
const ksecondButtoncolor = Color(0xffffffff);
const kmainTextColor = Color(0xffffffff);
const ksecondaryTextColor = Color(0xFFB23F3F);
const kbackgroundColor = Color(0xFFB23F3F);
const ksecondBackgroundColor = Color(0xffffffff);
String kfontFamily = "colfax";
const kcontainerColor = Color.fromARGB(255, 225, 243, 233);


class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFFB23F3F);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}



class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}