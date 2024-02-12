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
  String imageUrl;
  String description;
  num price;
  ShopDump shopDump;
  ProductDump(
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.shopDump,
  );
}
