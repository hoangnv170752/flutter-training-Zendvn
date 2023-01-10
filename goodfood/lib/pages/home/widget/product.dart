import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:flutter/services.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';
class ProductPage extends StatefulWidget {
  static const routeName = '/product';
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool change = true;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var product = Provider.of<ProductProvider>(context).getItemWithId(arg['id']);
    product.toggleIsSeen();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/background_product.png"),fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(product.image)
                  )
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:[ 
                    Positioned(
                      top: 20,
                      left: 30,
                      child: BackButton(color: dColorIconButtonInactive),
                      ),
                    Row(
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
                            InkWell(
                              onTap: (() {
                                product.toggleIsFavorite();
                                setState(() {
                                  change = !change;
                                });
                              }),
                              child: Icon(
                                Icons.favorite,
                                color: product.isFavorite ? dColorIconButtonActive : dColorIconButtonInactive,
                                ),
                            ),
                            SizedBox(width: 10,),
                            Text(product.favorite)],
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
                            Text(product.view)],
                        ),
                      ),
                    ],
                  ),]
                ),
            ),
              flex: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(product.title),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Container(
                          width: 167,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          child: Center(child: Text('Nguyên liệu', style: styleTitleItem,),),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
          
                          ),
                            child: Text(
                                product.ingredients
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
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          child: Center(child: Text('Cách làm', style: styleTitleItem,),),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                                product.instructions
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
        ),
      ),
    );
  }
}
