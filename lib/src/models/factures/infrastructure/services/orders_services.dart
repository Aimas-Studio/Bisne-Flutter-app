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
            manageId: 1,
            municipality: "La Habana",
            region: "Playa",
            id: '1',
            name: "TodoPizza",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/c/ce/Tuck_Shop_in_Oxford.jpg",
            description: "Vendemos Pizza Pikete",
          ),
          date: "DateTime.now()",
          totalPrice: 1120,
        ),
        Facture(
          shop: Shop(
            manageId: 1,
            municipality: "La Habana",
            region: "Playa",
            id: '2',
            name: "Legado",
            imageUrl:
                "https://www.adinainteriors.com.au/latest_projects/wp-content/uploads/2021/06/shop-design-timber.jpg",
            description: "asdjaksdjsd",
          ),
          date: "DateTime.now()",
          totalPrice: 1987,
        )
      ];
    },
  );
}
