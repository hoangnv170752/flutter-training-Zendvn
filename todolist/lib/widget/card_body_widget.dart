import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class CardBody extends StatelessWidget {
  CardBody({Key? key, required this.item, required this.handleEdit, required this.handleDelete, required this.index}) : super(key: key);
  var item;
  var index;
  final Function handleDelete;
  final Function handleEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index%2 == 0) ? const Color.fromARGB(255, 51, 240, 246) : const Color.fromARGB(255, 241, 141, 233),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleEdit(item.id);
                }
                return print('pressedEdit');
              },
              child: Icon(
                Icons.edit_outlined,
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return print('pressedCancel');
              },
              child: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
