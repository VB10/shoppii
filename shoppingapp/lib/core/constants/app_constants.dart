import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants _instance = AppConstants._init();
  static AppConstants get instance => _instance;
  AppConstants._init();

  static const double FREE_DELIVERY_MONEY = 40;
  static const String S_ID = 'sId';
  static const String SOCKET_URL = "http://localhost:4000";
  static const String SOCKET_CHANNEL = "product";
  static const String SOCKET_CHANNEL_DELIVERY = "product-delivery";
  var sliverGridDelegateWithFixedCrossAxisCount =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1 / 2,
    crossAxisSpacing: 10.0,
  );
}
