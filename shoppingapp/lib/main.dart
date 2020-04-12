import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/view/theme/theme.dart';
import 'features/notifier/product_list_notifier.dart';
import 'features/shop/view/shop_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductListNotifier()),
      ],
      child: MaterialApp(
        theme: myTheme,
        home: ShopView(),
      ),
    );
  }
}
