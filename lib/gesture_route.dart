import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  const GestureRoute();

  @override
  _GestureRouteState createState() => _GestureRouteState();
}

class _GestureRouteState extends State<GestureRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Route'),
      ),
      body: Text('Gesture Route'),
    );
  }
}
