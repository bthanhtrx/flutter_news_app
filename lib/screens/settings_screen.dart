import 'package:flutter/material.dart';
import 'package:flutter_news_app/utils/constant.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String pickCountry = 'Choose a country';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text(pickCountry),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Country'),
                      content: Container(
                        height: 300,
                        width: 200,
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'us';
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('icons/flags/png/us.png',
                                      package: 'country_icons'),
                                ),
                                title: Text('United States'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'jp';
                                print(Constant.countryCode);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('icons/flags/png/jp.png',
                                      package: 'country_icons'),
                                ),
                                title: Text('Japan'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'jp';
                                print(Constant.countryCode);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('icons/flags/png/au.png',
                                      package: 'country_icons'),
                                ),
                                title: Text('Australia'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'jp';
                                print(Constant.countryCode);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('icons/flags/png/de.png',
                                      package: 'country_icons'),
                                ),
                                title: Text('Germany'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'jp';
                                print(Constant.countryCode);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('icons/flags/png/fr.png',
                                      package: 'country_icons'),
                                ),
                                title: Text('France'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.countryCode = 'jp';
                                print(Constant.countryCode);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    'icons/flags/png/vn.png',
                                  ),
                                ),
                                title: Text('Vietnam'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
