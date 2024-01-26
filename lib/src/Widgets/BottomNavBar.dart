
import 'package:flutter/material.dart';

import '../Pages/Home/home_page.dart';
import '../Pages/User/user_info_page.dart';
import '../Pages/search_page.dart';

class BottomNavBar extends StatefulWidget {
  int index = 0;
  BottomNavBar({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(index: index);
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  _BottomNavBarState({this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0xffffffff),
          boxShadow: [
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
                  selected: index == 0,
                  onPressed: () {}),
              IconBottomBar(
                  icon: Icons.search_outlined,
                  selected: index == 1,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            SearchPage(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }),
              IconBottomBar(
                  icon: Icons.home_outlined,
                  selected: index == 2,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            HomePage(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }),
              IconBottomBar(
                  icon: Icons.favorite_border,
                  selected: index == 3,
                  onPressed: () {}),
              IconBottomBar(
                  icon: Icons.person_outline_outlined,
                  selected: index == 4,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            UserInfoPage(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  })
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
