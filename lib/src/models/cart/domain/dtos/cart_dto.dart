import 'package:bisne/src/models/products/domain/entities/product_entity.dart';

class cartDTO {
  final String userId;
  final String addressToSend;
  final String date;
  final Map<Product, int> items;

  cartDTO({
    required this.addressToSend,
    required this.date,
    required this.userId,
    required this.items,
  });
}
