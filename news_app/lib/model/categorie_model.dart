import 'dart:convert';

class CategoryModel {
  int id;
  String name;
  bool isFavorite;
  String image;
  String color;

  CategoryModel({
    required this.id,
    required this.name,
    this.isFavorite = false,
    this.image = '',
    this.color = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isFavorite': isFavorite,
      'image': image,
      'color': color,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      isFavorite: map['isFavorite'] as bool,
      image: map['image'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
