import 'package:flutter/material.dart';

class NewsButton extends StatelessWidget {
  const NewsButton({
    Key? key,
    required this.icon,
    this.press,
  }) : super(key: key);

  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: 25,
        onPressed: press,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
