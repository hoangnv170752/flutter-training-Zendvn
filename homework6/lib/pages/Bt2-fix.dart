import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework3/provider/album_provider.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../components/Category.dart';
import '../models/Album.dart';

class Bt2fix extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AlbumProvider().readJson(),
      builder: (BuildContext content, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        var categoryItem = snapshot.hasData ? snapshot.data : [];
        List<Album> album = categoryItem;
        print(categoryItem);
        return snapshot.hasData
            ? Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                      padding: EdgeInsets.all(10),
                      child: Consumer<AlbumProvider>(
                        builder: (context, item, child) {
                          return badges.Badge(
                            badgeContent: Text(
                              item.countItemFavorite.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Icon(Icons.favorite),
                          );
                        },
                      )),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    )
                  ],
                ),
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(categoryItem[1].image),
                      opacity: 10.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              scrollDirection: Axis.vertical,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              viewportFraction: 0.7,
                            ),
                            items: album.map(
                              (i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: (() {
                                              Navigator.pushNamed(context,
                                                  CategoryPage.routeName,
                                                  arguments: {
                                                    "id": i.id.toString(),
                                                    "name": i.name,
                                                    "image": i.image,
                                                    "description":
                                                        i.description,
                                                  });
                                            }),
                                            child: Container(
                                              height: 500,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 92, 217, 231)
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
                                                  image: NetworkImage(i.image),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 20,
                                                          top: 20,
                                                        ),
                                                        child: Container(
                                                          width: 300,
                                                          child: Text(
                                                            i.name,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 20,
                                                        right: 15,
                                                        child: StatefulBuilder(
                                                            builder: (context,
                                                                setItem) {
                                                          return InkWell(
                                                            onTap: () {
                                                              print(
                                                                  i.isFavorite);
                                                              print(i.name);

                                                              setItem(() => i
                                                                  .toggleIsFavorite());
                                                              Provider.of<AlbumProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .handleCountItemFav();
                                                            },
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  i.isFavorite
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .red,
                                                            ),
                                                          );
                                                        }),
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                    flex: 3,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 20,
                                                          ),
                                                          child:
                                                              RatingBarIndicator(
                                                            rating: 4,
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            itemCount: 5,
                                                            itemSize: 20.0,
                                                            unratedColor: Colors
                                                                .amber
                                                                .withAlpha(50),
                                                            direction:
                                                                Axis.horizontal,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 20,
                                                            top: 25,
                                                          ),
                                                          child: Text(
                                                            i.description,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
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
