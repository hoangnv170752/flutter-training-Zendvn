import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({super.key});

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
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

    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        if (value.trim().length < 8) {
          return 'Password must be at least 8 characters in length';
        }
        return null;
      },
      onChanged: (value) => _password = value,
    );
  }
}
