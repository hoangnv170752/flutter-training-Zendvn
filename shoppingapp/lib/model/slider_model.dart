import 'dart:convert';

class Slider {
  int id;
  String name;
  String image;
  Slider({
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

  factory Slider.fromMap(Map<String, dynamic> map) {
    return Slider(id: map['id'], name: map['name'], image: map['image']);
  }

  String toJson() => json.encode(toMap());

  factory Slider.fromJson(String source) => Slider.fromMap(json.decode(source));
}
