import 'package:flutter/material.dart';
import 'package:building_layouts/about.dart';
import 'package:building_layouts/main.dart';

class CustomCard extends StatelessWidget {
  final CardInfo cardInfo;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.cardInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
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
                    child: Text(
                      cardInfo.title,
                      style: const TextStyle(
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

      Widget buttonSection = Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8)
          ),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _buildButtonColumn(color, Icons.call, 'CALL'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
                  ),
                ],
              )
          )
      );

    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            cardInfo.imageUrl,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
        )
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
                    borderRadius: const BorderRadius.all(Radius.circular(64))
                ),
                child: Center(
                    child: Text(
                        '# ${cardInfo.id}',
                        style: const TextStyle(fontSize: 30, color: Colors.white)
                    )
                )
            )
        )
      ],
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