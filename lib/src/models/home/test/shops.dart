import 'package:bisne/src/models/shop/domain/entities/shop_entity.dart';

import '../../products/export.dart';

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

final Shop shop2 = Shop(
  manageId: 1,
  municipality: "La Habana",
  region: "Playa",
  id: '1',
  name: 'Gremiio',
  description:
      'Ropa de moda para hombres y mujeres con una descipcion muyyyyy larga para ver como se desarrolla esto',
  imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj-MfK9Ddla1r5m4GCGf5gG4aitjf2aEZKUnAYR636BrVlSFtT4mh5g1on1M47s84tQGI&usqp=CAU',
  category: 'Ropa',
  openingHours: '',
);
final Shop shop3 = Shop(
  manageId: 1,
  municipality: "La Habana",
  region: "Playa",
  id: '1',
  name: 'MATCOM',
  description: 'Descripcion corta',
  imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBqt9hlTmC4jfimAhqRbZ_PAzImTb3mN9-lSbplj3nQe9A-VPDwJxRQQiYBlz-gXDHm4&usqp=CAU',
  category: 'Escuela',
  openingHours: '',
);

final Shop shop4 = Shop(
  manageId: 1,
  municipality: "La Habana",
  region: "Playa",
  id: '1',
  name: 'AIMAS',
  description:
      'Ropa de moda para hombres y mujeres con una descipcion muyyyyy larga para ver como se desarrolla esto y ver si se corta o no',
  imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSsYR8BYkcII42oRMJc0k8OWjxr50yCUznfZcsfIsFu9SWAB2fcAJsYUXk--xPVZi6i2Q&usqp=CAU',
  category: 'Ropa',
  openingHours: '',
);

final Shop shop5 = Shop(
  manageId: 1,
  municipality: "La Habana",
  region: "Playa",
  id: '1',
  name: 'ChocoThay',
  description: 'Tienda de bombones y chocolates',
  imageUrl:
      'https://washington.org/sites/default/files/styles/generic_hero_banner_1440_x_600/public/2020-12/Georgetown_Shopping_Friends_Just_Paper.jpg.webp?itok=15-gjIpk',
  category: 'Ropa',
  openingHours: '',
);
final List<Shop> shops = [shop, shop2, shop3, shop4, shop5];

final Product product = Product(
    id: "",
    name: 'Bombones de Fresa',
    isFavorite: false,
    description: "Simplemente una descripcion extensa para que se vea bonito",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
    price: 1222.0,
    category: 'chocolate',
    label: 'et',
    rate: "4.5",
    shop: shop);

final Product product2 = Product(
    id: "",
    name: 'Bombones de Fresa',
    isFavorite: false,
    description: "Simplemente una descripcion extensa para que se vea bonito",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
    price: 1222.0,
    category: 'chocolate',
    label: 'et',
    rate: "3.5",
    shop: shop);

final Product product3 = Product(
    id: "",
    name: 'Bombones de Fresa',
    isFavorite: false,
    description: "Simplemente una descripcion extensa para que se vea bonito",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
    price: 1222.0,
    category: 'chocolate',
    label: 'et',
    rate: "5",
    shop: shop);

final Product product4 = Product(
    id: "",
    name: 'Bombones de Fresa',
    isFavorite: false,
    description: "Simplemente una descripcion extensa para que se vea bonito",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
    price: 1222.0,
    category: 'chocolate',
    label: 'et',
    rate: "1.5",
    shop: shop);

final Product product5 = Product(
    id: "",
    name: 'Bombones de Fresa',
    isFavorite: false,
    description: "Simplemente una descripcion extensa para que se vea bonito",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU18wOCm2A3H7tPKlDElcUDxJwOmp61ppz_g&usqp=CAU",
    price: 1222.0,
    category: 'chocolate',
    label: 'et',
    rate: "4.5",
    shop: shop);

final List<Product> products = [
  product,
  product2,
  product3,
  product4,
  product5
];
