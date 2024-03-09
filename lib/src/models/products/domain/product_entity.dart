import '../../shop/export.dart';

class Product {
  String name;
  List<String> imagesUrl;
  String description;
  String category;
  double price;
  Shop shop;

  Product(
    this.name,
    this.price,
    this.imagesUrl,
    this.description,
    this.shop,
    this.category,
  );
}
