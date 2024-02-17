import 'package:bisne/src/Pages/Shop/Providers/comment_provider.dart';
import 'package:bisne/src/Pages/Shop/Widgets/commet_widget.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/Entities/comments_controller/coment_controller.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
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
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: backgroundAppColor,
          actionsAlignment: MainAxisAlignment.center,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop("comment");
                },
              )
            ],
          ),
          content: IntrinsicHeight(
            child: Column(children: [
              Center(
                child: circularImage(AssetImage(_.shopImage), 70),
              ),
              const SizedBox(
                height: 40,
              ),
              starsWidget(),
              const SizedBox(
                height: 30,
              ),
              whiteLabelInputTextWidget(context, 'Escriba un comentario',
                  isComment: true)
            ]),
          ),
          actions: <Widget>[sendButton(context)],
        ),
      );
    },
  );
}

TextButton sendButton(BuildContext context) {
  return TextButton(
    child: Container(
      height: 50,
      width: 200,
      decoration: const BoxDecoration(
          color: iconAppColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Center(
                    child: regularAppText("ENVIAR", 17, color: Colors.white))),
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            )
          ],
        ),
      )),
    ),
    onPressed: () {
      Navigator.of(context).pop("comment"); // Cierra el diálogo
    },
  );
}

Widget starsWidget() {
  return Obx(() {
    final commentController = Get.find<CommentController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () => commentController.setStars(index),
          child: commentController.stars[index]
              ? const Icon(
                  Icons.star_rounded,
                  size: 50,
                  color: Color.fromRGBO(241, 196, 14, 1),
                )
              : const Icon(
                  Icons.star_border_rounded,
                  size: 50,
                  color: Color.fromRGBO(241, 196, 14, 1),
                ),
        );
      }),
    );
  });
}
