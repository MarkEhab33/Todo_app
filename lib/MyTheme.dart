import 'package:flutter/material.dart';

class MyTheme{
static Color primaryLightColor = Color(0xFF5D9CEC);
static Color whiteColor = Colors.white;
static Color greenColor = Color(0xFF61E757);
static Color redColor = Color(0xFFEC4B4B);
static Color blackColor = Color(0xFF363636);
static Color backGroundColorLight = Color(0xFFDFECDB);
static Color greyColor = Color(0xFFC8C9CB);

static Color primaryDarkColor  = Color(0xFF060E1E);

static ThemeData lightTheme=ThemeData(
  primaryColor: primaryLightColor,
  appBarTheme: AppBarTheme(backgroundColor: primaryLightColor,
    elevation: 0,

  ),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: whiteColor,
    ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      subtitle2 : TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      bodyText1: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryLightColor,
  )

  ),
scaffoldBackgroundColor: backGroundColorLight,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryLightColor,
     backgroundColor: Colors.transparent,
    elevation: 0
  )
);


}