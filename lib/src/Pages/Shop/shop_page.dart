import 'package:flutter/material.dart';

import '../../Utils/custom_icons.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import '../../Widgets/notification_button_widget.dart';
import '../../Widgets/search_input_widget.dart';
import '../../Widgets/table_shop_widget.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  final int viewsCount = 1200;
  final double rate = 4.5;
  final List<String> categories = ['Alimentos'];
  final String name = 'ChocoThay';
  final bool mensajeria = true;
  final bool favorito = false;
  final String descripcion =
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor, Aenean massa.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        foregroundColor: iconAppColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 15),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: InkWell(
          child: Text('Regresar'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        actions: [
          Container(
              alignment: AlignmentDirectional.centerEnd,
              child: const NotificationButton(
                  value: 2, icon: Icon(CustomIcons.notifications))),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          perfilSession(),
          const SizedBox(
            height: 20,
          ),
          categorySession(context)
        ],
      ),
      backgroundColor: backgroundAppColor,
    );
  }

  Column iconView(int viewsCount) {
    return Column(
      children: [
        Icon(Icons.remove_red_eye_outlined, color: Colors.black45),
        Text(
          viewsCount > 100 ? '${viewsCount / 1000} K' : viewsCount.toString(),
          style: const TextStyle(color: Colors.black45),
        )
      ],
    );
  }

  Column iconStar() {
    return Column(
      children: [
        const Icon(Icons.star_rate_rounded, color: Colors.yellow),
        Text(
          rate.toString(),
          style: const TextStyle(color: Color.fromARGB(129, 0, 0, 0)),
        )
      ],
    );
  }

  Container perfilSession() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(30, 40),
              topRight: Radius.elliptical(40, 30))),
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Column(
        children: [
          photo(),
          info(),
          const SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }

  Row photo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          iconView(viewsCount),
          const SizedBox(
            height: 20.0,
          ),
          const Icon(
            Icons.share,
            color: Colors.black45,
          )
        ]),
        const FadeInImage(
            placeholder: AssetImage('assets/Images/hero.png'),
            image: AssetImage('assets/Images/photo.png')),
        Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(253, 217, 75, 0.11),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 40,
          width: 40,
          child: Center(child: iconStar()),
        )
      ],
    );
  }

  Column info() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categories[0],
                style: TextStyle(fontSize: 18),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  iconSize: 25,
                  onPressed: () {},
                  icon: Icon(Icons.heart_broken)),
              Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                    color: bisneColorSecondary,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Icon(Icons.delivery_dining),
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
            'Esta tienda${mensajeria ? '' : ' no'} dispone de mensajería',
            style: TextStyle(color: Colors.black45),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        descripcion + descripcion,
        style: TextStyle(color: Colors.black45),
      ),
      SizedBox(
        height: 15,
      ),
      InkWell(
        onTap: () {},
        child: const Text('Ver más información ...'),
      )
    ]);
  }

  Column categorySession(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        SearchInputFb1(
            searchController: SearchController(),
            hintText: 'Buscar en esta tienda...'),
        setCategories(context)
      ],
    );
  }

  Column setCategories(BuildContext context) {
    return Column(
      children: categories
          .map((category) => Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        category,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TableShopWidget(
                          maxColumns:
                              MediaQuery.of(context).size.width > 400 ? 3 : 2),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
