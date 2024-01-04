import 'package:bisnes/src/Pages/User/Widgets/user_page_widgets.dart';
import 'package:bisnes/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';

class ShopInfoPage extends StatelessWidget {
  const ShopInfoPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: backgroundAppColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            notificationButtonBar(),
          ],
        ),
      ),
    );
  }
}
