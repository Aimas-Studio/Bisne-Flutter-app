import 'package:bisne/src/Pages/Shop/Providers/comment_provider.dart';
import 'package:bisne/src/Pages/Shop/Widgets/commet_widget.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

Widget comments(_) {
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
        commentsButtons()
      ],
    ),
  );
}

Container commentsButtons() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 120,
          child: OutlinedButton(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Ajusta el 10 a la redondez que desees
                )),
              ),
              onPressed: () => {},
              child: regularAppText('VER MÁS', 13)),
        ),
        SizedBox(
          width: 180,
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
