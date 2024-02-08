import 'package:bisne/src/Pages/Shop/Providers/shop_provider.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Pages/User/Widgets/profiles_pages_button.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

class EditShopInfoPage extends StatelessWidget {
  final shop = getShopInfo();
  EditShopInfoPage({super.key});

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
              const SizedBox(
                height: 15,
              ),
              whiteLabelInputTextWidget(
                  context, "CAMBIAR DESCRIPCIÓN", Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
