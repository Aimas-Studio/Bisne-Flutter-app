import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final primaryColor = const Color(0xffffffff);

  final secondaryColor = const Color(0xff6D28D9);

  final accentColor = const Color(0xffffffff);

  final backgroundColor = const Color(0xffffffff);

  final errorColor = const Color(0xffEF4444);

  final selected = [false, false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: primaryColor,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 186, 185, 185),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      child: SizedBox(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBottomBar(
                  icon: Icons.notifications_none,
                  selected: selected[0],
                  onPressed: () {}),
              IconBottomBar(
                  icon: Icons.search_outlined,
                  selected: selected[1],
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'SearchPage');
                  }),
              IconBottomBar(
                  icon: Icons.home_outlined,
                  selected: selected[2],
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  }),
              IconBottomBar(
                  icon: Icons.favorite_border,
                  selected: selected[3],
                  onPressed: () {}),
              IconBottomBar(
                  icon: Icons.person_outline_outlined,
                  selected: selected[4],
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: selected ? Color.fromARGB(25, 119, 119, 119) : accentColor,
            borderRadius: BorderRadius.circular(50.0)),
        width: 45,
        height: 45,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 30, color: const Color.fromARGB(255, 30, 30, 30)),
        ),
      ),
    );
  }
}
