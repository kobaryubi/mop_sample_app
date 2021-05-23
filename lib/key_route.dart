import 'package:flutter/material.dart';

class KeyRoute extends StatefulWidget {
  const KeyRoute();

  @override
  _KeyRouteState createState() => _KeyRouteState();
}

class _KeyRouteState extends State<KeyRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text('Key'),
        ),
      ),
    );
  }
}
