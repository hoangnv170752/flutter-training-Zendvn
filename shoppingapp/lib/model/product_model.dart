// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  int id;
  String name;
  String image;
  int price;
  int price_sale_off;
  bool special;
  String summary;
  String description;
  bool is_new;
  int category_id;
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.price_sale_off,
    required this.special,
    required this.summary,
    required this.description,
    required this.is_new,
    required this.category_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'price_sale_off': price_sale_off,
      'special': special,
      'summary': summary,
      'description': description,
      'is_new': is_new,
      'category_id': category_id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      price_sale_off: map['price_sale_off'] as int,
      special: map['special'] as bool,
      summary: map['summary'] as String,
      description: map['description'] as String,
      is_new: map['is_new'] as bool,
      category_id: map['category_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
