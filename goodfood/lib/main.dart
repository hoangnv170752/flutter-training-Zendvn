import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/home/widget/category.dart';
import 'package:goodfood/pages/home/widget/product.dart';
import 'package:goodfood/pages/index.dart';
import 'package:goodfood/providers/category_provider.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

/*Sửa tên category screen cho đúng  (done)
  Khi người dùng vào trang mà không thấy có sản phẩm nào thì nên hiện thông báo (Task 3)
  Task 1: Thêm những cái badge số đếm cho biết có bao nhiêu sản phẩm được yêu thích / sản phẩm đã được xem (da sua thanh cai badge)
  Task 2: Bổ sung nút xóa tất cả các sản phẩm được yêu thích
  Task 3: Show ra những màn hình rỗng (hiển thị hình ảnh hay gì thay thế nếu không có favorite nào , v.v..)
  Task 4: Chức năng search | có nút search ở góc màn hình  => chuyển sang màn hình những sản phẩm được tìm thấy với từ khóa được highlight (can hoi huong thuc hien)
  Task 5: Đổi font cho title screen
*/
void main(List<String> args) {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(backgroundColor: dColorMain),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MyApp.routeName: ((context) => MyApp()),
        CategoryPage.routeName: ((context) => CategoryPage()),
        ProductPage.routeName: ((context) => ProductPage())
      },
  ),)
  );
}
