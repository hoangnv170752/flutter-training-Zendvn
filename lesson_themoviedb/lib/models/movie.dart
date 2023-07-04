// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Movie extends ChangeNotifier {
  final int id;
  final String title;
  final String overview;
  final String poster_path;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? poster_path,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      poster_path: poster_path ?? this.poster_path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': poster_path,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      overview: map['overview'] as String,
      poster_path: map['poster_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, poster_path: $poster_path)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.poster_path == poster_path;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        poster_path.hashCode;
  }
}
