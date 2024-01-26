//Flutter Imports
// import 'dart:js';

import 'package:flutter/material.dart';

import '../../../Utils/custom_icons.dart';
import '../../../Utils/interfaces.dart';
import '../Providers/user_provider.dart';

//Internal Imports

Widget notificationButtonBar() {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    alignment: Alignment.bottomRight,
    width: double.infinity,
    height: 60,
    child: _notificationButton(),
  );
}

Widget profilePhoto() {
  return ClipOval(
    child: SizedBox.fromSize(
      size: const Size.fromRadius(70),
      child: Image(
        image: getProfilePicture(),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget _userInformation() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: username(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: userEmail(),
      ),
      userPageButton("Editar Perfil"),
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

Widget userPageButton(String text) {
  return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(BorderSide(
          width: 1,
          color: fontAppColor.withOpacity(0.3),
        )),
        elevation: const MaterialStatePropertyAll(1),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(backgroundAppColor),
      ),
      onPressed: () => {},
      child: Text(
        text,
        softWrap: false,
        style: const TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(114, 124, 142, 1),
            fontWeight: FontWeight.w300),
      ));
}

Widget _notificationButton() {
  return Badge(
    backgroundColor: bisneColorPrimary,
    alignment: AlignmentDirectional.bottomStart,
    offset: const Offset(-1, -17),
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

Text username() {
  return Text(
    getUsername(),
    style: const TextStyle(
      fontSize: 30,
      color: fontAppColor,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text userEmail() {
  return Text(getUserEmail(),
      style: const TextStyle(
        color: fontAppColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ));
}

Widget inputTextAppWidget(String labelText,
    {TextEditingController? controller}) {
  return Expanded(
    child: TextField(
      cursorColor: fontAppColor,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: fontAppColor,
      ),
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: fontAppColor.withOpacity(0.5),
          ),
        ),
      ),
    ),
  );
}

Widget profile() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: profilePhoto(),
      ),
      _userInformation(),
    ],
  );
}
