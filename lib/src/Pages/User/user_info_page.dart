//Flutter Imports
import 'package:flutter/material.dart';
import 'package:widget_factory/Pages/User/Providers/user_providers.dart';
//Internal Imports
import 'package:widget_factory/Utils/custom_icons.dart';
import 'package:widget_factory/Utils/interfaces.dart';

import 'Widgets/profile_widget.dart';
import 'Widgets/user_page_widgets.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

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
                getUsername(),
                getUserEmail(),
                "EDITAR PERFIL",
              ),
              userServicesList(contentPanel1),
              const SizedBox(height: 20),
              userServicesList(contentPanel2),
            ],
          ),
        ),
      ),
    );
  }
}

final Map<IconData, String> contentPanel1 = {
  Icons.list: "Favoritos",
  CustomIcons.finished: "Pedidos Realizados",
  Icons.add: "Publicar Negocio"
};

final Map<IconData, String> contentPanel2 = {
  Icons.star: "Invitar Amigos",
  CustomIcons.employed: "Contactar Equipo",
  CustomIcons.rate: "Calificar App",
  Icons.share: "Compartir App",
};
