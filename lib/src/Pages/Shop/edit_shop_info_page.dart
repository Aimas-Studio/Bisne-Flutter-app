import 'package:bisne/src/Pages/Shop/Providers/shop_provider.dart';
import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Pages/User/Widgets/profiles_pages_button.dart';
import 'package:bisne/src/Utils/custom_icons.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

final _shop = getShopInfo();

class EditShopInfoPage extends StatefulWidget {
  const EditShopInfoPage({super.key});

  @override
  State<EditShopInfoPage> createState() => _EditShopInfoPageState();
}

class _EditShopInfoPageState extends State<EditShopInfoPage> {
  final shopDescriptionController =
      TextEditingController(text: _shop.shopDescription);
  final openingHour1 = TextEditingController(text: _shop.openingHours[0]);
  final phoneController = TextEditingController(text: _shop.phoneNumber);
  final whatsAppController = TextEditingController(text: _shop.whatsAppNumber);
  final instagramController =
      TextEditingController(text: _shop.instagramAccount);
  final facebookController = TextEditingController(text: _shop.facebookAccount);
  final linkController = TextEditingController(text: _shop.optionalLink);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    List<(String, IconData, TextEditingController)> contactInfo = [
      ("Teléfono", Icons.phone, phoneController),
      ("WhatsApp", CustomIcons.whatsapp, whatsAppController),
      ("Instagram", CustomIcons.instagram, instagramController),
      ("Facebook", CustomIcons.facebook, facebookController),
      ("Enlace", Icons.link, linkController),
    ];

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
              circularImage(AssetImage(_shop.imageUrl), 65),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: profilesPageButton('ELEGIR FOTO', () {}),
              ),
              boldAppText(_shop.shopName, 34),
              regularAppText(_shop.categories.join('\n'), 20),
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
              Divider(
                height: 60,
                indent: MediaQuery.of(context).size.width * 0.1,
                endIndent: MediaQuery.of(context).size.width * 0.1,
              ),
              whiteLabelInputTextWidget(
                  context, "Ubicación", Icons.location_on_outlined),
              const SizedBox(
                height: 30,
              ),
              listWhiteLabelInput(context, contactInfo),
            ],
          ),
        ),
      ),
    );
  }
}
