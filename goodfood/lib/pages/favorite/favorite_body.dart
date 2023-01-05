import 'package:flutter/material.dart';
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: ((context, index) {
          return SizedBox(
            height: 20,
          );
        }),
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: ValueKey<int>(index),
            child: GridTile(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/246/163/668/warcraft-iii-reforged-blizzard-entertainment-warcraft-hd-wallpaper-preview.jpg')
                  )
                ),
              ),
            )
          );
        },
    );
  }
}