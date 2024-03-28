import '../../shop/export.dart';
import '../../user/export.dart';

class Facture {
  User user;
  Shop shop;
  String date;
  num totalPrice;

  Facture({
    required this.user,
    required this.shop,
    required this.date,
    required this.totalPrice,
  });
}
