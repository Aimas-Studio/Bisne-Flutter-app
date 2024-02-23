import '../../../core/entities/notification.dart';
import '../../../core/entities/shop.dart';

Future<List<AppNotification>> getNotifications() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppNotification(
          ShopDump("Clary",
              "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 1",
          "Yesterday"),
      AppNotification(
          ShopDump("Coly",
              "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 2",
          "7:35"),
    ];
  });
}
