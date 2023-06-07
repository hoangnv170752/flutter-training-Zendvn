import 'package:flutter/material.dart';
import 'package:lesson9/pages/SignupPage.dart';

import '../components/TextFormField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) => _userEmail = value,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            if (value.trim().length < 4) {
                              return 'Username must be at least 4 characters in length';
                            }
                            return null;
                          },
                          onChanged: (value) => _userName = value,
                        ),
                        TextForm(),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            if (value != _password) {
                              return 'Confimation password does not match the entered password';
                            }
                            return null;
                          },
                          onChanged: (value) => _confirmPassword = value,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: _trySubmitForm,
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
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
                                  builder: (context) => const SignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Already have an account? Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
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
    );
  }
}
