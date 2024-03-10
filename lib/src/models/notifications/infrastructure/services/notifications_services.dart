import '../../../shop/export.dart';
import '../../domain/entities/notification.dart';

int _notificationCount = 0;

Future<List<AppNotification>> getNotifications() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppNotification(
          Shop(
              name: "Clary",
              description: "Vendemos Pizza Pikete",
              id: 5,
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 1",
          "Yesterday"),
      AppNotification(
          Shop(
              name: "Coly",
              id: 6,
              description: 'asdjasd',
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          "notification 2",
          "7:35"),
    ];
  });
}

int getNotificationCount() {
  return _notificationCount;
}
