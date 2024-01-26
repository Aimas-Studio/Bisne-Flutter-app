//Flutter Imports
import 'package:bisne/src/Widgets/appNotificationBar.dart';
import 'package:flutter/material.dart';

//Internal Imports
import '../../Utils/custom_icons.dart';
import '../../Utils/interfaces.dart';
import 'Providers/user_provider.dart';
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
              appNotificationBar(context, false,
                  iconData: Icons.notifications_none),
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
