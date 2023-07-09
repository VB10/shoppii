import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_constants.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get currentTheme => Theme.of(context);

  AppStrings get appStrings => AppStrings.instance;
  AppConstants get appConstants => AppConstants.instance;

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;

  EdgeInsets insetsAll(double value) => EdgeInsets.all(dynamicHeight(value));
  EdgeInsets insetHorizontal(double value) =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(value));
  EdgeInsets insetVertical(double value) =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(value));
}
