import 'package:flutter/material.dart';
import 'package:flutter_news_app/utils/constant.dart';

class CountrySelectDialog extends StatelessWidget {
  const CountrySelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final countryList = Constant.countryList;
    return AlertDialog(
      title: Text('Country'),
      content: Container(
        width: 200,
        height: 340,
        child: ListView.builder(
          itemCount: countryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Constant.countryCode = countryList[index]['code']!;
                Navigator.pop(context);
              },
              child: ListTile(
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    countryList[index]['icon']!,
                    package: 'country_icons',
                  ),
                ),
                title: Text(countryList[index]['name']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
