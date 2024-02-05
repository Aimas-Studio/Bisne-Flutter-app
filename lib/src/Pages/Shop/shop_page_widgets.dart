import 'package:bisne/src/Pages/Home/Providers/ProductsProvider.dart';
import 'package:bisne/src/Pages/Shop/shop_more_info_page.dart';
import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Utils/comments.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/banner_promotional_widget.dart';
import 'package:bisne/src/Widgets/card_tables.dart';
import 'package:bisne/src/Widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

Column iconStar(_) {
  return Column(
    children: [
      const Icon(Icons.star_rate_rounded, color: Colors.yellow),
      Text(
        _.rate.toString(),
        style: const TextStyle(color: Color.fromARGB(129, 0, 0, 0)),
      )
    ],
  );
}

Container perfilSession(BuildContext context, _, isInfoPage) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(30, 40),
            topRight: Radius.elliptical(40, 30))),
    padding: EdgeInsets.only(
        left: context.width * 0.07,
        right: context.width * 0.07,
        top: context.width * 0.05),
    child: Column(
      children: [
        photo(_),
        const SizedBox(
          height: 30.0,
        ),
        info(_, context, isInfoPage),
        const SizedBox(
          height: 30.0,
        )
      ],
    ),
  );
}

Row photo(_) {
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
      const SizedBox(
        height: 300,
        child: FadeInImage(
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
        child: Center(child: iconStar(_)),
      )
    ],
  );
}

Column info(_, context, isInfoPage) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            thinAppText(
              _.categories[0],
              23,
            ),
            boldAppText(
              _.name,
              47,
            )
          ],
        ),
        Row(
          children: [
            IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.heart_broken)),
            Container(
              height: 30,
              width: 40,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(106, 237, 138, 1),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: const Icon(Icons.delivery_dining),
            )
          ],
        ),
      ],
    ),
    Row(
      children: [
        const Icon(
          Icons.delivery_dining,
          size: 35,
          color: Colors.black45,
        ),
        const SizedBox(
          width: 10,
        ),
        thinAppText(
            'Esta tienda${_.mensajeria ? '' : ' no'} dispone de mensajería', 20)
      ],
    ),
    const SizedBox(
      height: 20,
    ),
    thinAppText(
      _.descripcion,
      21,
    ),
    const SizedBox(
      height: 15,
    ),
    isInfoPage ? moreInfoPage(_) : showMoreInfo(context)
  ]);
}

Widget moreInfoPage(_) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(height: 30),
    openingHours(_),
    const SizedBox(height: 30),
    address(_),
    const SizedBox(height: 30),
    contact(_),
    const SizedBox(height: 30),
    link(_),
    const SizedBox(height: 50),
    comments(_),
  ]);
}

Widget link(_) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      regularAppText('Enlace a grupo', 26),
      const SizedBox(height: 10),
      GestureDetector(
        child: regularAppText(_.contact['link'], 20),
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
      regularAppText('Contacto', 26),
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
      thinAppText(contact, 20),
    ],
  );
}

Widget address(ShopPageController _) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      regularAppText('Dirección', 26),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(
            width: 10,
          ),
          thinAppText(_.localitation, 20)
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 250,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: Center(child: regularAppText('Ubicación de Google Maps', 19)),
      )
    ],
  );
}

Widget openingHours(ShopPageController _) {
  List<Widget> hours = [];
  hours
    ..add(
      regularAppText('Horario', 26),
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
            thinAppText(seccion, 20)
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

InkWell showMoreInfo(context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => ShopMoreInfoPage(),
          transitionDuration: const Duration(seconds: 0),
        ),
      );
    },
    child: const Text('Ver más información ...'),
  );
}

Column categorySession(BuildContext context, _) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      SearchInputFb1(
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
