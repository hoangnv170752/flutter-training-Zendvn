// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String image;
  final String name;
  final int price;
  final int quantity;
  CartItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier {
  Map<int, CartItem> items = {};
  void addCart(int productId, String image, String name, int price,
      [int quantity = 1]) {
    if (items.containsKey(productId)) {
      items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          image: value.image,
          name: value.name,
          price: value.price,
          quantity: value.quantity + quantity,
        ),
      );
    } else {
      items.putIfAbsent(
          productId,
          () => CartItem(
              id: productId,
              image: image,
              name: name,
              price: price,
              quantity: quantity));
    }
    notifyListeners();
  }

  void increase(int productId, [int quantity = 1]) {
    items.update(
      productId,
      (value) => CartItem(
        id: value.id,
        image: value.image,
        name: value.name,
        price: value.price,
        quantity: value.quantity + quantity,
      ),
    );
    notifyListeners();
  }

  void decrease(int productId, [int quantity = 1]) {
    if (items[productId]?.quantity == quantity) {
      items.removeWhere((key, value) => key == productId);
    } else {
      items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          image: value.image,
          name: value.name,
          price: value.price,
          quantity: value.quantity - quantity,
        ),
      );
    }
    notifyListeners();
  }
}
