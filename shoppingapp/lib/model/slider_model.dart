import 'dart:convert';

class Sli {
  int id;
  String name;
  String image;
  Sli({
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

  factory Sli.fromMap(Map<String, dynamic> map) {
    return Sli(id: map['id'], name: map['name'], image: map['image']);
  }

  String toJson() => json.encode(toMap());

  factory Sli.fromJson(String source) => Sli.fromMap(json.decode(source));
}
