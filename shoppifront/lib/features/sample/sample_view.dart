import 'package:flutter/material.dart';

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
          // ProductService().fetchProductList();
        },
      ),
      body: Text("wqeqweqweqweqw"),
    );
  }
}
