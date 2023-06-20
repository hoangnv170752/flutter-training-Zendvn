import 'package:flutter/material.dart';

extension ColorEx on Color {
  static Color fromHex(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}
