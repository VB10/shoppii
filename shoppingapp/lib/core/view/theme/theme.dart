import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xff000000),
  primaryColorLight: const Color(0xffffcccc),
  primaryColorDark: const Color(0xffFDC44A),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xffffe5e5),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xffff0000),
  hintColor: const Color(0x8a000000),
  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.only(left: 16, right: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff000000),
      secondary: Color(0xffff0000),
      surface: Color(0xffffffff),
      background: Color(0xffff9999),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Color(0xff000000),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      color: Color(0xff000000),
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      color: Color(0xff000000),
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    displayLarge: TextStyle(
      color: Color(0xff000000),
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0xdd000000),
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: Color(0xdd000000),
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    displayLarge: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    contentPadding: EdgeInsets.only(top: 12, bottom: 12),
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),
  sliderTheme: const SliderThemeData(
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xb2ffffff),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3d000000),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(),
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4),
    selectionColor: Color(0xffff9999),
    selectionHandleColor: Color(0xffff6666),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
    trackColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xffffffff)),
);
