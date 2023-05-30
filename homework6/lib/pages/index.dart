import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  String screenName = "Home screen";
  late Future _dataFuture;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var delAllFav = Provider.of<Product>(context).handleRemoveAllFavorite();
    // var delAllSeen = Provider.of<Product>(context).handleRemoveAllSeen();
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(screenName, style: TextStyle(fontFamily: 'Tomorrow')),
              centerTitle: true,
              backgroundColor: Theme.of(context).backgroundColor,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Color.fromARGB(255, 123, 201, 95),
                    Colors.blue
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
              actions: [
                PopupMenuButton(
                  onSelected: (value) {
                    setState(() {
                      if (value == 0) {
                        //  delAllFav();
                      } else if (value == 1) {
                        //  delAllSeen();
                      }
                    });
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Text('Delete all fav'),
                    ),
                    const PopupMenuItem(
                        value: 1, child: Text('Delete all seen')),
                  ],
                ),
              ],
            ),
            body: Center(),
          );
        });
  }
}
