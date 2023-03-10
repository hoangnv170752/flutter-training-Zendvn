import 'dart:convert';

class Category {
  int id;
  String name;
  String image;
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(id: map['id'], name: map['name'], image: map['image']);
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
