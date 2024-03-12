import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/inputs/search_input_widget.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  final Icon icon;
  final Color? color;
  const SearchRow({super.key, required this.icon, this.color = Colors.white});

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
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Center(child: icon),
        ),
      ],
    );
  }
}
