import 'package:bisne/src/models/shop/export.dart';

class Product {
  String name;
  String description;
  String imageUrl;
  String category;
  String label;
  double price;
  String rate;
  Shop shop;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.label,
    required this.price,
    required this.shop,
    required this.rate,
  });

  factory Product.fromMap(
      Map<String, dynamic> product, Shop shop, String category, String label) {
    return Product(
      name: product['nombre'],
      description: product['descripcion'],
      imageUrl: product['imageURL'] ?? '',
      category: category,
      label: label,
      price: product['precio'],
      shop: shop,
      rate: product['rate'] ?? '4.5',
    );
  }
}
