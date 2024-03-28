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
  bool isFavorite;
  String id;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.label,
    required this.price,
    required this.shop,
    required this.rate,
    required this.isFavorite,
    required this.id,
  });

  factory Product.fromMap(Map<String, dynamic> product, Shop shop,
      String category, String label, bool isFavorite) {
    return Product(
      id: product['id'],
      name: product['nombre'],
      description: product['descripcion'] ?? '',
      imageUrl: product['imageURL'] ?? '',
      category: category,
      label: label,
      price: product['precio'].toDouble(),
      shop: shop,
      rate: product['rate'] ?? '4.5',
      isFavorite: isFavorite,
    );
  }
}
