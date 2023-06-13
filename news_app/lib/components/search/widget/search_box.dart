// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0 / 4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 28,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          fillColor: Colors.grey,
          filled: true,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 28,
          ),
          suffixIcon: IconButton(
            splashRadius: 25,
            onPressed: pressSuffix,
            icon: Icon(
              Icons.tune,
              size: 28,
            ),
          ),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0 / 2,
          ),
        ),
      ),
    );
  }
}
