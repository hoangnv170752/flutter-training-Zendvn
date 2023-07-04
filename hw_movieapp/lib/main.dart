import 'package:flutter/material.dart';
import 'package:hw_movieapp/screens/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'utils/constants.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hw Movies App',
          theme: ThemeData.dark().copyWith(
            platform: TargetPlatform.iOS,
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryColor,
          ),
          home: HomeScreen(
            key: kHomeScreenKey,
          ),
          // home: Scaffold(
          //   appBar: AppBar(
          //     title: SizedBox(
          //       child: Text("Hello"),
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
