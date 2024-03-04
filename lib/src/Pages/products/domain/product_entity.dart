import '../../shop/export.dart';

class Product {
  String name;
  List<String> imagesUrl;
  String description;
  String category;
  num price;
  Shop shopDump;

  Product(
    this.name,
    this.price,
    this.imagesUrl,
    this.description,
    this.shopDump,
    this.category,
  );
}
