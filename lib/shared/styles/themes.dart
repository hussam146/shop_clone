
import 'package:shop_clone/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData? lightMode = ThemeData(
    primarySwatch: defaultColor, //blue
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white),
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Zen Kaku Gothic New'),
      bodyText2: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Zen Kaku Gothic New'),
      subtitle1: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Zen Kaku Gothic New',
          height: 1.3),
    ),
    fontFamily: 'Zen Kaku Gothic New');

ThemeData? darkMode = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor('333739'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: HexColor('333739')),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: HexColor('333739'),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'Zen Kaku Gothic New'),
      bodyText2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'Zen Kaku Gothic New'),
      subtitle1: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'Zen Kaku Gothic New',
          height: 1.3),
    ),
    fontFamily: 'Zen Kaku Gothic New');