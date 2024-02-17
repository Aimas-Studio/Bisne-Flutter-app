import 'shop.dart';

class Product {
  int id;
  String name;
  String description;
  num price;
  Product(this.id, this.name, this.description, this.price);
}

class ProductDump {
  String name;
  List<String> imagesUrl;
  String description;
  String category;
  num price;
  ShopDump shopDump;
  ProductDump(
    this.name,
    this.price,
    this.imagesUrl,
    this.description,
    this.shopDump,
    this.category,
  );
}
