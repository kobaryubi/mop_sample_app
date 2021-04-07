import 'package:flutter/material.dart';

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
          color: Colors.greenAccent,
          height: 400.0,
          width: 300.0,
          child: Center(
            child: Text(
              "Hello!",
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
