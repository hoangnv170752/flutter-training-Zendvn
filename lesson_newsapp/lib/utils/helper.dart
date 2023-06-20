import 'package:flutter/foundation.dart';

class Helper {
  static printof(Object o) {
    if (kDebugMode) {
      print(o);
    }
  }

  static String? emailValid(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email can not empty!!!';
    }
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(value)) {
      return 'Incorrect email format!!!';
    }
    return null;
  }

  static String? passwordValid(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can not empty!!!';
    }
    if (value.length < 8) {
      return 'Password must be more than 8 characters';
    }

    return null;
  }

  static String? confirmPassword(String? password, String? confirm) {
    if (password == null || password.isEmpty) {
      return 'Password can not empty!!!';
    }
    if (confirm == null || confirm.isEmpty) {
      return 'Confirm password can not empty!!!';
    }
    if (password != confirm) {
      return 'Confirm password incorrect';
    }
    return null;
  }
}
