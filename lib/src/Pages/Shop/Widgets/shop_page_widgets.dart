import 'dart:ffi';

import 'package:bisne/src/Pages/Home/Providers/ProductsProvider.dart';
import 'package:bisne/src/Pages/Shop/shop_more_info_page.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/core/Utils/custom_icons.dart';
import 'package:bisne/src/core/widgets/cards/favorite_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/comment_widgets.dart';
import '../../../core/widgets/banner_promotional_widget.dart';
import '../../../core/widgets/cards/card_tables.dart';
import '../../../core/widgets/cards/card_tables.dart';
import '../../../core/widgets/search_input_widget.dart';
import '../../../core/widgets/texts/texts_widgets.dart';

Column iconView(int viewsCount) {
  return Column(
    children: [
      const Icon(Icons.remove_red_eye_outlined, color: Colors.black45),
      Text(
        viewsCount > 100 ? '${viewsCount / 1000} K' : viewsCount.toString(),
        style: const TextStyle(color: Colors.black45),
      )
    ],
  );
}

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
  });
  final rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: const Color.fromRGBO(255, 254, 225, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_rate_rounded, color: Colors.yellow),
          Text(
            rate.toString(),
            style: const TextStyle(color: Color.fromARGB(129, 0, 0, 0)),
          )
        ],
      ),
    );
  }
}

Row photo(BuildContext context, _) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(children: [
        iconView(_.viewsCount),
        const SizedBox(
          height: 20.0,
        ),
        const Icon(
          Icons.share,
          color: Colors.black45,
        )
      ]),
      SizedBox(
        height: context.width > 400 ? 300 : 170,
        child: const FadeInImage(
            placeholder: placeHolderImageApp,
            image: AssetImage('assets/Images/logo_empresa.png')),
      ),
      Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(253, 217, 75, 0.11),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        height: 40,
        width: 40,
        child: Center(child: RateWidget(rate: _.rate)),
      )
    ],
  );
}

Column info(ShopPageController _, BuildContext context, isInfoPage) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(
      height: 20,
    ),
    ListTile(
      title: RegularAppText(text: _.name, size: 30),
      subtitle: ThinAppText(text: _.categories[0], size: 20),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
            child: Icon(
              CustomIcons.eye,
              size: 16,
              color: iconAppColor,
            ),
          ),
          SizedBox(
              height: 25,
              width: 40,
              child: Center(
                  child: ThinAppText(
                      text: _.viewsCount > 999
                          ? '${(_.viewsCount / 1000).toString()} K'
                          : _.viewsCount.toString(),
                      size: 20))),
        ],
      ),
    ),
    const SizedBox(
      height: 10,
    ),
    Row(
      children: [
        RateWidget(rate: _.rate),
        const SizedBox(
          width: 20,
        ),
        const FavoriteLargeButton(),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black26, width: 1))),
            icon: const Icon(
              Icons.share_sharp,
              size: 30,
            ))
      ],
    ),
    const SizedBox(
      height: 10,
    ),
    ListTile(
      title: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: RegularAppText(text: 'Descripción', size: 26),
      ),
      subtitle: ThinAppText(text: _.descripcion, size: 20, maxLines: 5),
    ),
    isInfoPage ? moreInfoPage(context, _) : showMoreInfo(context)
  ]);
}

class FavoriteLargeButton extends StatefulWidget {
  const FavoriteLargeButton({
    super.key,
  });

  @override
  State<FavoriteLargeButton> createState() => _FavoriteLargeButtonState();
}

class _FavoriteLargeButtonState extends State<FavoriteLargeButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: ButtonStyle(
            side: const MaterialStatePropertyAll(
                BorderSide(color: Colors.black26, width: 1)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(10))),
        child: Row(children: [
          Icon(_isPressed ? Icons.favorite_sharp : Icons.favorite_border,
              color: _isPressed ? Colors.red : iconAppColor),
          const SizedBox(
            width: 5,
          ),
          const RegularAppText(text: 'Guardar favorito', size: 18),
          const SizedBox(
            width: 10,
          )
        ]));
  }
}

Widget moreInfoPage(BuildContext context, _) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(height: 30),
    openingHours(context, _),
    const SizedBox(height: 30),
    address(context, _),
    const SizedBox(height: 30),
    contact(_),
    const SizedBox(height: 30),
    link(_),
    const SizedBox(height: 50),
    comments(context, _),
  ]);
}

Widget link(_) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const RegularAppText(text: 'Enlace a grupo', size: 26),
      const SizedBox(height: 10),
      GestureDetector(
        child: RegularAppText(text: _.contact['link'], size: 20),
        onTap: () async {
          Uri url = Uri.parse(_.contact['link']);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            print('No se pudo lanzar $url');
          }
        },
      )
    ],
  );
}

Widget contact(ShopPageController _) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const RegularAppText(text: 'Contacto', size: 26),
      const SizedBox(height: 10),
      Row(
        children: [
          Row(children: [
            networkContact(const Icon(Icons.phone), _.contact["phoneNumber"]),
            const SizedBox(width: 25),
            networkContact(const Icon(Icons.phone_android_outlined),
                _.contact["whatsapp"]),
          ]),
        ],
      ),
      const SizedBox(height: 25),
      networkContact(
          const Icon(Icons.camera_alt_rounded), _.contact["instagram"]),
      const SizedBox(height: 25),
      networkContact(const Icon(Icons.facebook), _.contact["facebook"])
    ],
  );
}

Row networkContact(Icon icon, String contact) {
  return Row(
    children: [
      icon,
      const SizedBox(width: 10),
      ThinAppText(text: contact, size: 20),
    ],
  );
}

Widget address(BuildContext context, ShopPageController _) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const RegularAppText(text: 'Dirección', size: 26),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(
            width: 10,
          ),
          ThinAppText(text: _.localitation, size: context.width > 400 ? 20 : 15)
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 250,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: const Center(
            child: RegularAppText(text: 'Ubicación de Google Maps', size: 19)),
      )
    ],
  );
}

Widget openingHours(BuildContext context, ShopPageController _) {
  List<Widget> hours = [];
  hours
    ..add(
      const RegularAppText(text: 'Horario', size: 26),
    )
    ..add(
      const SizedBox(
        height: 10,
      ),
    );
  for (var seccion in _.openingHours) {
    hours
      ..add(
        Row(
          children: [
            const Icon(Icons.access_time),
            const SizedBox(
              width: 10,
            ),
            ThinAppText(text: seccion, size: context.width > 400 ? 20 : 16)
          ],
        ),
      )
      ..add(
        const SizedBox(
          height: 10,
        ),
      );
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: hours,
  );
}

TextButton showMoreInfo(context) {
  return TextButton(
    style: const ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => ShopMoreInfoPage(),
          transitionDuration: const Duration(seconds: 0),
        ),
      );
    },
    child: const RegularAppText(
        text: 'Ver más información ...', size: 16, color: Colors.black),
  );
}

Column categorySession(BuildContext context, _) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      SearchInput(
          searchController: SearchController(),
          hintText: 'Buscar en esta tienda...'),
      setCategories(context, _)
    ],
  );
}

Column setCategories(BuildContext context, ShopPageController _) {
  List<Widget> categoryList = [];
  for (var category in _.categories) {
    categoryList.add(Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text(
              category,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: FutureBuilder(
              future: productProvider.cargarData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return createProductTable(context, snapshot.data!);
                } else {
                  return Container();
                }
              },
            ),
          ),
          const BannerSwiper(rounded: true)
        ],
      ),
    ));
  }
  return Column(children: categoryList);
}
