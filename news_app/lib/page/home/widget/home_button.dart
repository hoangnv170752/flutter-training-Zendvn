import 'package:flutter/material.dart';
import 'package:news_app/app/color.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.icon,
    required this.color,
    this.press,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: 25,
        onPressed: press,
        icon: Icon(
          icon,
          color: AppColor.kNewsWhite,
        ),
      ),
    );
  }
}
