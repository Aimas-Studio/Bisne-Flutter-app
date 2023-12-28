//Flutter Imports
import 'package:flutter/material.dart';

//Internal Imports
import '../../Utils/interfaces.dart';
import 'Widgets/user_page_widgets.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: notificationButtonBar(),
        body: Column(
          children: [
            profile(),
          ],
        ),
      ),
    );
  }
}
