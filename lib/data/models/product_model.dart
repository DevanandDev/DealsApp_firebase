class ProductModel {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final List<String> image;
  final DateTime? createdAt;

  ProductModel({
     this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    this.createdAt
  });

  Map<String,dynamic> toSupa(){
    return {
    if(id != null)  'id':id,
      'name':name,
      'price':price,
      'description':description,
      'images':image,
      'created_at':(createdAt ?? DateTime.now().toIso8601String())
    };
  }
}
