class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? image;
  DateTime? createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    this.createdAt
  });

  Map<String,dynamic> toSupa(){
    return {
      'id':id,
      'name':name,
      'price':price,
      'description':description,
      'images':image,
      'created_at':createdAt
    };
  }
}
