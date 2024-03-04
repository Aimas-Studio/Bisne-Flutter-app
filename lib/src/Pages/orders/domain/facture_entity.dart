import '../../shop/export.dart';

class Facture {
  Shop shop;
  String date;
  num totalPrice;

  Facture(this.shop, this.date, this.totalPrice);
}
