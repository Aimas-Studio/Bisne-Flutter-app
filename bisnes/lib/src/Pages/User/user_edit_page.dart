//Flutter Imports
import 'package:flutter/material.dart';

//Internal Imports
import '../../Utils/interfaces.dart';
import 'Widgets/user_page_widgets.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: backgroundAppColor,
      appBar: notificationButtonBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profilePhoto(),
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: userPageButton("ELEGIR FOTO", context)),
            const Text("Username",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: fontAppColor)),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "email",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: fontAppColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
