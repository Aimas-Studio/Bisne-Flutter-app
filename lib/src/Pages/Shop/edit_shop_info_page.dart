import 'package:bisne/src/Pages/Shop/Providers/shop_provider.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Pages/User/Widgets/profiles_pages_button.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

class EditShopInfoPage extends StatefulWidget {
  const EditShopInfoPage({super.key});

  @override
  State<EditShopInfoPage> createState() => _EditShopInfoPageState();
}

class _EditShopInfoPageState extends State<EditShopInfoPage> {
  final shop = getShopInfo();
  late TextEditingController shopDescriptionController;
  late TextEditingController openingHour1;

  @override
  void initState() {
    super.initState();
    shopDescriptionController =
        TextEditingController(text: shop.shopDescription);
    openingHour1 = TextEditingController(text: shop.openingHours[0]);
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              secondaryAppBar(context, true),
              const SizedBox(
                height: 15,
              ),
              circularImage(AssetImage(shop.imageUrl), 65),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: profilesPageButton('ELEGIR FOTO', () {}),
              ),
              boldAppText(shop.shopName, 34),
              regularAppText(shop.categories.join('\n'), 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: whiteLabelInputTextWidget(
                    context, "CAMBIAR DESCRIPCIÓN", Icons.edit,
                    controller: shopDescriptionController),
              ),
              whiteLabelInputTextWidget(
                  context, "Cambiar Horario 1", Icons.access_time),
              const SizedBox(
                height: 15,
              ),
              whiteLabelInputTextWidget(
                  context, "Cambiar Horario 2", Icons.access_time),
              const SizedBox(
                height: 15,
              ),
              whiteLabelInputTextWidget(
                  context, "Cambiar Horario 3", Icons.access_time),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
