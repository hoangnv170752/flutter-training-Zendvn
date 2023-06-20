part of 'category_model.dart';

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      link: json['link'] as String,
      created: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'link': instance.link,
      'created_at': instance.created?.toIso8601String(),
      'updated_at': instance.updated?.toIso8601String(),
    };
