import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework3/provider/album_provider.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';

import '../components/Category.dart';

class Bt2 extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AlbumProvider().readJson(),
      builder: (BuildContext content, AsyncSnapshot snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        var categoryItem = snapshot.hasData ? snapshot.data : [];
        print(categoryItem);
        return snapshot.hasData
            ?
            // GridView.builder(
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10),
            //     itemCount: categoryItem.length,
            //     itemBuilder: (BuildContext context, int index) {
            Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(categoryItem[1].image),
                      opacity: 10.0,
                    ),
                  ),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(context, CategoryPage.routeName,
                                arguments: {
                                  "id": categoryItem[index].id.toString(),
                                  "name": categoryItem[index].name,
                                  "image": categoryItem[index].image,
                                  "description":
                                      categoryItem[index].description,
                                });
                          }),
                          child: Container(
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 92, 217, 231)
                                      .withAlpha(60),
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    0.0,
                                    3.0,
                                  ),
                                ),
                              ],
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(categoryItem[index].image),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                  ),
                                  child: Text(
                                    categoryItem[index].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 3,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: RatingBarIndicator(
                                          rating: 4,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          unratedColor:
                                              Colors.amber.withAlpha(50),
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 25,
                                        ),
                                        child: Text(
                                          categoryItem[index].description,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    autoplay: false,
                    itemCount: categoryItem.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              )
            : Center(
                child: Text("Không có dữ liệu"),
              );
      },
    );
  }
}
