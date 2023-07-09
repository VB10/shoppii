import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  double dynamicHeight({required BuildContext context, required double value}) {
    return MediaQuery.of(context).size.height * value;
  }

  double dynamicWidth({required BuildContext context, required double value}) {
    return MediaQuery.of(context).size.width * value;
  }

  TextTheme currentTextTheme(BuildContext context) =>
      Theme.of(context).textTheme;
  TextTheme currentPrimaryTextTheme(BuildContext context) =>
      Theme.of(context).primaryTextTheme;

  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
}
