import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/article.dart';
import 'package:flutter_news_app/provider/data_provider.dart';
import 'package:flutter_news_app/screens/article_detail_screen.dart';
import 'package:flutter_news_app/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

class NewsListingScreen extends ConsumerWidget {
  String category;

  NewsListingScreen({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Tuple2<String, String>(category, Constant.countryCode);

    final newsResponse = ref.watch(newsResponseProvier(t));
    return Center(
      child: Container(
          child: newsResponse.when(
        data: (data) {
          List<Article> listArticles = data.results;
          print(listArticles);
          return RefreshIndicator(
            onRefresh: () async {
              return ref.refresh(newsResponseProvier(t).future);
            },
            child: ListView.builder(
              itemCount: listArticles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailScreen(article: listArticles[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      listArticles[index].title ?? 'no title',
                    ),
                    subtitle: Text(listArticles[index].pubDate ?? 'no date'),
                    leading: CachedNetworkImage(
                      imageUrl: listArticles[index].image_url ?? '',
                      placeholder: (context, url) =>
                          Image.asset('asset/images/news-default.jpeg'),
                      errorWidget: (context, url, error) =>
                          Image.asset('asset/images/news-default.jpeg'),
                    ),
                    // leading: CircleAvatar(
                    //   radius: 30,
                    //   backgroundImage:
                    //       NetworkImage(listArticles[index].image_url ?? ''),
                    //   child: FadeInImage.assetNetwork(
                    //     placeholder: 'asset/images/news-default.jpeg',
                    //     image: listArticles[index].image_url ?? '',
                    //     imageErrorBuilder: (context, error, stackTrace) =>
                    //         Image.asset('asset/images/news-default.jpeg'),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(
            'Error: ${error.toString()}, \nStackTrace: ${stackTrace.toString()}'),
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}
