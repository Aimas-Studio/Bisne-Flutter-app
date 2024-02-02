import 'package:get/get.dart';

class ShopPageController extends GetxController {
  ShopPageController();

  final int viewsCount = 1200;
  final double rate = 4.5;
  final List<String> categories = ['Alimentos'];
  final List<String> openingHours = [
    'De lunes a viernes. 7 AM - 11 PM',
    'Sábados y domingos. 10 AM - 2 PM'
  ];
  final Map<String, dynamic> contact = {
    'Teléfono': '53314213',
    'Whatsapp': '53314213',
    'Facebook': 'Chocolatería ChocoThay',
    'Instagram': 'Chocothay.cuba',
    'Enlace': 'https://www.whatsapp.com/search?q=matin%C11',
  };
  final String localitation = '29F No.7416 / 74 y 76, Playa, La Habana';
  final String name = 'ChocoThay';
  final bool mensajeria = true;
  final bool favorito = false;
  final String descripcion =
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa.";
}
