import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Items = Provider.of<ProductProvider>(context).getItemIsFavorite();
    var itemFavCount = Provider.of<ProductProvider>(context).getItemIsFavorite().length;
    print(Items);
    return (Items == [])  ? Center(
        child: Text('Chưa có thành phần nào')
    ) : ListView.builder(
        itemCount: Items.length,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
            value: Items[index],
            child: Dismissible(
              confirmDismiss: (direction) async {
               return await showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Xóa dữ liệu'),
                    content: const Text('Xóa món ăn yêu thích'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Xóa'),
                      ),
                    ],
                  ),
                );
              },
              onDismissed: ((direction) {
                Items[index].handleRemoveIsFavorite();
                print(itemFavCount);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã xóa thành công!!'))
                );
              }),
              key: ValueKey<int>(index),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: GridTile(
                      footer: GridTileBar(
                        title: Text(
                            Items[index].title, style: styleTitleItem,
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
                            image: AssetImage(Items[index].image)
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ),
          ) ;
        },
    );
  }
}