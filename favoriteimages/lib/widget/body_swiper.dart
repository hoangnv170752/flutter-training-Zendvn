import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({Key? key, required this.items}) : super(key: key);

  final items;
  @override
  Widget build(BuildContext context) {
    return Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 300.0,
        itemHeight: 600.0,
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              child: Image.asset(items[index].image,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                title: Icon(Icons.favorite),
                subtitle: Text('Like'),
                trailing: Text(items[index].name , style: TextStyle(color: Colors.white),),
              ),
            ),
          );
        });
  }
}
