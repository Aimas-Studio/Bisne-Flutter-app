import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final double size;
  const FavoriteButton({super.key, required this.size});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState(size);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final double size;
  _FavoriteButtonState(this.size);
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size,
      child: SizedBox(
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
      ),
    );
  }
}
