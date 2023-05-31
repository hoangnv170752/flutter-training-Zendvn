// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Album extends ChangeNotifier {
  int id;
  String name;
  String image;
  String description;
  bool isFavorite = false;
  Album({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });
  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Album copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) =>
      Album.fromMap(json.decode(source) as Map<String, dynamic>);
}
