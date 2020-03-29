import 'package:fireball/network/serializable.dart';

class ProductModel extends Serializable<ProductModel> {
  int weight;
  String sId;
  String image;
  double price;
  String title;
  double total;

  ProductModel({this.weight, this.sId, this.image, this.price, this.title});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  ProductModel fromJson(Map<String, Object> json) =>
      ProductModel.fromJson(json);
}
