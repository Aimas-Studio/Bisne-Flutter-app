import 'package:bisne/src/models/shop/export.dart';

class Product {
  String name;
  String description;
  String imageUrl;
  double price;
  String rate;
  Shop shop;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.shop,
    required this.rate,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['nombre'],
      description: map['descripcion'],
      imageUrl: map['imageURL'] ?? '',
      price: map['precio'],
      shop: map['tienda'],
      rate: map['rate'],
    );
  }
}
