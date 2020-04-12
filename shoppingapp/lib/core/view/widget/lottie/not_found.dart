import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp/core/constants/app_image_constants.dart';

class NotFoundLottie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ImagePath.instance.notFoundLottie);
  }
}
