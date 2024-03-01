import 'package:bisne/src/Pages/Orders/orders_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../domain/entities/user.dart';
import '../widgets/profile_widget.dart';
import '../widgets/white_option_button_list.dart';
import 'edit_user_page.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({super.key, required this.user});

  @override
  Widget build(context) {
    //Wrap in a SingleScrollView for more responsive design
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ProfileWidget(
                  mainInfo: user.username,
                  secondaryInfo: user.email,
                  buttonLabel: "EDITAR PERFIL",
                  image: AssetImage(user.imageUrl),
                  buttonAction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUserPage(user: user)));
                  }),
              const SizedBox(
                height: 18,
              ),
              WhiteOptionButtonList(content: _contentPanel1),
              const SizedBox(height: 20),
              WhiteOptionButtonList(content: _contentPanel2),
            ],
          ),
        ),
      ),
    );
  }
}

final List<ContentPanel> _contentPanel1 = [
  ContentPanel(CustomIcons.finished, "Pedidos Realizados", (context) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (context, a, b) => const OrderPage()));
  }),
  ContentPanel(Icons.add, "Publicar Negocio", (context) {})
];

final List<ContentPanel> _contentPanel2 = [
  //TODO contactar equipo mensaje a presi
  ContentPanel(CustomIcons.employed, "Contactar Equipo", (context) {}),
  //TODO
  ContentPanel(CustomIcons.rate, "Calificar App", (context) {}),
  ContentPanel(Icons.share, "Compartir App", (context) {}),
];
