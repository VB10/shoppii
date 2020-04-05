import '../../../core/service/base_model.dart';

class ProductModel extends BaseModel<ProductModel> {
  double weight;
  String sId;
  String image;
  double price;
  String title;
  double total;

  ProductModel(
      {this.weight, this.sId, this.image, this.price, this.title, this.total});

  ProductModel.fromJson(Map<String, dynamic> json) {
    weight = json['weight'].toDouble();
    sId = json['_id'];
    image = json['image'];
    price = json['price'].toDouble();
    title = json['title'];
    total = json['total'].toDouble() ?? 5;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
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
