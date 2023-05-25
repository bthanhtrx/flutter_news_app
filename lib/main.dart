import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/news_listing_screen.dart';
import 'package:flutter_news_app/screens/settings_screen.dart';
import 'package:flutter_news_app/utils/constant.dart';
import 'package:flutter_news_app/utils/keep_page_alive.dart';
import 'package:flutter_news_app/widgets/country_select_dialog.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabList = [
    Tab(
      child: Text('Business'),
    ),
    Tab(
      child: Text('Entertainment'),
    ),
    Tab(
      child: Text('Sports'),
    ),
    Tab(
      child: Text('Health'),
    ),
    Tab(
      child: Text('Technology'),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabList.length,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => CountrySelectDialog(),
                    ).then((value) => setState(() {})),
                    icon: Image.asset(
                        'icons/flags/png/${Constant.countryCode == 'vi' ? 'vn' : Constant.countryCode}.png',
                        package: 'country_icons'),
                  )
                ],
                pinned: true,
                floating: true,
                title: Text('News App'),
                centerTitle: true,
                bottom: TabBar(tabs: _tabList, isScrollable: true),
              )
            ],
            body: TabBarView(children: [
              KeepPageAlive(child: NewsListingScreen(category: 'business')),
              KeepPageAlive(
                  child: NewsListingScreen(category: 'entertainment')),
              KeepPageAlive(child: NewsListingScreen(category: 'sports')),
              KeepPageAlive(child: NewsListingScreen(category: 'health')),
              KeepPageAlive(child: NewsListingScreen(category: 'technology')),
            ]),
          ),
        ));
  }
}
