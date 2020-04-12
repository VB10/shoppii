import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  double dynamicHeight({@required BuildContext context, @required double val}) {
    return MediaQuery.of(context).size.height * val;
  }

  double dynamicWidth({@required BuildContext context, @required double val}) {
    return MediaQuery.of(context).size.width * val;
  }

  TextTheme currentTextTheme(BuildContext context) =>
      Theme.of(context).textTheme;
  TextTheme currentPrimaryTextTheme(BuildContext context) =>
      Theme.of(context).primaryTextTheme;

  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
}
