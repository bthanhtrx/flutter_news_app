import 'dart:convert';

import 'package:flutter_news_app/model/article.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Article> results;
  final String? nextPage;

  NewsResponse(
      {required this.status,
      required this.totalResults,
      required this.results,
      required this.nextPage});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    List list = json['results'];
    List<Article> articles = list.map((e) => Article.fromJson(e)).toList();

    return NewsResponse(
        status: json['status'],
        totalResults: json['totalResults'],
        results: articles,
        nextPage: json['nextPage']);
  }
}
