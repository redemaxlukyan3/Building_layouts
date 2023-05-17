import 'package:flutter/material.dart';

const List<int> articleNums = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        )
      ),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41', style: TextStyle(color: Colors.white)),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    /*
    Widget circleCounter = Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
          border: new Border.all(color: Colors.black54),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
              bottomLeft: const Radius.circular(40.0),
              bottomRight:const Radius.circular(40.0),
          )
      ),
      child: Center(
        child: Text(
            '# 0.',
            style: TextStyle(fontSize: 30, color: Colors.white)
        )
      )
    );
*/

    Widget buttonSection = Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8)
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: _buildButtonColumn(color, Icons.call, 'CALL'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
            ),
          ],
        )
      )
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView.builder(
          itemCount: articleNums.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(8),
              child: Stack(
                  textDirection: TextDirection.ltr,
                  children: [
                    Image.asset(
                      'images/lake.jpg',
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      right: 16,
                      child: titleSection,
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: buttonSection,
                    ),
                    Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                border: new Border.all(color: Colors.black54),
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                  bottomRight:const Radius.circular(40.0),
                                )
                            ),
                            child: Center(
                                child: Text(
                                    '# ${index}.',
                                    style: TextStyle(fontSize: 30, color: Colors.white)
                                )
                            )
                        )
                    )
                  ]
              )
            );
          }
        ),
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}