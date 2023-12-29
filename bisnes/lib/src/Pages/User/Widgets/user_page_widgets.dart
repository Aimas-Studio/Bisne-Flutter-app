//Flutter Imports
// import 'dart:js';

import 'package:bisnes/src/Pages/User/user_edit_page.dart';
import 'package:flutter/material.dart';

import '../../../Utils/custom_icons.dart';
import '../../../Utils/interfaces.dart';

//Internal Imports

PreferredSizeWidget notificationButtonBar() {
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    foregroundColor: const Color.fromRGBO(114, 124, 142, 1),
    actions: [
      Container(
          margin: const EdgeInsets.only(right: 30, top: 20),
          child: notificationButton()),
    ],
  );
}

Widget profile(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: profilePhoto(),
      ),
      _userInformation(context),
    ],
  );
}

Widget profilePhoto() {
  return ClipOval(
    child: SizedBox.fromSize(
      size: const Size.fromRadius(70),
      child: const Image(
        image: AssetImage("assets/Images/photo.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget _userInformation(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          "Username",
          style: TextStyle(fontSize: 24, color: fontAppColor),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          "testemail@gmail.com",
          style: TextStyle(
            color: fontAppColor,
            fontSize: 16,
          ),
        ),
      ),
      userPageButton("Editar Perfil", context),
    ],
  );
}

Widget userServicesList(Map<IconData, String> content) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //add box shadow for elevation effect
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Column(
      children: getServices(content),
    ),
  );
}

List<Widget> getServices(Map<IconData, String> content) {
  List<Widget> serviceList = [];
  content.forEach((icon, text) {
    serviceList
      ..add(Row(
        children: [
          Icon(icon, color: iconAppColor, size: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: const TextStyle(
                  color: fontAppColor,
                ),
              ),
            ),
          ),
          IconButton(
              style: const ButtonStyle(),
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 12,
                color: iconAppColor,
              ))
        ],
      ))
      ..add(const Divider());
  });
  serviceList.removeLast();
  serviceList.add(const SizedBox(height: 8));
  return serviceList;
}

Widget userPageButton(String text, BuildContext context) {
  return SizedBox(
    width: 120,
    child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStatePropertyAll(BorderSide(
            width: 1,
            color: fontAppColor.withOpacity(0.3),
          )),
          elevation: const MaterialStatePropertyAll(3),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
          backgroundColor:
              const MaterialStatePropertyAll<Color>(backgroundAppColor),
        ),
        onPressed: () => {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      EditUserPage(),
                  transitionDuration: Duration(seconds: 0),
                ),
              )
            },
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(114, 124, 142, 1),
              fontWeight: FontWeight.w300),
        )),
  );
}

Widget notificationButton() {
  return Badge(
    backgroundColor: const Color.fromRGBO(29, 176, 3, 1),
    alignment: AlignmentDirectional.bottomStart,
    offset: const Offset(-1, -22),
    label: const Text(
      '45',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 9,
      ),
    ),
    child: IconButton(
      onPressed: () {},
      icon: const Icon(CustomIcons.notifications),
      iconSize: 25,
    ),
  );
}
