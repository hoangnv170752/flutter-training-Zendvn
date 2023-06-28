import 'package:flutter/material.dart';
import 'package:hw_countdownapp/app/const.dart';

Widget buttonWidget(
    {required String text,
    required VoidCallback onClicked,
    required Icon icon,
    Color color = Colors.white,
    Color backgroundColor = Colors.black}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.buttonHorizontal,
          vertical: AppConstant.buttonVertical,
        ),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20, color: color),
          ),
          icon
        ],
      ));
}
