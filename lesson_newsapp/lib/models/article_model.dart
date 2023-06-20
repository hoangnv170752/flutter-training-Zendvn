import 'package:json_annotation/json_annotation.dart';
import 'package:lesson_newsapp/models/category_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'category_id')
  int categoryId;

  @JsonKey(name: 'publish_date')
  DateTime publish;

  @JsonKey(name: 'created_at')
  DateTime created;

  @JsonKey(name: 'updated_at')
  DateTime update;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'is_crawl')
  int isCrawl;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'category')
  CategoryModel category;

  ArticleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.thumb,
    required this.categoryId,
    required this.publish,
    required this.created,
    required this.update,
    required this.slug,
    required this.link,
    required this.author,
    required this.isCrawl,
    required this.status,
    required this.category,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
