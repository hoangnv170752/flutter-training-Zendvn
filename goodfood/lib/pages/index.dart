import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/favorite/favorite_body.dart';
import 'package:goodfood/pages/home/home_body.dart';
import 'package:goodfood/pages/home/widget/category.dart';
import 'package:goodfood/pages/seen/seen_body.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'home/widget/product.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    const FavoriteBody(),
    const SeenBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductProvider>(context).readJson(),
      builder: (BuildContext content , AsyncSnapshot snapshot) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Routing screens"),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color.fromARGB(255, 123, 201, 95), Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_sharp),
            label: 'Seen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: dColorIconButtonActive,
        onTap: _onItemTapped,
        backgroundColor: dColorCustom,
        iconSize: sizeIconButton, 
        unselectedItemColor: dColorIconButtonInactive,
      ),
    );
    });
  }
}
