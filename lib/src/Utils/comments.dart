import 'package:bisne/src/Pages/Shop/Providers/comment_provider.dart';
import 'package:bisne/src/Pages/Shop/Widgets/commet_widget.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/Entities/comments_controller/coment_controller.dart';
import 'package:bisne/src/Utils/custom_icons.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:bisne/src/Widgets/return_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget comments(
  BuildContext context,
  _,
) {
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
        commentsButtons(context, _)
      ],
    ),
  );
}

Container commentsButtons(BuildContext context, _) {
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
              onPressed: () async {
                String comment = await showAlertDialogComments(context, _);
              },
              child: regularAppText('HACER COMENTARIO', 13)),
        ),
      ],
    ),
  );
}

Future<dynamic> showAlertDialogComments(BuildContext context, _) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: circularImage(AssetImage(_.shopImage), 60),
        ),
        content: Column(children: [
          Row(
            children: [
              starsWidget(),
            ],
          ),
          whiteLabelInputTextWidget(context, 'Escriba un comentario',
              isComment: true)
        ]),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop("comment"); // Cierra el diálogo
            },
          ),
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              // Coloca aquí el código que se ejecutará cuando se presione el botón "Aceptar"
              Navigator.of(context).pop("comment"); // Cierra el diálogo
            },
          ),
        ],
      );
    },
  );
}

Widget starsWidget() {
  return Obx(() {
    final commentController = Get.find<CommentController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => commentController.setStars(index),
          icon: commentController.stars[index]
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
        );
      }),
    );
  });
}
