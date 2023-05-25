import 'package:flutter/material.dart';
import 'package:building_layouts/card.dart';
import 'package:building_layouts/about.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CardInfo> _listOfCards = [];
  final String location = 'Oeschinen Lake Campground - Kandersteg, Switzerland';

  @override
  void initState() {
    generateCardInfo();
    super.initState();
  }

  void generateCardInfo() {
    for (int i = 0; i < 10; i++) {
      _listOfCards.add(CardInfo(
        title: 'Oeschinen Lake Campground',
        id: i,
      ));
    }
  }

  void updateCard(CardInfo newCardInfo) {
    setState(() {
      _listOfCards[newCardInfo.id] = newCardInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter building layouts',
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter building layouts')),
          body: ListView.builder(
              itemCount: _listOfCards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCard(
                    cardInfo: _listOfCards[index],
                    onTap: () async {
                      final newCardInfo = await Navigator.push<CardInfo>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AboutPage(cardInfo: _listOfCards[index]),
                        ),
                      );

                      if (newCardInfo != null) {
                        updateCard(newCardInfo);
                      }

                    },
                  ),
                );
              }
          ),
        )
    );
  }
}

class CardInfo {
  final int id;
  String title;
  final String imageUrl;

  CardInfo({
    required this.id,
    required this.title,
    this.imageUrl = 'images/lake.jpg',
  });
}
