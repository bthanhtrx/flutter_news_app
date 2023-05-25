import 'dart:convert';

import 'package:flutter_news_app/response/news_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  static const API_KEY = 'pub_21201ff92cbd998049bf5f98aca6a45d202f6';
  static const BASE_URL = 'https://newsdata.io/api/1/news';
  static final BASE_QUERY = '&apikey=$API_KEY';

  Future<NewsResponse> fetchNews(String arg, String country) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?category=$arg&country=$country$BASE_QUERY'));
    if (response.statusCode == 200) {
      final result = jsonDecode(utf8.decode(response.bodyBytes));
      // final result = utf8.decode(response.bodyBytes);
      print('api: $result');
      return NewsResponse.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
