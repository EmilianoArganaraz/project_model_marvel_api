import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_model_test/config/resources/color_palette.dart';

// Themes
final ThemeData materialTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    scaffoldBackgroundColor: ColorPalette.primaryColor,
    accentColor: ColorPalette.red,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: ColorPalette.primaryColorLight,
      displayColor: ColorPalette.primaryColorLight,
    ),
    fontFamily: 'Roboto Slab');

const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
    primaryColor: ColorPalette.primaryColor,
    scaffoldBackgroundColor: ColorPalette.primaryBackgroundColor,
    barBackgroundColor: ColorPalette.primaryColor,
    textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(fontFamily: 'Roboto Slab')));

TextStyle comicTitle = const TextStyle(
    fontSize: 18,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
    wordSpacing: 1);
