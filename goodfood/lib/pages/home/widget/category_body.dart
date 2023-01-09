import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);

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
                          Consumer<Product>(builder: (((context, value, child) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: (() {
                                    value.toggleIsFavorite();
                                  }),
                                  child: Icon(
                                      Icons.favorite,
                                      size: sizeIconButton,
                                      color: value.isFavorite ? Colors.red : Colors.white,
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  value.favorite,
                                  style: styleTitleCardItem ,
                              )
                              ]
                          );}
                          ))),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                            Icons.timelapse_sharp,
                            size: sizeIconButton,
                        ),
                        const SizedBox(
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