import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/auth_provider.dart';

class AuthPage extends StatelessWidget {
  static const routerName = '/auth';
  AuthPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      final email = _emailController.text;
      final password = _passwordController.text;
      if (email.isNotEmpty && password.isNotEmpty) {
        Provider.of<AuthProvider>(context, listen: false)
            .login(email, password);
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color.fromARGB(255, 123, 201, 95), Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
