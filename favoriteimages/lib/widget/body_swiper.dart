import 'package:favoriteimages/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import '../model/item_model.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;
    return Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 300.0,
        itemHeight: 600.0,
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return ChangeNotifierProvider.value(
            value: items[index],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                child: Image.asset(items[index].image,
                  fit: BoxFit.cover,
                ),
                footer: GridTileBar(
                  title: Consumer<Item>(
                    builder: (context, item, child) {
                      return InkWell(
                        onTap: (() {
                          item.toggleIsFavorite();
                        }), 
                        child: Icon(
                          Icons.favorite,
                          size:30,
                          color: item.isFavorite ? Colors.red : Colors.white,
                        ),
                      ); 
                    },
                
                  ),
                  subtitle: Text('Like'),
                  trailing: Text(items[index].name , style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          );
        });
  }
}
