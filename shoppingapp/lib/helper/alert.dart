import 'package:flutter/material.dart';

AlertDialog alertLoading = AlertDialog(
  content: Row(
    children: [
      const CircularProgressIndicator(),
      Container(
        margin: const EdgeInsets.only(left: 35),
        child: Text("loading..."),
      )
    ],
  ),
);

AlertDialog alertSuccess = AlertDialog(
  content: Row(
    children: [
      const Icon(
        Icons.check,
        size: 45,
        color: Colors.green,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: Text('Mua hàng thành công!!'),
      )
    ],
  ),
);
