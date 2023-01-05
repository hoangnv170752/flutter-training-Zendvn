import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            //color: Colors.amber,
            width: double.infinity,
            height: 200,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: dColorFooterImage,
                title: Text(
                  'data',
                  style: styleTitleItem,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.favorite,
                        size: sizeIconButton,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        '444',
                        style: styleTitleCardItem ,
                    ),
                    Icon(
                        Icons.timelapse_sharp,
                        size: sizeIconButton,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        '222',
                        style: styleTitleCardItem ,
                    )
                ],),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://c4.wallpaperflare.com/wallpaper/246/163/668/warcraft-iii-reforged-blizzard-entertainment-warcraft-hd-wallpaper-preview.jpg', fit: BoxFit.cover,
                  )
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemCount: 10
    );
  }
}
