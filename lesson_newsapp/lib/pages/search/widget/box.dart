import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    this.onChanged,
    this.controller,
    this.pressSuffix,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final VoidCallback? pressSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppConstant.cDefaultPadding,
        right: AppConstant.cDefaultPadding,
        bottom: AppConstant.cDefaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.cDefaultPadding,
        vertical: AppConstant.cDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: AppColor.cSearchBar,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          fillColor: AppColor.cSearchBar,
          filled: true,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hoverColor: Colors.transparent,
          prefixIcon: Icon(
            Icons.search,
            size: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
          suffixIcon: IconButton(
            splashRadius: 25,
            onPressed: pressSuffix,
            icon: Icon(
              Icons.tune,
              size: Theme.of(context).textTheme.titleMedium!.fontSize,
            ),
          ),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.titleMedium,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppConstant.cDefaultPadding,
            vertical: AppConstant.cDefaultPadding / 2,
          ),
        ),
      ),
    );
  }
}
