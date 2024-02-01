import 'package:flutter/material.dart';

import '../../../Utils/Entities/notification.dart';
import '../../../Utils/Entities/shop.dart';
import '../../../Utils/texts.dart';
import '../../../Widgets/circular_image.dart';

Widget notificationWidget(ShopDump shopDump, String body, String date) {
  return Container(
    margin: const EdgeInsets.only(top: 14, right: 15, left: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        circularImage(
          NetworkImage(shopDump.imageUrl),
          28,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularAppText(shopDump.shopName, 15),
              thinAppText(body, 13),
            ],
          ),
        ),
        thinAppText(date, 14),
      ],
    ),
  );
}

Widget notificationsList(context, List<AppNotification> notifications) {
  List<Widget> result = [];
  for (AppNotification element in notifications) {
    result
      ..add(notificationWidget(element.shop, element.body, element.date))
      ..add(Container(
        padding: const EdgeInsets.only(left: 50),
        height: 20,
        width: MediaQuery.of(context).size.width * 0.75,
        child: const Divider(),
      ));
  }
  return Column(
    children: result,
  );
}

Widget loadingNotifications() {
  return Container();
}
