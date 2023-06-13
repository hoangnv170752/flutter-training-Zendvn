// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app/components/home/widget/drawer.dart';
import 'package:news_app/pages/Categorie.dart';

import '../components/home/widget/button.dart';
import '../components/search/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routerName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: NewsButton(
          icon: Icons.menu,
          press: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          NewsButton(
            icon: Icons.search,
            press: () {
              Navigator.pushNamed(context, NewsSearchPage.routerName);
            },
          ),
        ],
      ),
      drawer: NewsDrawer(),
      body: SafeArea(
        child: Center(
          child: Text(
            'Content',
          ),
        ),
      ),
    );
  }
}
