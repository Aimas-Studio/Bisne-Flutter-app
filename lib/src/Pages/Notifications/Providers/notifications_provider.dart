import '../../../Utils/Entities/notification.dart';
import '../../../Utils/Entities/shop.dart';

Future<List<AppNotification>> getNotifications() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppNotification(ShopDump("Clary", ""), "notification 1", "Yesterday"),
      AppNotification(ShopDump("Coly", ""), "notification 2", "7:35"),
    ];
  });
}
