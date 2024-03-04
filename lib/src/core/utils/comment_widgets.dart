import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Pages/shop/infrastructure/services/get_shop_comments.dart';
import '../../Pages/shop/presentation/widgets/commet_widget.dart';
import '../entities/comments_controller/coment_controller.dart';
import '../presentation/themes/colors.dart';
import '../presentation/widgets/images/circular_image.dart';
import '../presentation/widgets/inputs/custom_reactive_text_field.dart';
import '../presentation/widgets/texts/texts_widgets.dart';

Widget comments(
  BuildContext context,
  _,
) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: getShopComments(),
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
    padding: EdgeInsets.symmetric(horizontal: context.width > 550 ? 30 : 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width > 550 ? 120 : 90,
          child: OutlinedButton(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              onPressed: () => {},
              child: const RegularAppText(text: 'VER MÁS', size: 13)),
        ),
        SizedBox(
          width: context.width > 550 ? 180 : 150,
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
              child: const RegularAppText(text: 'HACER COMENTARIO', size: 13)),
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
                child: CircularImage(
                    size: 70, child: Image(image: AssetImage(_.shopImage))),
              ),
              const SizedBox(
                height: 40,
              ),
              starsWidget(),
              const SizedBox(
                height: 30,
              ),
              const CustomReactiveTextField(formName: '', isComment: true),
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
            const Expanded(
                child: Center(
                    child: RegularAppText(
                        text: "ENVIAR", size: 17, color: Colors.white))),
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
