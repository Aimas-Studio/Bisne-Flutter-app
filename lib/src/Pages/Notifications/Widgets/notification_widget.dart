import 'package:flutter/material.dart';

import '../../../core/entities/notification.dart';
import '../../../core/entities/shop.dart';
import '../../../core/presentation/widgets/texts/texts_widgets.dart';

class NotificationWidget extends StatelessWidget {
  final ShopDump shopDump;
  final String body;
  final String date;

  const NotificationWidget(
      {super.key,
      required this.shopDump,
      required this.body,
      required this.date});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, right: 15, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircularImage(image: NetworkImage(shopDump.imageUrl), size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularAppText(text: shopDump.shopName, size: 15),
                LightAppText(text: body, size: 13),
              ],
            ),
          ),
          LightAppText(text: date, size: 14),
        ],
      ),
    );
  }
}

Widget notificationsList(context, List<AppNotification> notifications) {
  List<Widget> result = [];
  for (AppNotification element in notifications) {
    result
      ..add(NotificationWidget(
          shopDump: element.shop, body: element.body, date: element.date))
      ..add(
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const Divider(),
          ),
        ),
      );
  }
  return Column(
    children: result,
  );
}

Widget loadingNotifications() {
  return const SizedBox();
}
