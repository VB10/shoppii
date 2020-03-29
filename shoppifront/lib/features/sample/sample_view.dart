import 'package:flutter/material.dart';
import 'package:shoppifront/features/product/service/product_service.dart';

class SampleView extends StatefulWidget {
  @override
  _SampleViewState createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Bune tantana");
          ProductService().fetchProductList();
        },
      ),
      body: Text("wqeqweqweqweqw"),
    );
  }
}
