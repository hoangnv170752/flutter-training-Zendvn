import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          splashRadius: 25,
          onPressed: press,
          icon: Icon(
            icon,
            color: AppColor.cWhite,
          ),
        ),
      ),
    );
  }
}
