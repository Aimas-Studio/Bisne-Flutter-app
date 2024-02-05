import 'package:flutter/material.dart';

import '../../Utils/Entities/comment.dart';
import '../../Utils/Entities/user.dart';
import '../../Utils/texts.dart';
import '../../Widgets/circular_image.dart';

Widget commentWidget(UserDump userDump, String body, String date) {
  return Container(
    margin: const EdgeInsets.only(top: 14, right: 15, left: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        circularImage(
          NetworkImage(userDump.imageUrl),
          28,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularAppText(userDump.userName, 15),
              thinAppText(body, 13),
            ],
          ),
        ),
        thinAppText(date, 14),
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
