import 'package:get/get.dart';

import '../../../products/export.dart';
import '../../infrastructure/services/get_shop_products.dart';

class InventoryPageController extends GetxController {
  static const idController = 'inventoryPageController';

  List<Product> products = [];

  InventoryPageController() {
    getProducts();
  }

  void getProducts() async {
    products = await getShopProducts();
    update([idController]);
  }

  void deleteProduct(Product product) {}
}
