import '../../../../core/entities/notification.dart';
import '../../../shop/export.dart';

Future<List<AppNotification>> getNotifications() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppNotification(
          Shop(
              shopName: "Clary",
              shopDescription: "Vendemos Pizza Pikete",
              id: 5,
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 1",
          "Yesterday"),
      AppNotification(
          Shop(
              shopName: "Coly",
              id: 6,
              shopDescription: 'asdjasd',
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 2",
          "7:35"),
    ];
  });
}
