import 'package:flutter/material.dart';

import '../../../../core/entities/comment_entity.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../user/domain/entities/user.dart';

Widget commentWidget(User user, String body, String date) {
  return Container(
    margin: const EdgeInsets.only(top: 14, right: 15, left: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircularImage(image: NetworkImage(userDump.imageUrl), size: 28),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: user.username, size: 15),
              ThinAppText(text: body, size: 13),
            ],
          ),
        ),
        ThinAppText(text: date, size: 14),
      ],
    ),
  );
}

Widget commentsList(context, List<AppComment> comments) {
  List<Widget> result = [];
  for (AppComment element in comments) {
    result
      ..add(commentWidget(element.user, element.body, element.date))
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

Widget loadingcomments() {
  return Container();
}
