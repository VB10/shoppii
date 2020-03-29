import 'package:flutter/material.dart';
import 'package:shoppifront/features/product/model/product.dart';
import './product_view_model.dart';

class ProductView extends ProductViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: FutureBuilder<List<ProductModel>>(
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
      ),
    );
  }

  ListView buildListViewWidget(List<ProductModel> data) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(data[index].title),
          subtitle: Text("${data[index].weight}g  Total: ${data[index].total}"),
          leading: Image.network(data[index].image),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => showProductSheet(index),
          ),
        ),
      ),
      itemCount: data.length,
    );
  }
}
