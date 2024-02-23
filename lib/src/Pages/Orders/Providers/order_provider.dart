import '../../../core/utils/Entities/facture.dart';
import '../../../core/utils/Entities/shop.dart';

Future<List<Facture>> getShopOrdersInfo() async {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      return [
        Facture(
          ShopDump(
            "TodoPizza",
            "https://upload.wikimedia.org/wikipedia/commons/c/ce/Tuck_Shop_in_Oxford.jpg",
          ),
          "DateTime.now()",
          1120,
        ),
        Facture(
          ShopDump(
            "Legado",
            "https://www.adinainteriors.com.au/latest_projects/wp-content/uploads/2021/06/shop-design-timber.jpg",
          ),
          "DateTime.now()",
          1987,
        )
      ];
    },
  );
}
