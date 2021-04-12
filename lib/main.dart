import 'package:flutter/material.dart';

import './category_page.dart';

void main() {
  runApp(MopSampleApp());
}

class MopSampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Page',
      home: HelloPage(),
    );
  }
}

class HelloPage extends StatefulWidget {
  HelloPage({Key key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<HelloPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Hello!",
                      style: TextStyle(fontSize: 40.0),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    // TODO: Add Menu Buttons
                    child: ElevatedButton(
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    final _categoryName = "Cake";
    final _categoryIcon = Icons.cake;
    final _categoryColor = Colors.green;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(),
      ),
    );
  }
}
