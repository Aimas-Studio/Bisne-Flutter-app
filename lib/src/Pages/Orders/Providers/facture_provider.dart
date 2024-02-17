import 'package:bisne/src/Utils/Entities/facture.dart';
import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/Entities/shop.dart';

Future<Map<ProductDump, int>> getPurchases(Facture facture) async {
  Map<ProductDump, int> result = {
    ProductDump(
      "arroz",
      18,
      ["imageUrl"],
      "description",
      ShopDump("shopName", "imageUrl"),
      "category 1",
    ): 2,
    ProductDump(
      "arroz",
      18,
      ["imageUrl"],
      "description",
      ShopDump("shopName", "imageUrl"),
      "category 2",
    ): 2,
  };

  return await Future.delayed(const Duration(seconds: 2), () => result);
}
