import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                height: 200,
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: dColorFooterImage,
                    title: Text(
                      product.title,
                      style: styleTitleItem,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (() {
                            product.toggleIsFavorite();
                          }),
                          child: Icon(
                              Icons.favorite,
                              size: sizeIconButton,
                              color: product.isFavorite ? Colors.red : Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            product.favorite,
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
                            product.view,
                            style: styleTitleCardItem ,
                        )
                    ],),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(product.image, fit: BoxFit.cover,)
                  ),
                ),
    );
  }
}