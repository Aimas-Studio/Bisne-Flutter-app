import '../../../core/entities/facture.dart';
import '../../../core/entities/product.dart';
import '../../../core/entities/shop.dart';

Future<Map<ProductDump, int>> getPurchases(Facture facture) async {
  Map<ProductDump, int> result = {
    ProductDump(
      "arroz",
      18,
      [
        "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="
      ],
      "description",
      ShopDump("shopName",
          "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
      "category 1",
    ): 2,
    ProductDump(
      "arroz2",
      20,
      [
        "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="
      ],
      "description",
      ShopDump("shopName",
          "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
      "category 1",
    ): 2,
  };

  return await Future.delayed(const Duration(seconds: 2), () => result);
}
