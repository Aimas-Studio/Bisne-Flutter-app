import 'package:flutter/material.dart';

import '../../Utils/interfaces.dart';
import '../User/Widgets/user_page_widgets.dart';

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
