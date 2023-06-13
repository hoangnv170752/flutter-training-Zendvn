import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson9/components/TextFormField.dart';
import 'package:lesson9/pages/LoginPageBtvn.dart';
import 'package:lesson9/provider/LoginProvider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  void _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
    }
    print(_userEmail);
    print(_password);
    // bool check = await context.read<LoginProvider>.login(_userEmail, _password);
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool appear = false;
  void setTimeout() {
    Duration timeDelay = const Duration(seconds: 3);
    Timer(timeDelay, changeStatus);
  }

  void changeStatus() {
    setState(() {
      appear = !appear;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LoginProvider().formLogin(_userEmail, _password),
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          // ignore: unrelated_type_equality_checks
          return snapshot.hasData
              ? Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      width: 200,
                                      child: Image.network(
                                          "https://i.ibb.co/ZJ7cGxt/facebook-logo.png"),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Email'),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        if (!RegExp(r'\S+@\S+\.\S+')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => _userEmail = value,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        suffixIcon: IconButton(
                                          padding: const EdgeInsets.all(0.0),
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.remove_red_eye,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed:
                                              _toggle, // icon is 48px widget.
                                        ),
                                      ),
                                      obscureText: _obscureText,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        if (value.trim().length < 8) {
                                          return 'Password must be at least 8 characters in length';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => _password = value,
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                      ),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: _userEmail.isNotEmpty &&
                                                _password.isNotEmpty
                                            ? setTimeout
                                            : () {},
                                        child: !appear
                                            ? const Text(
                                                'Login',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Create new account',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  body: Container(
                    child: Text("Error creating"),
                  ),
                );
        });
  }
}
