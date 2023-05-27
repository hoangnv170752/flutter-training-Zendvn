import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';

class Bt2505 extends StatefulWidget {
  @override
  _Bt2505State createState() => _Bt2505State();
}

class _Bt2505State extends State<Bt2505> {
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
    return Scaffold(
      appBar: AppBar(title: const Text("BT 25-05")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Consumer<Counter>(builder: (context, value, child) {
            //       return Text(
            //         value.getCounter.toString(),
            //         style: TextStyle(
            //             fontSize: 22, fontFamily: value.getFont.toString()),
            //       );
            //     }),
            //     FloatingActionButton(
            //       onPressed: () {
            //         Provider.of<Counter>(context, listen: false).changeFont();
            //       },
            //       child: const Text("Change Font"),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         Provider.of<Counter>(context, listen: false).delFont();
            //       },
            //       child: const Text("Delete Font"),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 24,
            // ),
            // Consumer<Counter>(builder: (context, value, child) {
            //   return Text(
            //     value.getCounter.toString(),
            //     style: const TextStyle(fontSize: 22),
            //   );
            // }),
            const SizedBox(
              height: 24,
            ),
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 60.0),
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(_items[index]["id"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber.shade100,
                          child: ListTile(
                            leading: Text(_items[index]["id"].toString()),
                            title: Text(_items[index]["name"]),
                            subtitle: Image.network(
                                _items[index]["image"].toString()),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         Provider.of<Counter>(context, listen: false).decreaseCounter();
      //       },
      //       child: const Text("-"),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         Provider.of<Counter>(context, listen: false).addCounter();
      //       },
      //       child: Text("+"),
      //     ),
      //   ],
      // ),
    );
  }
}
