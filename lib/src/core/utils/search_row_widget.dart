import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/inputs/search_input_widget.dart';
import 'package:bisne/src/models/search/presentation/screens/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchRow extends StatelessWidget {
  final Icon icon;
  final Color? color;
  final Function onPressed;
  const SearchRow(
      {super.key,
      required this.icon,
      this.color = Colors.white,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 95,
          child: SearchInput(
            hintText: 'Buscar en El Bisne...',
            searchController: SearchController(),
          ),
        ),
        const Expanded(flex: 5, child: SizedBox()),
        IconButton(
          highlightColor: Colors.transparent,
          icon: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ),
            child: icon,
          ),
          onPressed: () => Navigator.push(
              context, GetPageRoute(page: () => const FilterPage())),
        ),
      ],
    );
  }
}
