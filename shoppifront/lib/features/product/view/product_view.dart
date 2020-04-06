import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppifront/features/product/model/product.dart';
import './product_view_model.dart';
import 'fields/create_product_view.dart';

class ProductView extends ProductViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Product List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => CreateProductView(
              onComplete: (model) => onCompleteForm(model),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: buildFutureBuilder(),
    );
  }

  FutureBuilder<List<ProductModel>> buildFutureBuilder() {
    return FutureBuilder<List<ProductModel>>(
      future: fetchAllDatas(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) return buildListViewWidget(snapshot.data);
            return Text("error");
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget get addMenuWidget => Card(
        margin: EdgeInsets.all(15),
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(dynamicHeight(0.05)),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Product Title",
                  icon: Icon(Icons.text_fields),
                ),
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Product Image")),
              TextFormField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(hintText: "Product Price")),
              FloatingActionButton.extended(
                  onPressed: () {}, label: Text("Save"))
            ],
          ),
        ),
      );

  ListView buildListViewWidget(List<ProductModel> data) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(data[index].title),
          subtitle: Text("${data[index].weight}g  Total: ${data[index].total}"),
          leading: Image.network(data[index].image),
          trailing: IconButton(
              icon: Icon(Icons.edit), onPressed: () => showProductSheet(index)),
        ),
      ),
      itemCount: data.length,
    );
  }
}
