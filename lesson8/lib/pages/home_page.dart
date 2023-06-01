import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              checkValue ? 'Dark theme' : 'Light theme',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            Transform.scale(
              scale: 2.0,
              child: Switch(
                value: checkValue,
                onChanged: (value) {
                  context.read<ThemeProvider>().changeTheme(!value);
                  setState(() {
                    checkValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
