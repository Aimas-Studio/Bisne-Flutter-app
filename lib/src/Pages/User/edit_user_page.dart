import 'package:flutter/material.dart';

import '../../Utils/interfaces.dart';
import '../../Utils/texts.dart';
import '../../Widgets/appBarSecondary.dart';
import 'Providers/user_providers.dart';
import 'Widgets/input_text_widget.dart';
import 'Widgets/profile_widget.dart';
import 'Widgets/profiles_pages_button.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _usernameTextController;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController(text: getUsername());
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                appBarSecondary(context, true),
                ProfileWidget.profilePhoto(getProfilePicture(), 70),
                Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: profilesPageButton("ELEGIR FOTO", () => {})),
                boldAppText(getUsername(), 30),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: regularAppText(getUserEmail(), 16),
                ),
                _usernameModifyInput(),
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

  //TODO
  //Give this Widget a superior level of abstraction
  Widget _usernameModifyInput() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.edit,
              color: iconAppColor,
            ),
          ),
          inputTextAppWidget("CAMBIAR NOMBRE",
              controller: _usernameTextController),
        ],
      ),
    );
  }
}
