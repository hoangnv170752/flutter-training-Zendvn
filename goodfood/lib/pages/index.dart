import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/favorite/favorite_body.dart';
import 'package:goodfood/pages/home/home_body.dart';
import 'package:goodfood/pages/home/widget/category.dart';
import 'package:goodfood/pages/seen/seen_body.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../models/product.dart';
import 'home/widget/product.dart';

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

  @override
  void didChangeDependencies() {
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
    super.didChangeDependencies();
  }

  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    const FavoriteBody(),
    const SeenBody()
  ];

  void screenNameChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          screenName = "Home screen";
          break;
        case 1:
          screenName = "Favorite screen";
          break;
        case 2:
          screenName = "Seen screen";
          break;
        default:
          screenName = "Unknown";
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      screenNameChanged(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var itemFavCount =
        Provider.of<ProductProvider>(context).getItemIsFavorite().length;
    var itemSeenCount = Provider.of<ProductProvider>(context)
        .getItemsIsSeen()
        .length
        .toString();
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
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Badge(child: Icon(Icons.favorite)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    child: badges.Badge(
                      child: Icon(Icons.favorite),
                      badgeContent: Text('$itemFavCount'),
                    ),
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: badges.Badge(
                    child: Icon(Icons.timelapse_sharp),
                    badgeContent: Text('$itemSeenCount'),
                  ),
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
