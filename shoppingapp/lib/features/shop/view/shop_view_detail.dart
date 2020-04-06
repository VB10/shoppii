import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';
import 'package:shoppingapp/core/view/widget/container/empty_widget.dart';
import 'package:shoppingapp/features/notifier/product_list_notifier.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/view/widget/button/circle_button.dart';
import '../../../core/view/widget/picker/number_picker.dart';
import '../model/product.dart';

class ShopDetailView extends BaseStatelessWidget {
  final Product data;
  final int index;

  ShopDetailView({Key key, this.data, this.index});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      bottomNavigationBar: buildBottomSafeArea(context, textTheme, colorScheme),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: dynamicWidth(context: context, val: 0.1)),
        children: <Widget>[
          buildHeroImage(),
          emptyWidget,
          buildTitleText(context, colorScheme),
          emptyWidget,
          buildWeightText(textTheme),
          emptyWidget,
          buildCounterAndPriceCard(textTheme, colorScheme),
          emptyWidget,
          buildSubTitleText(textTheme, colorScheme),
          emptyWidget,
          lipsumGenerator(textTheme),
        ],
      ),
    );
  }

  EdgeInsetsGeometry _padding(BuildContext context) => EdgeInsets.symmetric(
      horizontal: dynamicWidth(context: context, val: 0.1));

  Widget get emptyWidget => EmptyHeightWidget(
        val: 0.02,
      );

  SafeArea buildBottomSafeArea(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return SafeArea(
      child: Container(
          padding: _padding(context),
          color: Colors.white70,
          child: buildBottomNavigationBar(context, textTheme, colorScheme)),
    );
  }

  Widget buildHeroAddToCard(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return FloatingActionButton.extended(
      heroTag: AppStrings.instance.subHeroTag(index),
      backgroundColor: Theme.of(context).primaryColorDark,
      onPressed: () {
        Provider.of<ProductListNotifier>(context, listen: false)
            .addProduct(data);
        Navigator.of(context).pop();
      },
      label: Text(
        AppStrings.instance.addToCard,
        style: textTheme.headline4.copyWith(
            fontWeight: FontWeight.bold, color: colorScheme.onSurface),
      ),
    );
  }

  Widget buildBottomNavigationBar(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleIconButton(),
        Expanded(
          child: buildHeroAddToCard(context, textTheme, colorScheme),
        )
      ],
    );
  }

  Text lipsumGenerator(TextTheme textTheme) {
    return Text(lipsum.createParagraph(numParagraphs: 3),
        style: textTheme.headline4);
  }

  Text buildSubTitleText(TextTheme textTheme, ColorScheme colorScheme) {
    return Text(
      AppStrings.instance.aboutProduct,
      style: textTheme.headline3
          .copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
      maxLines: 2,
    );
  }

  Row buildCounterAndPriceCard(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        NumberPicker(
          number: data.count,
          onChanged: (value) {
            data.count = value;
          },
        ),
        Text(
          "\$${data.price.toString()}",
          style: textTheme.headline1.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Text buildWeightText(TextTheme textTheme) {
    return Text(
      "${data.weight.toInt().toString()} g",
      style: textTheme.headline4,
    );
  }

  Text buildTitleText(BuildContext context, ColorScheme colorScheme) {
    return Text(
      data.title,
      style: currentTextTheme(context)
          .headline1
          .copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
    );
  }

  Hero buildHeroImage() {
    return Hero(
      tag: AppStrings.instance.listHeroTag(index),
      child: AspectRatio(aspectRatio: 1, child: Image.network(data.image)),
    );
  }
}
