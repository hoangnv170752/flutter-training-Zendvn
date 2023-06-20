import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/pages/search/widget/box.dart';
import 'package:lesson_newsapp/pages/search/widget/list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const String routerName = '/search_page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SearchBox(),
                const SearchList(),
                ListView.separated(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstant.cDefaultPadding),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(height: size.height * 0.02);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: size.height * 0.02);
                  },
                  itemCount: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
