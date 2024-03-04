import 'shop.dart';

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
