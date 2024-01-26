//Flutter Imports
import 'package:flutter/material.dart';

//Internal Imports
import '../../Utils/custom_icons.dart';
import '../../Utils/interfaces.dart';
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
              notificationButtonBar(),
              profile(),
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