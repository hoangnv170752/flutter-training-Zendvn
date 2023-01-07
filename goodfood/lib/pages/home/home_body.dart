import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/home/widget/category.dart';

import '../../providers/category_provider.dart';
class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().readJson(),
        builder: (BuildContext content , AsyncSnapshot snapshot) {
          print(snapshot);
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, CategoryPage.routeName, arguments: {
                "title" : index
              });
            },
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/246/163/668/warcraft-iii-reforged-blizzard-entertainment-warcraft-hd-wallpaper-preview.jpg'))
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Loren Ipsum',
                        style: styleTitleItem,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ))
              ],
            ),
          );
        },
      );
    }
    );
  }
}