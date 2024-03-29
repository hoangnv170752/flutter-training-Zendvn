// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/pages/category/category_page.dart';
import 'package:lesson_newsapp/pages/wait/wait_screen.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({
    Key? key,
    required this.control,
  }) : super(key: key);

  final AdvancedDrawerController control;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.65,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff005BEA),
            Color(0xff3DA2F2),
            Color(0xff22CFFE),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        children: [
          Container(
            height: size.height * 0.15,
            margin: EdgeInsets.symmetric(vertical: AppConstant.cDefaultMargin),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstant.cAssetImgIconAppNews),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'APP TIN TUC',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.05),
          ListTile(
            title: Text('Trang Chu',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.cMenuActive)),
            onTap: () {
              control.hideDrawer();
            },
          ),
          ListTile(
            title: Text('Danh Muc',
                style: Theme.of(context).textTheme.titleMedium),
            onTap: () {
              control.hideDrawer();
              Navigator.pushNamed(context, CategoryPage.routerName);
            },
          ),
          ListTile(
            title: Text('Yeu Thich',
                style: Theme.of(context).textTheme.titleMedium),
            onTap: () {
              control.hideDrawer();
            },
          ),
          ListTile(
            title:
                Text('Da Xem', style: Theme.of(context).textTheme.titleMedium),
            onTap: () {
              control.hideDrawer();
            },
          ),
          ListTile(
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WaitScreen.routerName,
                    );
                  },
                  child: Text('Dang Xuat',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            onTap: () {
              control.hideDrawer();
            },
          ),
        ],
      ),
    );
  }
}
