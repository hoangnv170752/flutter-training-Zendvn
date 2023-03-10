import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String _token = '';
  int _expires = 0;
  bool get isAuth {
    return _token.isNotEmpty;
  }

  Future<void> _authentication(
      String email, String password, String type) async {
    final url = 'http://apiforlearning.zendvn.com/api/auth/login';
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );
      final responseData = jsonDecode(res.body);
      _token = responseData['access_token'];
      _expires = responseData['expires_in'];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) {
    _authentication(email, password, 'login');
  }
}
