import 'package:flutter/material.dart';

// BaseViewModel is an abstract class
// that will be used as a base for all view models with context parameter
// this param will work for a some operation
abstract class BaseViewModel {
  late BuildContext context;
  void setContext(BuildContext context);
}
