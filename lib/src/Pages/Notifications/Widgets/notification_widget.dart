import 'package:flutter/material.dart';

import '../../../core/entities/notification.dart';
import '../../../core/entities/shop.dart';
import '../../../core/widgets/images/circular_image.dart';
import '../../../core/widgets/texts/texts_widgets.dart';

Widget notificationWidget(ShopDump shopDump, String body, String date) {
  return Container(
    margin: const EdgeInsets.only(top: 14, right: 15, left: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularImage(image: NetworkImage(shopDump.imageUrl), size: 28),
        const SizedBox(
          width: 20,
        ),
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
