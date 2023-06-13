// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/category_provider.dart';

class SelectBox extends StatefulWidget {
  const SelectBox({
    Key? key,
    required this.id,
    required this.name,
    required this.color,
    this.selected = false,
  }) : super(key: key);

  final int id;
  final String name;
  final String color;
  final bool selected;

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  bool check = false;

  @override
  void initState() {
    super.initState();
    check = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 32,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CategoryProvider>().handleSelect(widget.id);
              setState(() {
                check = !check;
              });
            },
            child: Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: check ? Colors.amber : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
