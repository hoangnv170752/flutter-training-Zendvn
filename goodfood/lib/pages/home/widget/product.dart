import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://c4.wallpaperflare.com/wallpaper/246/163/668/warcraft-iii-reforged-blizzard-entertainment-warcraft-hd-wallpaper-preview.jpg'
                  ))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                      ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 10,),
                      Text('123')],
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                      ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timelapse_sharp),
                      SizedBox(width: 10,),
                      Text('123')],
                  ),
                ),
              ],
            ),
        ),
          flex: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text('loren ipsum '),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                      ),
                      child: Center(child: Text('Nguyên liệu', style: styleTitleItem,),),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(2),

                      ),
                        child: Text(
                            'Loren ipsum'
                        )
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                      ),
                      child: Center(child: Text('Nguyên liệu', style: styleTitleItem,),),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                            'Loren ipsum'
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          flex: 2,
        )
      ],
    );
  }
}
