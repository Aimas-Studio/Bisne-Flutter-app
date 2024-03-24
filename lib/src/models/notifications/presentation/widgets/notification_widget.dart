import 'package:bisne/src/core/presentation/widgets/images/circular_image.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_fade_in_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../shop/export.dart';
import '../../domain/entities/notification.dart';

class NotificationWidget extends StatelessWidget {
  final Shop shop;
  final String body;
  final String date;

  const NotificationWidget(
      {super.key, required this.shop, required this.body, required this.date});

  @override
  Widget build(context) {
    return Row(
      children: [
        const CircularImage(
          size: 35,
          child: CustomFadeInImage(
            image: AssetImage('assets/Images/placeholder.png'),
          ),
        ),
        Expanded(
          flex: 85,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            trailing: RegularAppText(text: date),
            titleAlignment: ListTileTitleAlignment.top,
            title: BoldAppText(
              text: shop.name,
              size: 20,
            ),
            subtitle: ThinAppText(
              text:
                  '${body}ihboihboou igvigvigciyciytrr rrkmmmmmmm m mm mmmmmmmmmm mmmmmmmm m  mm mmm mmmmm mmmmmmm mmm mmm mmmm mmm mmm mmm mmmmmm mm mmmmm m m mmmmmmm mmmmmmmm mmmmm mmm mm rrrrrr r rrr rrrrr rrr r rrrrrrrrrrr rrrrrr rrr',
              size: 18,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}

Widget notificationsList(context, List<AppNotification> notifications) {
  List<Widget> result = [];
  for (AppNotification element in notifications) {
    result
      ..add(NotificationWidget(
          shop: element.shop, body: element.body, date: element.date))
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
  result.removeLast();
  return Column(
    children: result,
  );
}

Widget loadingNotifications() {
  return const SizedBox();
}
