import 'package:flutter/material.dart';

import './category_list_page_route.dart';

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
      home: HelloPageRoute(),
    );
  }
}

class HelloPageRoute extends StatefulWidget {
  HelloPageRoute({Key key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<HelloPageRoute> {

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
                      child: Text("Category Page"),
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
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryListPageRoute(),
      ),
    );
  }
}
