//Flutter Imports
import 'package:flutter/material.dart';

//Internals Imports
import '../../Utils/custom_icons.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
        appBar: notificationButtonBar(),
        body: Column(
          children: [
            userInformation(),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget notificationButtonBar() {
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    foregroundColor: const Color.fromRGBO(114, 124, 142, 1),
    actions: [
      Container(
          margin: const EdgeInsets.only(right: 30, top: 20),
          child: Badge(
            backgroundColor: const Color.fromRGBO(29, 176, 3, 1),
            alignment: AlignmentDirectional.bottomStart,
            label: const Text('45'),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.notifications),
              iconSize: 32,
            ),
          )),
    ],
  );
}

Widget userInformation() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      profilePhoto(),
      const Column(
        children: [
          Text(
            "Username",
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: 31, color: Color.fromRGBO(81, 92, 111, 1)),
          )
        ],
      )
    ],
  );
}

Widget profilePhoto() {
  return Container(
      color: Colors.black,
      margin: const EdgeInsets.only(left: 30),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(70),
          child: const Image(
            image: AssetImage("assets/Images/photo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ));
}
