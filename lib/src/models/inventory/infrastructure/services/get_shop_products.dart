import 'dart:async';

import '../../../products/export.dart';
import '../../../shop/export.dart';

final Shop shop = Shop(
  manageId: 1,
  municipality: "La Habana",
  region: "Playa",
  id: '1',
  name: 'Tienda de ropa',
  description: 'Ropa de moda para hombres y mujeres',
  imageUrl:
      'https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_467,q_75,w_700/https://assets.simpleviewcms.com/simpleview/image/upload/v1/clients/houston/e61b3808_19d3_45dc_bd74_cf9fd942946c_5c324e81-ba30-466f-8c6c-e653a1bf6db1.jpg',
  category: 'Ropa',
  openingHours: '',
);

Future<List<Product>> getShopProducts() {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      Product(
          name: 'Bombones de Fresa',
          description:
              "Simplemente una descripcion extensa para que se vea bonito",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
          price: 1222.0,
          category: 'chocolate',
          label: 'et',
          rate: "4.5",
          shop: shop),
      Product(
          name: 'Bombones de Fresa',
          description:
              "Simplemente una descripcion extensa para que se vea bonito",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
          price: 1222.0,
          category: 'chocolate',
          label: 'et',
          rate: "3.5",
          shop: shop),
      Product(
          name: 'Bombones de Fresa',
          description:
              "Simplemente una descripcion extensa para que se vea bonito",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
          price: 1222.0,
          category: 'chocolate',
          label: 'et',
          rate: "5",
          shop: shop),
      Product(
          name: 'Bombones de Fresa',
          description:
              "Simplemente una descripcion extensa para que se vea bonito",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
          price: 1222.0,
          category: 'chocolate',
          label: 'et',
          rate: "1.5",
          shop: shop),
      Product(
          name: 'Bombones de Fresa',
          description:
              "Simplemente una descripcion extensa para que se vea bonito",
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
          price: 1222.0,
          category: 'chocolate',
          label: 'et',
          rate: "4.5",
          shop: shop)
    ];
  });
}
