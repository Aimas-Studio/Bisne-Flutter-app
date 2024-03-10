import '../../../products/export.dart';
import '../../../shop/export.dart';
import '../../domain/facture_entity.dart';

Future<Map<Product, int>> getPurchases(Facture facture) async {
  Map<Product, int> result = {};

  return await Future.delayed(const Duration(seconds: 2), () => result);
}

Future<List<Facture>> getShopOrdersInfo() async {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      return [
        Facture(
          shop: Shop(
            id: 1,
            shopName: "TodoPizza",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/c/ce/Tuck_Shop_in_Oxford.jpg",
            shopDescription: "Vendemos Pizza Pikete",
          ),
          date: "DateTime.now()",
          totalPrice: 1120,
        ),
        Facture(
          shop: Shop(
            id: 2,
            shopName: "Legado",
            imageUrl:
                "https://www.adinainteriors.com.au/latest_projects/wp-content/uploads/2021/06/shop-design-timber.jpg",
            shopDescription: "asdjaksdjsd",
          ),
          date: "DateTime.now()",
          totalPrice: 1987,
        )
      ];
    },
  );
}