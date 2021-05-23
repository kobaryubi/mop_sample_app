import 'package:flutter/material.dart';

class GridRoute extends StatefulWidget {
  const GridRoute();

  @override
  _GridRouteState createState() => _GridRouteState();
}

class _GridRouteState extends State<GridRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text('Grid'),
        ),
      ),
    );
  }
}
