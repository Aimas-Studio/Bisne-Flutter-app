import '../../shop/export.dart';

class Facture {
  Shop shop;
  String date;
  num totalPrice;

  Facture({
    required this.shop,
    required this.date,
    required this.totalPrice,
  });
}
