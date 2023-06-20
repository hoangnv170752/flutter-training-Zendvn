import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'slug')
  String slug;
  @JsonKey(name: 'link')
  String link;
  @JsonKey(name: 'created_at')
  DateTime? created;
  @JsonKey(name: 'updated_at')
  DateTime? updated;
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.link,
    this.created,
    this.updated,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
