// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:provider/provider.dart';

class SelectBox extends StatefulWidget {
  const SelectBox({
    Key? key,
    required this.id,
    required this.name,
    this.selected = false,
  }) : super(key: key);

  final int id;
  final String name;
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
      padding: EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.primaries[widget.id],
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.titleMedium,
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
              height: Theme.of(context).textTheme.titleMedium!.fontSize,
              width: Theme.of(context).textTheme.titleMedium!.fontSize,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.cWhite,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      check ? AppColor.cBoxSelected : AppColor.cBoxUnselected,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
