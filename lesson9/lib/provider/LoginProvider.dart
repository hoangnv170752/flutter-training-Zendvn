import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './Login.dart';

class LoginProvider extends ChangeNotifier {
  final name = 'admin@gmail.com';
  final passAdmin = 'Admin@123';
  bool isAdmin = false;
  Future<bool> formLogin(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    if (email == name && password == passAdmin) {
      print(body);
      return true;
    } else {
      print("Wrong email or password");
      return false;
    }
  }
}
