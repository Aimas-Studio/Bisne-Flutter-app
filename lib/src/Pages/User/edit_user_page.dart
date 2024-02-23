import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../../core/widgets/images/circular_image.dart';
import '../../core/widgets/input_text_widget.dart';
import '../../core/widgets/secondary_app_bar.dart';
import '../../core/widgets/texts/texts_widgets.dart';
import 'Providers/user_providers.dart';
import 'Widgets/profiles_pages_button.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _usernameTextController;
  final user = getUserInfo();

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController(text: user.username);
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: secondaryAppBar(context, true),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CircularImage(image: AssetImage(user.imageUrl), size: 70),
                Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 15),
                    child: profilesPageButton("ELEGIR FOTO", () => {})),
                BoldAppText(text: user.username, size: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: RegularAppText(text: user.email, size: 16),
                ),
                const SizedBox(
                  height: 18,
                ),
                whiteLabelInputTextWidget(context, "Editar Usuario",
                    iconData: Icons.edit, controller: _usernameTextController),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profilesPageButton("GUARDAR CAMBIOS", () => {}),
                      profilesPageButton("DESCARTAR", () => {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
