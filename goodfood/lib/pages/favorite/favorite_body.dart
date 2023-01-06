import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey<int>(index),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: GridTile(
                  footer: GridTileBar(
                    title: Text(
                        'Loren Ipsum', style: styleTitleItem,
                    ),
                    trailing: Icon(Icons.swipe, size: sizeIconButton, color: dColorIconButtonInactive,),
                    backgroundColor: Colors.white70,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/246/163/668/warcraft-iii-reforged-blizzard-entertainment-warcraft-hd-wallpaper-preview.jpg')
                      )
                    ),
                  ),
                ),
              ),
            )
          );
        },
    );
  }
}