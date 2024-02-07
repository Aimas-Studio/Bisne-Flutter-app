import 'package:bisne/src/Pages/Shop/Providers/comment_provider.dart';
import 'package:bisne/src/Pages/Shop/commet_widget.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget comments(BuildContext context, _) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: getComment(),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? commentsList(context, snapshot.data)
                : loadingcomments();
          },
        ),
        const SizedBox(height: 20),
        commentsButtons(context)
      ],
    ),
  );
}

Container commentsButtons(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.width > 400 ? 30 : 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width > 400 ? 120 : 90,
          child: OutlinedButton(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              onPressed: () => {},
              child: regularAppText('VER MÁS', 13)),
        ),
        SizedBox(
          width: context.width > 400 ? 180 : 150,
          child: OutlinedButton(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              onPressed: () => {},
              child: regularAppText('HACER COMENTARIO', 13)),
        ),
      ],
    ),
  );
}
