import 'package:energy/app/data/resources/color_resources.dart';
import 'package:flutter/material.dart';

class Themes {
  //! LIGHT THEME DATA
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: WHITE,
    backgroundColor: WHITE,
    primaryColor: APP_MAIN_BLUE,
    primaryColorLight: APP_MAIN_BLUE,
    splashColor: WHITE,
    disabledColor: Colors.grey[500],
    highlightColor: WHITE,
    hintColor: Colors.black,
    //
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),

    snackBarTheme: const SnackBarThemeData(
        backgroundColor: APP_DARK_GREY,
        elevation: 4,
        contentTextStyle: TextStyle(
            fontFamily: 'Brandon',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20)),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: APP_DARK_GREY,
        // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        // side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: APP_MAIN_BLUE, elevation: 4),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: 'Brandon',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      backgroundColor: Colors.transparent, //mainLIGHTAPPBARcolor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    dividerTheme: const DividerThemeData(thickness: 2, color: INPUT_FIELD_GREY),
    chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade500,
        disabledColor: Colors.grey.shade700,
        selectedColor: APP_MAIN_BLUE,
        secondarySelectedColor: WHITE,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        brightness: Brightness.light,
        labelStyle: const TextStyle(
          fontFamily: 'Brandon',
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        secondaryLabelStyle:
            const TextStyle(fontFamily: 'Brandon', fontWeight: FontWeight.w500),
        elevation: 4),

// ! input decoration
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      labelStyle: TextStyle(
          color: TEXT_HEADING, fontWeight: FontWeight.bold, fontSize: 20),
      errorMaxLines: 3,
      errorBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      errorStyle: TextStyle(
          fontWeight: FontWeight.w200,
          fontFamily: 'Brandon',
          color: Colors.red,
          fontSize: 17),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: APP_MAIN_BLUE,
        ),
      ),
      border: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: APP_DARK_GREY,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: Colors.transparent,
        ),
      ),
    ),

    textTheme: TextTheme(
      headline1: const TextStyle().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: TEXT_HEADING,
          fontFamily: 'Brandon'),
      headline2: const TextStyle().copyWith(
          color: TEXT_HEADING,
          // fontWeight: FontWeight.bold,
          fontFamily: 'Brandon',
          fontSize: 24),
      headline3: const TextStyle().copyWith(
          fontFamily: 'Brandon',
          color: TEXT_HEADING,
          // fontWeight: FontWeight.bold,
          fontSize: 20),
      headline4: const TextStyle().copyWith(
          color: TEXT_HEADING,
          // fontWeight: FontWeight.bold,
          fontFamily: 'Brandon',
          fontSize: 14),
      caption:
          const TextStyle().copyWith(color: Colors.grey.shade500, fontSize: 12),
    ).apply(
      bodyColor: Colors.black,
      fontFamily: 'Brandon',
    ),
  );
}
