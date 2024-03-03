import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 40,
      child: Center(
        child: IconButton(
          style: IconButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          icon: Icon(
            _isPressed ? Icons.favorite : Icons.favorite_border,
            color: _isPressed ? Colors.red : Colors.black,
            size: 22,
          ),
        ),
      ),
    );
  }
}
