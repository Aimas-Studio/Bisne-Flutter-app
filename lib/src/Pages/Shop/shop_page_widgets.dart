import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Widgets/search_input_widget.dart';
import 'package:bisne/src/Widgets/table_shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

Container perfilSession(BuildContext context, _) {
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
        info(_),
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
            placeholder: AssetImage('assets/Images/hero.png'),
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

Column info(_) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _.categories[0],
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              _.name,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
        Text(
          'Esta tienda${_.mensajeria ? '' : ' no'} dispone de mensajería',
          style: const TextStyle(color: Colors.black45),
        )
      ],
    ),
    const SizedBox(
      height: 20,
    ),
    Text(
      _.descripcion,
      style: const TextStyle(color: Colors.black45),
    ),
    const SizedBox(
      height: 15,
    ),
    InkWell(
      onTap: () {},
      child: const Text('Ver más información ...'),
    )
  ]);
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
            child: TableShopWidget(
                maxColumns: MediaQuery.of(context).size.width > 400 ? 3 : 2),
          )
        ],
      ),
    ));
  }
  return Column(children: categoryList);
}
