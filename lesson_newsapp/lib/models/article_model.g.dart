part of 'article_model.dart';

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      thumb: json['thumb'] as String,
      categoryId: json['category_id'] as int,
      publish: DateTime.parse(json['publish_date'] as String),
      created: DateTime.parse(json['created_at'] as String),
      update: DateTime.parse(json['updated_at'] as String),
      slug: json['slug'] as String,
      link: json['link'] as String,
      author: json['author'] as String,
      isCrawl: json['is_crawl'] as int,
      status: json['status'] as int,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'thumb': instance.thumb,
      'category_id': instance.categoryId,
      'publish_date': instance.publish.toIso8601String(),
      'created_at': instance.created.toIso8601String(),
      'updated_at': instance.update.toIso8601String(),
      'slug': instance.slug,
      'link': instance.link,
      'author': instance.author,
      'is_crawl': instance.isCrawl,
      'status': instance.status,
      'category': instance.category,
    };
