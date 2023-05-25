// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      title: json['title'] as String?,
      link: json['link'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      creator: (json['creator'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      video_url: json['video_url'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      pubDate: json['pubDate'] as String?,
      image_url: json['image_url'] as String?,
      source_id: json['source_id'] as String?,
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      country: (json['country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'keywords': instance.keywords,
      'creator': instance.creator,
      'video_url': instance.video_url,
      'description': instance.description,
      'content': instance.content,
      'pubDate': instance.pubDate,
      'image_url': instance.image_url,
      'source_id': instance.source_id,
      'category': instance.category,
      'country': instance.country,
      'language': instance.language,
    };
