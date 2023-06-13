import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/data_class.dart';
import 'package:provider/provider.dart';

class Categorie extends StatefulWidget {
  const Categorie({Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: !category.loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : GridView.count(
              primary: false,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(150),
              children: List.generate(
                8,
                (index) {
                  return Center(
                    child: Text(
                      category.post[index]!.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
