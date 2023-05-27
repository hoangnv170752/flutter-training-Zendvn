import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';

class Bt1 extends StatefulWidget {
  @override
  _Bt1State createState() => _Bt1State();
}

class _Bt1State extends State<Bt1> {
  int count = 0;
  Timer? timer;
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/category.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<Counter>(context).getCounter;
    String testing = Provider.of<Counter>(context).getFont;
    String image = Provider.of<Counter>(context).getImage;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bt 27-05", style: TextStyle(fontFamily: 'Tomorrow')),
            centerTitle: true,
            backgroundColor: Theme.of(context).backgroundColor,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Color.fromARGB(255, 123, 201, 95),
                  Colors.blue
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.text_format)),
                Tab(icon: Icon(Icons.image_search_outlined)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<Counter>(builder: (context, value, child) {
                      return Text(
                        value.getFont,
                        style: TextStyle(
                            fontSize: 22, fontFamily: value.getFont.toString()),
                      );
                    }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () {
                            Provider.of<Counter>(context, listen: false)
                                .changeFont();
                          },
                          label: const Text(
                            "Dancing Font",
                            maxLines: 1,
                          ),
                          backgroundColor: Colors.pink,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Provider.of<Counter>(context, listen: false)
                                .delFont();
                          },
                          label: const Text(
                            "Standing Font",
                            maxLines: 1,
                          ),
                          backgroundColor: Color.fromARGB(255, 77, 50, 226),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<Counter>(builder: (context, value, child) {
                      return Image(
                        image: AssetImage(value.getImage),
                        width: 250,
                        height: 250,
                      );
                    }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () {
                            Provider.of<Counter>(context, listen: false)
                                .changeImage();
                          },
                          label: const Text(
                            "Jungle",
                            maxLines: 1,
                          ),
                          backgroundColor: Colors.pink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Provider.of<Counter>(context, listen: false)
                                .changeImage2();
                          },
                          label: const Text(
                            "Wall",
                            maxLines: 1,
                          ),
                          backgroundColor: Color.fromARGB(255, 77, 50, 226),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
