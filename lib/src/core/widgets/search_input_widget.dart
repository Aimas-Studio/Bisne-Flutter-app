import 'package:bisne/src/core/Utils/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const SearchInput(
      {required this.searchController, required this.hintText, Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(12, 12),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
      child: Center(
        child: TextField(
          controller: searchController,
          textAlign: TextAlign.start,
          onChanged: (value) {},
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search, size: 30, color: iconAppColor),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(.75),
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w300),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
