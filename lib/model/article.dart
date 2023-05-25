import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article{
  // final String? title;
  // final String? link;
  // final List<String>? keywords;
  // final List<String>? creator;
  // final String? video_url;
  // final String? description;
  // final String? content;
  // final String? pubDate;
  // final String? image_url;
  // final String? source_id;
  // final List<String>? category;
  // final List<String>? country;
  // final String? language;

  factory Article({
    required String? title,
    required String? link,
    @Default([]) List<String>? keywords,
    @Default([]) List<String>? creator,
    required String? video_url,
    required String? description,
    required String? content,
    required String? pubDate,
    required String? image_url,
    required String? source_id,
    @Default([]) List<String>? category,
    @Default([]) List<String>? country,
    required String? language,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

}
