import 'package:favoriteimages/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favoriteimages/widget/body_swiper.dart';
import 'model/item_model.dart';
import 'package:badges/badges.dart';


void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ItemProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemProvider>(context, listen: false).readJson();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Images'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (_) => [
            const PopupMenuItem(child: Text('Show all')),
            const PopupMenuItem(child: Text('Favorite')),
          ],),
        ],
       /* leading: Padding(
            padding:EdgeInsets.all(12), 
            child: Consumer<ItemProvider>(
              builder: (context, item, child) {
                return Badge(
                  badgeContent: Text(
                    item.favorite.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(Icons.favorite),
                );
              },
            )), */
        elevation: 10.0,
      ),
      body: SwipeBody()
    );
  }
}

