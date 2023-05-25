import 'package:flutter_news_app/response/news_response.dart';
import 'package:flutter_news_app/services/api_service.dart';
import 'package:flutter_news_app/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';


final newsResponseProvier =
    FutureProvider.family<NewsResponse, Tuple2>((ref, arg) {
  return ref.watch(apiServiceProvider).fetchNews(arg.item1, arg.item2);
});

final countryCodeProvider = StateProvider<String>((ref) {
  return Constant.countryCode;
});
