//Flutter Imports
import 'package:flutter/material.dart';

//Internal Imports
import '../../../Utils/custom_icons.dart';
import '../../../Utils/interfaces.dart';

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

Widget profile() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      profilePhoto(),
      userInformation(),
    ],
  );
}

Widget profilePhoto() {
  return Container(
      margin: const EdgeInsets.only(left: 15),
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

Widget userInformation() {
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
      ElevatedButton(
          style: const ButtonStyle(),
          onPressed: () => {},
          child: const Text(
            "Editar Usuario",
            style: TextStyle(color: Color.fromRGBO(114, 124, 142, 1)),
          ))
    ],
  );
}

Widget userServicesList(Map<IconData, String> content) {
  return Container(
    decoration: const BoxDecoration(),
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
          Icon(icon, color: iconAppColor, size: 30),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: fontAppColor,
              ),
            ),
          ),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: iconAppColor,
              ))
        ],
      ))
      ..add(const Divider());
  });
  return serviceList;
}
