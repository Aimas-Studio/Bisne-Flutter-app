import '../../../../core/entities/product.dart';
import '../../../shop/export.dart';
import '../../domain/facture_entity.dart';

Future<Map<ProductDump, int>> getPurchases(Facture facture) async {
  Map<ProductDump, int> result = {};

  return await Future.delayed(const Duration(seconds: 2), () => result);
}

Future<List<Facture>> getShopOrdersInfo() async {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      return [
        Facture(
          Shop(
            id: 1,
            shopName: "TodoPizza",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/c/ce/Tuck_Shop_in_Oxford.jpg",
            shopDescription: "Vendemos Pizza Pikete",
          ),
          "DateTime.now()",
          1120,
        ),
        Facture(
          Shop(
            id: 2,
            shopName: "Legado",
            imageUrl:
                "https://www.adinainteriors.com.au/latest_projects/wp-content/uploads/2021/06/shop-design-timber.jpg",
            shopDescription: "asdjaksdjsd",
          ),
          "DateTime.now()",
          1987,
        )
      ];
    },
  );
}
