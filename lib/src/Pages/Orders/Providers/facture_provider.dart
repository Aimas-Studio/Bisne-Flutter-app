import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/Entities/shop.dart';

Future<Map<ProductDump, int>> getPurchases() async {
  Map<ProductDump, int> result = {
    ProductDump("arroz", 18, "imageUrl", ShopDump("shopName", "imageUrl")): 2,
    ProductDump("arroz", 18, "imageUrl", ShopDump("shopName", "imageUrl")): 2,
  };

  return await Future.delayed(const Duration(seconds: 2), () => result);
}
