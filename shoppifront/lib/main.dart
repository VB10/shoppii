import 'package:flutter/material.dart';

import 'features/product/view/product.dart';

Future<void> main() async {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppi',
      home: ProductScreen(),
    );
  }
}
