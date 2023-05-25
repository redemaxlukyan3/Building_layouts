import 'package:building_layouts/main.dart';
import 'package:flutter/material.dart';
import 'package:building_layouts/card.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;
  const AboutPage({
    Key? key,
    required this.cardInfo
  }) : super(key: key);


  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late TextEditingController controller;
  late CardInfo cardInfo2;

  @override
  void initState() {

    cardInfo2 = CardInfo(
        id: widget.cardInfo.id,
        title: widget.cardInfo.title,
        imageUrl: widget.cardInfo.imageUrl,
    );

    controller = TextEditingController(text: cardInfo2.title);

    super.initState();
  }

  void save() {
    cardInfo2.title = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter building layouts')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.cardInfo.imageUrl,
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 32),
                  TextField(controller: controller,),
                  ElevatedButton(
                    onPressed: () {
                      save();
                      Navigator.of(context).pop(cardInfo2);
                    },
                    child: const Text('Save'),
                  )
                ],
              ),
            )
          )
        )
      ),
    );
  }
}

/*
class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Flutter building layouts')),
        body: const SafeArea(
          child: Placeholder(),
        ),
      ),
    );
  }
}
 */
