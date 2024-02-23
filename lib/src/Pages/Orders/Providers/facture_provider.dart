import '../../../core/Utils/Entities/facture.dart';
import '../../../core/Utils/Entities/product.dart';
import '../../../core/Utils/Entities/shop.dart';

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
