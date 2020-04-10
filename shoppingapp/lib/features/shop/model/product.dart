import 'package:shoppingapp/core/service/base_model.dart';

class Product extends BaseModel {
  String image;
  double price;
  String title;
  String sId;
  int weight;
  int count;
  int total;

  Product(
      {this.image,
      this.price,
      this.title,
      this.weight,
      this.count = 0,
      this.total = 999});

  Product.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    sId = json['_id'];
    image = json['image'];
    price = double.tryParse(json['price'].toString()) ??
        int.tryParse(json['price']).toDouble();
    title = json['title'];
    total = json['total'] ?? 5;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['price'] = this.price;
    data['title'] = this.title;
    data['total'] = this.total;
    return data;
  }

  @override
  Product fromJson(Map<String, Object> json) => Product.fromJson(json);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product && o.title == title;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        price.hashCode ^
        title.hashCode ^
        sId.hashCode ^
        weight.hashCode ^
        count.hashCode ^
        total.hashCode;
  }
}

// List<Product> dummyList = [
//   Product(
//       image: "https://kz.all.biz/img/kz/catalog/1316296.png",
//       price: 7.77,
//       title: "Macaroni of the Granoro n Spaghetti. 16 Capellini buy in Almaty",
//       total: 10,
//       weight: 500),
//   Product(
//       image:
//           "https://sc02.alicdn.com/kf/UTB8NueHviDEXKJk43Oq763z3XXa9/931808589/UTB8NueHviDEXKJk43Oq763z3XXa9.png",
//       price: 11.27,
//       title:
//           "Italian Pasta,Granoro Penne Rigate N. 26 - Buy Italian Pasta Penne Rigate,Pasta,Italian Pasta Brands Product on Alibaba.com",
//       total: 10,
//       weight: 500),
//   Product(
//       image: "https://sc02.alicdn.com/kf/UTB8v66ouo_4iuJk43Fq762.FpXa9.png",
//       price: 7.74,
//       title:
//           "Italian Pasta,Granoro Nest Shaped Fettuccine - Buy Italian Pasta Brands,Italian Fettuccine,Italian Pasta Product on Alibaba.com",
//       total: 10,
//       weight: 500),
//   Product(
//       image:
//           "https://www.granoro.it/Contents/Images/20190110111627_42mezzigomiti_iclassici_cuscino.png",
//       price: 5.27,
//       title: "Short pasta | GRANORO - IL PRIMO",
//       total: 10,
//       weight: 500)
// ];

// Product singleModel = Product(
//     image:
//         "https://cdn.shopify.com/s/files/1/2786/0986/products/granoro-spaghetti-tagliati-n68-the-italian-shop-free-delivery_580x.png?v=1548429175",
//     price: 1.19,
//     title: "Granoro -Spaghetti Tagliati - N.68",
//     total: 10,
//     weight: 500);
