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
enum filterOption {
  all, favorite
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ItemProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {

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
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == filterOption.all) {
                  isFavorite = false;
                } else {
                  isFavorite = true;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: filterOption.all,
                  child: Text('Show all')
              ),
              const PopupMenuItem(
                  value: filterOption.favorite,
                  child: Text('Favorite')
              ),
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
      body: SwipeBody(isFavorite: isFavorite,)
    );
  }
}

